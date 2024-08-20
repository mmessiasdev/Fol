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
        child: Padding(
          padding: defaultPaddingHorizon,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                  text: 'Faça Login',
                  color: nightColor,
                  align: TextAlign.start),
              SecundaryText(
                  text:
                      'Compartilhe seus momentos com seus amigos ou com você mesmo.',
                  color: nightColor,
                  align: TextAlign.start),
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
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: SubText(
                              text: "Não tem login? Crie uma conta.",
                              color: nightColor,
                              align: TextAlign.start),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          maxRadius: 40,
                          backgroundColor: FourtyColor,
                          child: GestureDetector(
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
      ),
    );
  }
}
