import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/settingsScreen/theme_cubit/states.dart';
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

  void getArabicNews ({cubit, fromShared}) {
    if (fromShared != null)
    {
      isArabic = fromShared;
      emit(NewsArGetState());
    } else
    {
      isArabic = !isArabic;
      CasheHelper.putThemeData('isArabic', isArabic).then((value) {
        emit(NewsArGetState());
      }
      );
    }
    isArabic ? cubit.getNews('ar') : cubit.getNews('en');
  }

}