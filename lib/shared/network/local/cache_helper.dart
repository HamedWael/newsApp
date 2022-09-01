import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class CasheHelper {
  static late SharedPreferences sharedPrefrences;

  static init() async {
    sharedPrefrences = await SharedPreferences.getInstance();
  }

  static Future<bool> putThemeData(
      @required String key,
      @required bool value
      ) async
   {
    return await sharedPrefrences.setBool(key, value);
   }


  static Future<bool> putLangData(
      @required bool value
      ) async
  {
    return await sharedPrefrences.setBool('isArabic', value);
  }

  static bool? getThemeData(
      @required String key,
      )
  {
    return sharedPrefrences.getBool(key);
  }


  static bool? getLangData()
  {
    return sharedPrefrences.getBool('isArabic');
  }







}