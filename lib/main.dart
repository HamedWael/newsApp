import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/home_layout.dart';
import 'package:news_app/shared/components/constants.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/styles/colors.dart';

import 'modules/settingsScreen/theme_cubit/cubit.dart';
import 'modules/settingsScreen/theme_cubit/states.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
    return BlocProvider(
      create: (BuildContext context) => AppThemeCubit()..changeTheme(),
      child: BlocConsumer<AppThemeCubit, AppThemeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.black,
              primarySwatch: Colors.deepPurple,
              canvasColor: Colors.transparent,
              scaffoldBackgroundColor: offWhiteColor,
              shadowColor: Colors.grey.shade200,
              textTheme: const TextTheme(
                headline1: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
                headline2: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                headline3: TextStyle(
                    fontSize: 8,
                    color: Colors.black
                ),
                bodyText1: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                ),
                bodyText2: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                ),
              ),
              appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
                elevation: 0,
                backgroundColor: Colors.black,
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
            darkTheme: ThemeData(
              primaryColor: Colors.white,
              primarySwatch: Colors.deepPurple,
              canvasColor: Colors.transparent,
              scaffoldBackgroundColor: darkBackColor,
              shadowColor: Colors.black,
              textTheme: const TextTheme(
                headline1: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
                headline2: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                headline3: TextStyle(
                  fontSize: 8,
                  color: Colors.white,
                ),
                bodyText1: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),
                bodyText2: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),

              ),
              appBarTheme: AppBarTheme(
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
                elevation: 0,
                backgroundColor: darkBackColor,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.shifting,
                elevation: 24,
                backgroundColor: darkBackColor,
                selectedIconTheme: const IconThemeData(
                    size: 40
                ),
                selectedLabelStyle: const TextStyle(
                  fontSize: 16,
                ),
                unselectedIconTheme: const IconThemeData(
                    size: 28
                ),
                unselectedLabelStyle: const TextStyle(
                    fontSize: 14
                ),
              ),
            ),
            themeMode:
            AppThemeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: NewsHome(),
          );
        },
      ),
    );
  }
}

