import 'package:Foll/view/account/auth/signin.dart';
import 'package:get/get.dart';
import 'package:Foll/route/route.dart';
import 'package:Foll/view/dashboard/binding.dart';
import 'package:Foll/view/dashboard/screen.dart';

class AppPage {
  static var list = [
    GetPage(
        name: AppRoute.dashboard,
        page: () => const DashboardScreen(),
        binding: DashboardBinding()),
    GetPage(
      name: AppRoute.loginIn,
      page: () => const SignInScreen(),
    ),
  ];
}
