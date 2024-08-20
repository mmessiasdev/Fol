import 'package:Bloguee/component/buttomdefault.dart';
import 'package:Bloguee/component/colors.dart';
import 'package:Bloguee/component/inputdefault.dart';
import 'package:Bloguee/component/inputlight.dart';
import 'package:Bloguee/component/padding.dart';
import 'package:Bloguee/component/texts.dart';
import 'package:Bloguee/controller/controllers.dart';
import 'package:Bloguee/extention/string_extention.dart';
import 'package:flutter/material.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  bool checked = false;

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryText(
                text: 'Faça Login',
                color: nightColor,
                align: TextAlign.start),
            RichDefaultText(
                wid: SubTextSized(
                  align: TextAlign.start,
                  fontweight: FontWeight.w600,
                  text: "com você mesmo.",
                  size: 20,
                ),
                text: "Compartilhe seus momentos com seus amigos ou ",
                align: TextAlign.start,
                size: 20,
                fontweight: FontWeight.w300),
            const SizedBox(height: 40),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  InputTextField(
                    title: 'Email',
                    textEditingController: emailController,
                    validation: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Esse campo não pode ficar vazio.";
                      } else if (!value.isValidEmail) {
                        return "Insira um email válido.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  InputTextField(
                    title: 'Password',
                    obsecureText: true,
                    maxLines: 1,
                    // icon: Icon(Icons.lock),
                    textEditingController: passwordController,
                    validation: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Esse campo não pode ficar vazio.";
                      }
                      return null;
                    },
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
                                onTap: () {},
                                child: SubTextSized(
                                  align: TextAlign.start,
                                  color: FourtyColor,
                                  size: 16,
                                  text: "Crie uma conta.",
                                  fontweight: FontWeight.w600,
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
                            Icons.login,
                            color: lightColor,
                          ),
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              authController.signIn(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
