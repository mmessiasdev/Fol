import 'package:Foll/component/containersLoading.dart';
import 'package:Foll/component/inputdefault.dart';
import 'package:Foll/component/widgets/logincont.dart';
import 'package:Foll/component/post.dart';
import 'package:Foll/component/widgets/title.dart';
import 'package:Foll/controller/controllers.dart';
import 'package:Foll/model/postsnauth.dart';
import 'package:flutter/material.dart';
import 'package:Foll/component/colors.dart';
import 'package:Foll/component/padding.dart';
import 'package:Foll/component/texts.dart';
import 'package:Foll/service/local/auth.dart';
import 'package:Foll/service/remote/auth.dart';
import 'package:http/http.dart' as http;

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  var client = http.Client();

  String? token;
  String? fname;
  var id;
  bool public = false;

  @override
  void initState() {
    super.initState();
    getString();
  }

  void getString() async {
    var strToken = await LocalAuthService().getSecureToken("token");
    var strFname = await LocalAuthService().getFname("fname");
    var strId = await LocalAuthService().getId("id");

    setState(() {
      token = strToken;
      id = strId;
      fname = strFname;
    });
  }

  TextEditingController content = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  void dispose() {
    content.dispose();
    title.dispose();
    desc.dispose();
    super.dispose();
  }

  void toggleIcon() {
    setState(() {
      public = !public; // Alterna entre os ícones
    });
  }

  Widget ManutentionErro() {
    return ErrorPost(
      text: "Estamos passando por uma manutenção. Entre novamente mais tarde!",
    );
  }

  @override
  Widget build(BuildContext context) {
    return token == null
        ? Padding(
            padding: defaultPaddingHorizon,
            child: ListView(
              children: [
                LoginContent(
                  title: true,
                ),
                const SizedBox(
                  height: 50,
                ),
                FutureBuilder<List<PostsNoAuth>>(
                  future: RemoteAuthService().getPostsNoAuth(),
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
                          return WidgetPosts(
                            plname: render.fname.toString(),
                            title: render.title.toString(),
                            desc: render.content.toString(),
                            updatedAt: "teste",
                            id: render.id.toString(),
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          )
        : Padding(
            padding: defaultPaddingHorizon,
            child: ListView(
              children: [
                DefaultTitle(
                  title: "Seja bem vindo, $fname!",
                  subtitle: "Compartilhe seus momentos com seus amigos ou ",
                  subbuttom: SubTextSized(
                    align: TextAlign.start,
                    fontweight: FontWeight.w600,
                    text: "com você mesmo!",
                    size: 20,
                    color: nightColor,
                  ),
                ),
                Column(
                  children: [
                    InputTextField(
                      title: "",
                      width: double.infinity,
                      fill: true,
                      minLines: 3,
                      textEditingController: content,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              child: Icon(
                                Icons.image,
                                size: 33,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          child: GestureDetector(
                            child: Icon(
                              public == false ? Icons.lock : Icons.lock_open,
                            ),
                            onTap: toggleIcon,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              authController.posting(
                                // selectFile: selectFile!,
                                title: title.text,
                                desc: desc.text,
                                content: content.text,
                                public: public,
                                profileId: int.parse(id),
                              );
                            });
                          },
                          child: CircleAvatar(
                            maxRadius: 40,
                            backgroundColor: FourtyColor,
                            child: Icon(
                              Icons.arrow_right_alt,
                              color: lightColor,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder<List<PostsNoAuth>>(
                  future: RemoteAuthService().getPostsNoAuth(),
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
