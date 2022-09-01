import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/styles/colors.dart';

import '../../modules/detailesScreen/detailesScreen.dart';
import '../../modules/searchScreen/searchScreen.dart';
import '../../modules/settingsScreen/theme_cubit/cubit.dart';
import '../../modules/settingsScreen/theme_cubit/states.dart';

void navigateTo (context, page){
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

Widget newsListBuilder ({required list, required context, index}){
  return Container(
    color: AppCubit.get(context).selectedItem == index ? Theme.of(context).shadowColor : null,
    child: InkWell(
      onTap: (){
        // AppCubit.get(context).selectItem(index);
        // navigateTo(context, DetailesScreen(list));
      },
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          Container(
            width: double.infinity,
            height: 120,
            margin: const EdgeInsets.only(left: 40, bottom: 24, top: 24, right: 40),
            padding: const EdgeInsetsDirectional.only(end: 32),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadiusDirectional.only(topEnd: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor,
                  blurRadius: 10
                ),
              ]
            ),
            child: Row(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  width: 104,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: const BorderRadiusDirectional.only(topEnd: Radius.circular(40)),
                  ),
                  child: Image.network(
                    '${list['urlToImage']}',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${list['title']}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: backLightColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          '${list['source']['name']}',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 12,
                            color: Theme.of(context).primaryColor,
                          ),
                          const SizedBox(width: 4,),
                          Text(
                            '${list['publishedAt']} UTC',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            margin: const EdgeInsetsDirectional.only(end: 24),
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor,
                  blurRadius: 15
                )
              ]
            ),
            child: Icon(
                Icons.arrow_forward_ios,
                color: mainPurpleColor,
                size: 18,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget app_Bar (context, @required title){
  return Container(
    padding: const EdgeInsets.only(left: 24, right: 24, top: 40, bottom: 8),
    //color: offWhiteColor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$title',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: 48,
              height: 48,
              child: DayNightSwitcherIcon(
                isDarkModeEnabled: AppThemeCubit.get(context).isDark,
                onStateChanged: (value) {
                  AppThemeCubit.get(context).changeTheme();
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              // width: 40,
              // height: 40,
              child: IconButton(
                icon: Text(
                    AppThemeCubit().isArabic ? 'en' : 'ع',
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                onPressed: ()
                {
                  AppThemeCubit.get(context).getArabicNews(context: context);
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: mainPurpleColor,
                  size: 28,
                ),
                onPressed: (){},
              ),
            ),
            SizedBox(width: 12,),
            Container(
              alignment: Alignment.center,
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                border: Border.all(
                  color: mainPurpleColor,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  color: mainPurpleColor,
                  size: 18,
                ),
                onPressed: (){},
              ),
            ),
          ],
        ),

      ],
    ),
  );
}

appBar (context){
  return AppBar(
    title: Text(
      'NEWZEUM',
      style: Theme.of(context).textTheme.bodyText1,
    ),
    titleSpacing: 8,
    toolbarHeight: 64,
    actions: [
      Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 40,
            height: 40,
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: mainPurpleColor,
                size: 28,
              ),
              onPressed: (){
                navigateTo(context, SearchScreen());
              },
            ),
          ),
          SizedBox(width: 12,),
        ],
      ),
    ],
  );
}

Widget bottomNavBar (context){
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(48),
        boxShadow: [
          BoxShadow(
              blurRadius: 15,
              color: Theme.of(context).shadowColor
          ),
        ]
    ),
    child: GNav(
      gap: 8,
      padding: const EdgeInsets.all(8),
      iconSize: 32,
      selectedIndex: AppCubit.get(context).currentIndex,
      color: mainPurpleColor,
      activeColor: offWhiteColor,
      tabBackgroundColor: mainPurpleColor,
      tabs: AppCubit.get(context).bottomItems(context),
      onTabChange: (index){
        AppCubit.get(context).changeBottomNavBar(index);
      },
    ),
  );



}

Widget drawer (context){
  return BlocConsumer<AppThemeCubit, AppThemeStates>(
  listener: (context, state) {},
  builder: (context, state) {
    return Drawer(
    child: Container(
      //padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        children: [
          Container(
            width: double.infinity,
              child: Image.asset('assets/photos/logo_full.jpg'),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppThemeCubit.get(context).isArabic ? 'الوضع الليلي' : 'Dark Mode',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      DayNightSwitcher(
                        isDarkModeEnabled: AppThemeCubit.get(context).isDark,
                        onStateChanged: (value) {
                          AppThemeCubit.get(context).changeTheme();
                        },
                      ),

                    ],
                  ),
                  const SizedBox(height: 24,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        //AppThemeCubit.get(context).isArabic ? 'اللغة' : 'Language',
                        'Arabic',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      Switch.adaptive(
                        value: AppThemeCubit.get(context).isArabic,
                        onChanged: (value) {
                          AppThemeCubit.get(context).getArabicNews(context: context);
                        },
                      ),


                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
  },
);
}