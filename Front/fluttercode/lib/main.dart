import 'package:Bloguee/component/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:Bloguee/route/route.dart';
import 'package:Bloguee/route/page.dart';
import 'package:flutter/services.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await dotenv.load(fileName: ".env");
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );

  OneSignal.initialize("f49b725b-18ff-4f6e-b7b1-9bcadb116e48");

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: lightColor, // cor da barra superior
    statusBarIconBrightness: Brightness.dark, // ícones da barra superior
    systemNavigationBarColor: SixthColor, // cor da barra inferior
    systemNavigationBarIconBrightness:
        Brightness.dark, // ícones da barra inferior
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPage.list,
      initialRoute: AppRoute.dashboard,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      builder: EasyLoading.init(),
      theme: ThemeData(fontFamily: 'Montserrat'),
    );
  }
}
