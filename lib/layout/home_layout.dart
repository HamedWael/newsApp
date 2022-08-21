import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/searchScreen/searchScreen.dart';
import 'package:news_app/modules/settingsScreen/theme_cubit/cubit.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/shared/styles/colors.dart';


class NewsHome extends StatelessWidget {
  const NewsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getNews('en'),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            drawer: drawer(context),
            appBar: AppBar(
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
                        onPressed: (){},
                      ),
                    ),
                    SizedBox(width: 12,),
                    // Container(
                    //   alignment: Alignment.center,
                    //   width: 36,
                    //   height: 36,
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //       color: mainPurpleColor,
                    //       width: 0.5,
                    //     ),
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: IconButton(
                    //     icon: Icon(
                    //       Icons.more_horiz,
                    //       color: mainPurpleColor,
                    //       size: 18,
                    //     ),
                    //     onPressed: (){},
                    //   ),
                    // ),
                    SizedBox(width: 12,),
                  ],
                ),
              ],
            ),
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                cubit.screens[cubit.currentIndex],
                //bottomNavBar(context),
              ],
            ),
          );
        },
      ),
    );
  }
}
