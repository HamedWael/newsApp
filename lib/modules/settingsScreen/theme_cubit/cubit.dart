import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/settingsScreen/theme_cubit/states.dart';

class AppThemeCubit extends Cubit<AppThemeStates>
{
  AppThemeCubit() : super(AppThemeInitialState());

  static AppThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeTheme (){
    isDark = !isDark;
    print(isDark);
    emit(AppThemeChangeState());
  }

  bool isArabic = false;

  void getArabicNews (value, cubit) {
    value ? cubit.getNews('ar') : cubit.getNews('en');
    isArabic = value;
    emit(NewsArGetState());
  }

}