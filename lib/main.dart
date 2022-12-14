import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'src/main/pages/main_page.dart';
import 'utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ozon Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          textTheme: TextTheme(
              bodyText2:
                  TextStyle(color: AppColors.primaryColor, fontSize: 15)),
          primarySwatch: Colors.indigo,
          backgroundColor: AppColors.backgroundColor,
          highlightColor: AppColors.primaryColor,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          fontFamily: 'GT Eesti Pro Display'),
      home: const MainPage(),
    );
  }
}
