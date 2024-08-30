import 'package:Bloguee/component/padding.dart';
import 'package:Bloguee/component/widgets/inputRegister.dart';
import 'package:Bloguee/component/widgets/title.dart';
import 'package:Bloguee/view/dashboard/screen.dart';
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
      backgroundColor: lightColor,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: defaultPaddingHorizonTop,
              child: DefaultTitle(
                buttom: true,
                title: "Crie sua conta!",
                subtitle: "Para se conectar com seus amigos ",
                subbuttom: SubTextSized(
                  align: TextAlign.start,
                  fontweight: FontWeight.w600,
                  text: "ou com você mesmo.",
                  size: 20,
                  color: nightColor,
                ),
              ),
            ),
            Column(
              children: [
                InputRegister(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                  padding: defaultPaddingHorizon,
                  ftitle: true,
                  textController: emailController,
                  title: "Digite seu email:",
                  subdesc:
                      "Uma rede focada em todas compatilhamento externo em você.",
                  subdescwid: "Para você.",
                ),
                InputRegister(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  padding: defaultPaddingHorizon,
                  ftitle: false,
                  textController: emailController,
                  title: "Digite seu email:",
                  subdesc:
                      "Uma rede focada em todas compatilhamento externo em você.",
                  subdescwid: "Para você.",
                ),
                InputRegister(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                  padding: defaultPaddingHorizon,
                  ftitle: true,
                  textController: emailController,
                  title: "Digite seu email:",
                  subdesc:
                      "Uma rede focada em todas compatilhamento externo em você.",
                  subdescwid: "Para você.",
                ),
              ],
            ),
            const SizedBox(height: 40),
            Padding(
              padding: defaultPaddingHorizon,
              child: Row(
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
                                    builder: (context) => const DashboardScreen(),
                                  ),
                                ),
                              );
                            },
                            child: SubTextSized(
                              align: TextAlign.start,
                              color: FourtyColor,
                              size: 16,
                              text: "Entre",
                              fontweight: FontWeight.w600,
                              tdeco: TextDecoration.underline,
                            ),
                          ),
                          text: "Já tem um login? ",
                          align: TextAlign.start,
                          size: 16,
                          fontweight: FontWeight.normal)),
                  const SizedBox(
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
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
