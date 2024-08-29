import 'package:Bloguee/component/padding.dart';
import 'package:Bloguee/component/widgets/inputRegister.dart';
import 'package:Bloguee/component/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:Bloguee/component/colors.dart';
import 'package:Bloguee/component/widgets/header.dart';
import 'package:Bloguee/component/texts.dart';
import 'package:Bloguee/controller/controllers.dart';
import 'package:Bloguee/extention/string_extention.dart';

import '../../../component/defaultTitleButtom.dart';
import '../../../component/inputdefault.dart';
import 'signin.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: defaultPaddingHorizonTop,
          child: ListView(
            children: [
              DefaultTitle(
                title: "Crie sua conta.",
                subtitle: "Crie um conta para compatilhar seus momentos!",
              ),
              Column(
                children: [
                  InputRegister(
                    ftitle: true,
                    textController: emailController,
                    title: "Digite seu email:",
                    subdesc:
                        "Compartilhe seus momentos com seus amigos ou com você mesmo.",
                  ),
                  InputRegister(
                    aligh: TextAlign.start,
                    ftitle: false,
                    textController: emailController,
                    title: "Escolha seu nametag:",
                    subdesc:
                        "Compartilhe seus momentos com seus amigos ou com você mesmo.",
                  ),
                  InputRegister(
                    ftitle: true,
                    textController: passwordController,
                    title: "Digite sua senha:",
                    subdesc:
                        "Compartilhe seus momentos com seus amigos ou com você mesmo.",
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: RichDefaultText(
                          wid: GestureDetector(
                            onTap: () {
                              (
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                  ),
                                ),
                              );
                            },
                            child: SubTextSized(
                              align: TextAlign.start,
                              color: FourtyColor,
                              size: 16,
                              text: "Crie uma conta.",
                              fontweight: FontWeight.w600,
                              tdeco: TextDecoration.underline,
                            ),
                          ),
                          text: "Não tem login? ",
                          align: TextAlign.start,
                          size: 16,
                          fontweight: FontWeight.normal)),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    maxRadius: 40,
                    backgroundColor: FourtyColor,
                    child: GestureDetector(
                      child: Icon(
                        Icons.arrow_right_alt,
                        color: lightColor,
                      ),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          authController.signIn(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
