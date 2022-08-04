import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ozon_app/screens/home_screen.dart';
import 'package:ozon_app/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor));

    return MaterialApp(
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
          fontFamily: 'Lato'),
      home: const HomeScreen(),
    );
  }
}
