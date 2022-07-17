import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/layout/home_layout.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark
      )
  );

  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        canvasColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.shifting,
          elevation: 24,
          backgroundColor: Colors.white,
          selectedIconTheme: IconThemeData(
            size: 40
          ),
          selectedLabelStyle: TextStyle(
            fontSize: 16,
          ),
          unselectedIconTheme: IconThemeData(
            size: 28
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14
          ),
        ),
      ),
      home: const NewsHome(),
    );
  }
}

