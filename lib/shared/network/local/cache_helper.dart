import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class CasheHelper {
  static late SharedPreferences sharedPrefrences;

  static init() async {
    sharedPrefrences = await SharedPreferences.getInstance();
  }


}