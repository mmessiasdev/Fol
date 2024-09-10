import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:Bloguee/service/local/auth.dart';
import 'package:Bloguee/service/remote/auth.dart';
import '../model/user.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rxn<User> user = Rxn<User>();
  String? urlEnv = dotenv.env["BASEURL"];

  @override
  void onInit() async {
    super.onInit();
  }

  void signUp({
    required String fname,
    required String lname,
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      // Mostrar loading
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );

      // Chamar o serviço de autenticação para registrar o usuário
      var result = await RemoteAuthService().signUp(
        email: email,
        username: username,
        password: password,
      );

      // Verificar se a resposta foi bem-sucedida
      if (result.statusCode == 200) {
        // Extrair o token JWT da resposta
        String token = json.decode(result.body)['jwt'];

        // Fazer a requisição para criar o perfil
        var userResult = await RemoteAuthService().createProfile(
          fname: fname,
          lname: lname,
          token: token,
        );

        // Verificar se a criação do perfil foi bem-sucedida
        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          EasyLoading.showSuccess("Conta criada. Confirme suas informações.");
          // Redirecionar para a tela de login
          Navigator.of(Get.overlayContext!).pushReplacementNamed('/');
        } else {
          // Mostrar erro se a criação do perfil falhou
          EasyLoading.showError('Alguma coisa deu errado. Tente novamente!');
        }
      } else {
        // Mostrar erro se o registro do usuário falhou
        EasyLoading.showError('Alguma coisa deu errado. Tente novamente!');
      }
    } catch (e) {
      // Mostrar erro em caso de exceção
      EasyLoading.showError('Alguma coisa deu errado. Tente novamente!');
    } finally {
      // Fechar o loading
      EasyLoading.dismiss();
    }
  }

  void signIn({required String email, required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      var result = await RemoteAuthService().signIn(
        email: email,
        password: password,
      );

      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await RemoteAuthService().getProfile(token: token);
        if (userResult.statusCode == 200) {
          var email = jsonDecode(userResult.body)['email'];
          var lname = jsonDecode(userResult.body)['lname'];
          var fname = jsonDecode(userResult.body)['fname'];
          var id = jsonDecode(userResult.body)['id'];
          user.value = userFromJson(userResult.body);
          await LocalAuthService().storeToken(token);
          await LocalAuthService()
              .storeAccount(email: email, lname: lname, id: id, fname: fname);
          EasyLoading.showSuccess("Bem vindo ao Bloguee");
          Navigator.of(Get.overlayContext!).pushReplacementNamed('/');
        } else {
          EasyLoading.showError(
              'Alguma coisa deu errado. Tente novamente mais tarde...');
        }
      } else {
        EasyLoading.showError('Email ou senha incorreto.');
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Alguma coisa deu errado. Tente novamente!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void posting({
    required String title,
    required String desc,
    required String content,
    required int profileId,
    required bool public,
    // required int chunkId,
    String? fileName,
    // List<int>? selectFile
  }) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      var token = await LocalAuthService().getSecureToken("token");
      var result = await RemoteAuthService().addPost(
        token: token.toString(),
        title: title,
        desc: desc,
        content: content,
        profileId: profileId,
        public: public,
      );
      EasyLoading.showSuccess("Seu relato poster enviado.");
      Navigator.of(Get.overlayContext!).pushReplacementNamed('/');

      // if (result.statusCode == 200) {
      //   int postId = json.decode(result.body)['id'];
      //   var url = Uri.parse('$urlEnv/upload');
      //   var request = http.MultipartRequest("POST", url);
      //   request.files.add(await http.MultipartFile.fromBytes(
      //     'files',
      //     selectFile!,
      //     contentType: MediaType('application', 'pdf'),
      //     filename: fileName ?? "Bloguee File",
      //   ));

      //   request.files.add(await http.MultipartFile.fromString("ref", "post"));
      //   request.files
      //       .add(await http.MultipartFile.fromString("refId", "${postId}"));

      //   request.files
      //       .add(await http.MultipartFile.fromString("field", "files"));

      //   request.headers.addAll({"Authorization": "Bearer $token"});
      //   request.send().then((response) {
      //     if (response.statusCode == 200) {
      //       print("FileUpload Successfuly");
      //     } else {
      //       print("FileUpload Error");
      //     }
      //   });
      // }
    } catch (e) {
      print(e);
      EasyLoading.showError('Alguma coisa deu errado.');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signOut() async {
    user.value = null;
    await LocalAuthService().clear();
    Navigator.of(Get.overlayContext!).pushReplacementNamed('/');
  }
}
