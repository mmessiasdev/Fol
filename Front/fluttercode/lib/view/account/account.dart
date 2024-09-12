import 'package:Foll/component/defaultButton.dart';
import 'package:Foll/component/padding.dart';
import 'package:Foll/component/texts.dart';
import 'package:Foll/component/widgets/infotext.dart';
import 'package:Foll/component/widgets/title.dart';
import 'package:Foll/service/local/auth.dart';
import 'package:flutter/material.dart';
import 'package:Foll/component/widgets/header.dart';
import 'package:Foll/controller/controllers.dart';

import '../../component/defaultTitleButtom.dart';
import '../../component/colors.dart';
import '../../component/infoinputlogin.dart';
import 'auth/signin.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  var email;
  var lname;
  var id;
  var token;

  @override
  void initState() {
    super.initState();
    getString();
  }

  void getString() async {
    var strEmail = await LocalAuthService().getEmail("email");
    var strFull = await LocalAuthService().getLname("lname");
    var strId = await LocalAuthService().getId("id");
    var strToken = await LocalAuthService().getSecureToken("token");

    setState(() {
      email = strEmail.toString();
      lname = strFull.toString();
      id = strId.toString();
      token = strToken.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(token);

    return Container(
      color: lightColor,
      child: Padding(
        padding: defaultPaddingHorizon,
        child: ListView(
          children: [
            DefaultTitle(
              buttom: true,
              title: "Seu perfil.",
            ),
            Column(
              children: [
                InfoText(title: "Nome:", stitle: lname == "null" ? "" : lname),
                SizedBox(
                  height: 35,
                ),
                InfoText(title: "Email:", stitle: email == "null" ? "" : email),
                SizedBox(
                  height: 70,
                ),
                DefaultTitleButton(
                  title: email == "null" ? "Entrar na conta" : "Sair da conta",
                  onClick: () {
                    if (token != "null") {
                      authController.signOut();
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    }
                  },
                  color: FifthColor,
                  iconColor: lightColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
