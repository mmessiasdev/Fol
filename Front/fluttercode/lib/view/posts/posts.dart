import 'package:Bloguee/component/containersLoading.dart';
import 'package:Bloguee/component/logincont.dart';
import 'package:Bloguee/component/post.dart';
import 'package:Bloguee/model/postsnauth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Bloguee/component/colors.dart';
import 'package:Bloguee/component/header.dart';
import 'package:Bloguee/component/padding.dart';
import 'package:Bloguee/component/texts.dart';
import 'package:Bloguee/service/local/auth.dart';
import 'package:Bloguee/service/remote/auth.dart';
import 'package:Bloguee/view/posts/create/createpost.dart';
import 'package:http/http.dart' as http;

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  var client = http.Client();

  String? token;

  @override
  void initState() {
    super.initState();
    getString();
  }

  void getString() async {
    var strToken = await LocalAuthService().getSecureToken("token");

    setState(() {
      token = strToken;
    });
  }

  @override
  Widget build(BuildContext context) {
    return token == null
        ? Padding(
            padding: defaultPaddingHorizon,
            child: ListView(
              children: [
                const LoginContent(),
                SizedBox(
                  height: 50,
                ),
                FutureBuilder<List<PostsNoAuth>>(
                  future: RemoteAuthService().getPostsNoAuth(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const PostsLoading();
                    } else if (snapshot.hasError) {
                      return Center(
                        child: ErrorPost(
                          text:
                              "Estamos passando por uma manutenção. Entre novamente mais tarde!",
                        ),
                      );
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
                              plname: render.fname.toString(),
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
              ],
            ),
          )
        : Padding(
            padding: defaultPaddingHorizon,
            child: Column(
              children: [
                FutureBuilder<List<PostsNoAuth>>(
                  future: RemoteAuthService().getPostsNoAuth(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const PostsLoading();
                    } else if (snapshot.hasError) {
                      return Center(
                        child: ErrorPost(
                          text:
                              "Estamos passando por uma manutenção. Entre novamente mais tarde!",
                        ),
                      );
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
                              plname: render.fname.toString(),
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
              ],
            ),
          );
  }
}
