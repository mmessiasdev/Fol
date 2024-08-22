import 'package:Bloguee/component/padding.dart';
import 'package:Bloguee/component/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:Bloguee/component/widgets/header.dart';
import 'package:Bloguee/service/local/auth.dart';
import 'package:Bloguee/view/account/account.dart';
import 'package:Bloguee/view/account/auth/signin.dart';
import 'package:Bloguee/view/home/search/searchpost.dart';

import '../../component/colors.dart';
import '../../component/texts.dart';

class MyContents extends StatefulWidget {
  MyContents({Key? key}) : super(key: key);

  @override
  State<MyContents> createState() => _MyContentsState();
}

class _MyContentsState extends State<MyContents> {
  var email;
  var lname;
  var id;
  var token;
  var chunkId;

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
    return SafeArea(
        child: Padding(
      padding: defaultPaddingHorizon,
      child: Column(
        children: [
          DefaultTitle(
            title: "Seu diário.",
            align: TextAlign.start,
            subtitle: "Aqui ficam localizada todas suas postagens ",
            subbuttom: SubTextSized(
              fontweight: FontWeight.w600,
              text: "públicas ou não.",
              size: 20,
              color: nightColor,
            ),
          ),
          // MainHeader(
          //     title: lname == null ? "Login" : lname,
          //     onClick: () => lname == "null"
          //         ? (Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => SignInScreen(),
          //             ),
          //           ))
          //         : (Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => AccountScreen(),
          //             ),
          //           ))),
        ],
      ),
    ));
  }
}
