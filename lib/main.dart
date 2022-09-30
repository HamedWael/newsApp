import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/home_layout.dart';
import 'package:news_app/shared/components/constants.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/styles/colors.dart';
import 'package:news_app/test.dart';

import 'modules/settingsScreen/theme_cubit/cubit.dart';
import 'modules/settingsScreen/theme_cubit/states.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CasheHelper.init();

  runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (BuildContext context) => AppThemeCubit()
      ..changeTheme(
          fromShared: CasheHelper.getThemeData('isDark')
      )
    // ..getArabicNews(
    //   context: context,
    //   fromShared: CasheHelper.getLangData(),
    // ),
        ),
        BlocProvider(create: (context) => AppCubit()..getNews(
            url: 'v2/top-headlines',
            key: 'language',
            value: 'en'
        ),
        ),
      ],
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
                    fontWeight: FontWeight.w500,
                ),
                subtitle1: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                subtitle2: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              appBarTheme: AppBarTheme(
                titleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
                elevation: 0,
                backgroundColor: offWhiteColor,
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.dark,
                  systemNavigationBarColor: Colors.transparent,
                ),
                iconTheme: const IconThemeData(
                  color: Colors.black
                ),
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
              drawerTheme: DrawerThemeData(
                backgroundColor: offWhiteColor
              ),

            ),
            darkTheme: ThemeData(
              primaryColor: Colors.white,
              primarySwatch: Colors.deepPurple,
              canvasColor: Colors.transparent,
              scaffoldBackgroundColor: darkBackColor,
              shadowColor: Colors.black54,
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
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                subtitle1: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                subtitle2: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
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
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarBrightness: Brightness.dark,
                  statusBarIconBrightness: Brightness.light,
                  systemNavigationBarColor: Colors.transparent,
                ),
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
              drawerTheme: DrawerThemeData(
                  backgroundColor: darkBackColor
              ),
            ),
            themeMode: AppThemeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home:
                Directionality(
                textDirection: AppThemeCubit.get(context).isArabic ? TextDirection.rtl : TextDirection.ltr,
                child: NewsHome(),
                ),
          );
        },
      ),
    );
  }
}

