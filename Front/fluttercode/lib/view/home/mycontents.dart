import 'package:Bloguee/component/containersLoading.dart';
import 'package:Bloguee/component/padding.dart';
import 'package:Bloguee/component/post.dart';
import 'package:Bloguee/component/widgets/title.dart';
import 'package:Bloguee/model/postsnauth.dart';
import 'package:Bloguee/model/profiles.dart';
import 'package:Bloguee/service/remote/auth.dart';
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
  var fname;
  var profileId;
  var token;
  var chunkId;

  @override
  void initState() {
    super.initState();
    getString();
  }

  void getString() async {
    var strEmail = await LocalAuthService().getEmail("email");
    var strFname = await LocalAuthService().getFname("fname");
    var strFull = await LocalAuthService().getLname("lname");
    var strId = await LocalAuthService().getId("id");
    var strToken = await LocalAuthService().getSecureToken("token");

    setState(() {
      email = strEmail.toString();
      lname = strFull.toString();
      fname = strFname.toString();
      profileId = strId.toString();
      token = strToken.toString();
    });
  }

  Widget ManutentionErro() {
    return ErrorPost(
      text: "Estamos passando por uma manutenção. Entre novamente mais tarde!",
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: defaultPaddingHorizon,
      child: ListView(
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
          FutureBuilder<List<Posts>>(
            future: RemoteAuthService()
                .getMyPosts(token: token, profileId: profileId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const PostsLoading();
              } else if (snapshot.hasError) {
                return Center(child: ManutentionErro());
              } else if (snapshot.hasData) {
                var posts = snapshot.data!;
                return ListView.builder(
                  itemCount: posts.length,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var render = posts[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: WidgetPosts(
                        plname: fname + " " + lname,
                        title: render.title.toString(),
                        desc: render.content.toString(),
                        updatedAt: "teste",
                        id: render.id.toString(),
                      ),
                    );
                  },
                );
              }
              return SizedBox.shrink();
            },
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
