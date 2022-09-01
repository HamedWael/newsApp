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
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          drawer: drawer(context),
          appBar: appBar(context),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              cubit.screens[cubit.currentIndex],
              //bottomNavBar(context),
            ],
          ),
        );
      },
    );
  }
}
