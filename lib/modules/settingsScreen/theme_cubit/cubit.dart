import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/settingsScreen/theme_cubit/states.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class AppThemeCubit extends Cubit<AppThemeStates>
{
  AppThemeCubit() : super(AppThemeInitialState());

  static AppThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeTheme ({fromShared}){
    if (fromShared != null)
    {
      isDark = fromShared;
      emit(AppThemeChangeState());
    } else
   {
     isDark = !isDark;
     CasheHelper.putThemeData('isDark', isDark).then((value)
         {
           emit(AppThemeChangeState());
         }
     );
   }
  }

  bool isArabic = false;

  void getArabicNews ({fromShared, required context}) {
    if (fromShared != null)
    {
      isArabic = fromShared;
      emit(NewsArGetState());
    } else
    {
      isArabic = !isArabic;
      CasheHelper.putLangData(isArabic).then((value) {
        emit(NewsArGetState());
      }
      );
    }
    isArabic ?
    AppCubit.get(context).getNews(url: 'v2/top-headlines', key: 'language', value: 'ar')
        :
    AppCubit.get(context).getNews(url: 'v2/top-headlines', key: 'language', value: 'en') ;
  }

}