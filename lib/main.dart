import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_dimytect/component/auth/login_view.dart';
import 'package:interview_dimytect/utils/utility.dart';
import 'package:interview_dimytect/widget/text_label.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Aplikasi Interview Dimy Tech',
        theme: ThemeData(
          fontFamily: 'InterRegular',
        ),
        locale: Get.deviceLocale,
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    loadingNextRoute();
    super.initState();
  }

  void loadingNextRoute() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll(Login());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utility.baseColor2,
      body: Align(
        alignment: Alignment.center,
        child: TextLabel(text: "Dimy Tech Application"),
      ),
    );
  }
}
