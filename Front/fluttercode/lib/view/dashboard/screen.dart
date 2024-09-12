import 'package:Foll/service/local/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:Foll/view/posts/posts.dart';
import 'package:get/get.dart';
import 'package:Foll/component/colors.dart';
import 'package:Foll/controller/dashboard.dart';
import 'package:Foll/view/home/mycontents.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var token;

  @override
  void initState() {
    super.initState();
    getString();
  }

  void getString() async {
    var strToken = await LocalAuthService().getSecureToken("token");

    setState(() {
      token = strToken.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SizedBox(
        child: GetBuilder<DashboardController>(
          builder: (controller) => Scaffold(
            backgroundColor: lightColor,
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: [
                  PostsScreen(),
                  MyContents(),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: 50,
              decoration: BoxDecoration(
                color: SixthColor,
              ),
              child: SnakeNavigationBar.color(
                snakeShape: SnakeShape.rectangle,
                backgroundColor: SixthColor,
                unselectedItemColor: nightColor,
                showUnselectedLabels: true,
                selectedItemColor: OffColor,
                snakeViewColor: SixthColor,
                currentIndex: controller.tabIndex,
                onTap: (val) {
                  controller.updateIndex(val);
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home_filled)),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.lock_rounded),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
