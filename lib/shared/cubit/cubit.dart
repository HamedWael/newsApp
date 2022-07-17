import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/modules/homeScreen/homeScreen.dart';
import 'package:news_app/modules/popularNewsScreen/popularNewsScreen.dart';
import 'package:news_app/modules/searchScreen/searchScreen.dart';
import 'package:news_app/modules/settingsScreen/settingsScreen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<GButton> bottomItems = [
    const GButton(
      icon: Icons.home,
      text: 'Home',
    ),
    const GButton(
      icon: Icons.whatshot_outlined,
      text: 'Popular News',
    ),
    const GButton(
      icon: Icons.search,
      text: 'Search',
    ),
    const GButton(
      icon: Icons.settings,
      text: 'Settings',
    ),
  ];

  List<Widget> screens = [
    HomeScreen(),
    PopularNewsScreen(),
    SearchScreen(),
    SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(BottomNavBarState());
  }

  List<dynamic> popularNews = [];

  void getPopular(){

    emit(PopularNewsLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          //'sortBy' : 'popularity',
          'country':'eg',
          'category' : 'science',
          'apiKey' : '86a9fbc5cd754826a6b48c93f4055a8b',
        }
    ).then((value) {
      popularNews = value.data['articles'];
      print(popularNews[0]['title']);
      emit(PopularNewsGetSuccessState());
    }
    ).catchError((error) {
      print('error is $error');
      emit(PopularNewsGetErrorState(error.toString()));
    });
  }

}