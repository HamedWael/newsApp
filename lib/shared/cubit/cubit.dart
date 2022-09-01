import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/modules/homeScreen/homeScreen.dart';
import 'package:news_app/modules/popularNewsScreen/popularNewsScreen.dart';
import 'package:news_app/modules/searchScreen/searchScreen.dart';
import 'package:news_app/modules/settingsScreen/settingsScreen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

import '../../modules/settingsScreen/theme_cubit/cubit.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<GButton> bottomItems (context) {
    List<GButton> bottomItem = [
      GButton(
        icon: Icons.home,
        text: AppThemeCubit.get(context).isArabic ? 'الصفحة الرئيسية' : 'Home',
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      GButton(
        icon: Icons.search,
        text: AppThemeCubit.get(context).isArabic ? 'بحث' : 'Search',
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      GButton(
        icon: Icons.settings,
        text: AppThemeCubit.get(context).isArabic ? 'الإعدادات' : 'Settings',
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
      ),

    ];
    return bottomItem;
  }

  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    //SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(BottomNavBarState());
  }

  List<dynamic> news = [];

  List<dynamic> search = [];

  int selectedItem = 0;

  void getNews({required String key, required String value, required String url}){

    news = [];

    emit(NewsLoadingState());

    DioHelper.getData(
        url: url,
        query: {
          //https://newsapi.org/v2/top-headlines?language=ar&apiKey=86a9fbc5cd754826a6b48c93f4055a8b
          key : value,
          'apiKey' : '86a9fbc5cd754826a6b48c93f4055a8b',
        }
    ).then((value) {
      news = value.data["articles"];
      //print(news[10]);
      emit(NewsGetSuccessState());
    }
    ).catchError((error) {
      print('error is $error');
      emit(NewsGetErrorState(error.toString()));
    });
  }

  void getSearchNews({required String key, required String value, required String url}){

    search = [];

    emit(SearchNewsLoadingState());

    DioHelper.getData(
        url: url,
        query: {
          //https://newsapi.org/v2/top-headlines?language=ar&apiKey=86a9fbc5cd754826a6b48c93f4055a8b
          key : value,
          'apiKey' : '86a9fbc5cd754826a6b48c93f4055a8b',
        }
    ).then((value) {
      search = value.data["articles"];
      //print(news[10]);
      emit(SearchNewsGetSuccessState());
    }
    ).catchError((error) {
      print('error is $error');
      emit(SearchNewsGetErrorState(error.toString()));
    });
  }

  void selectItem (index)
  {
    selectedItem = index;

    emit(NewsSelectItemState());
  }





}