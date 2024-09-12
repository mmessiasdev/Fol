import 'package:get/get.dart';
import 'package:Foll/controller/auth.dart';
import 'package:Foll/controller/dashboard.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(AuthController());
  }
}