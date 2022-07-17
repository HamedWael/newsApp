import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/shared/styles/colors.dart';


class NewsHome extends StatelessWidget {
  const NewsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getPopular(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 48, bottom: 24),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'NEWS APP',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w600
                          ),
                        ),
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
                  ),
                  Expanded(
                      child: cubit.screens[cubit.currentIndex],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(48),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      color: Colors.grey.shade300
                    ),
                  ]
                ),
              child: GNav(
                gap: 8,
                padding: const EdgeInsets.all(8),
                iconSize: 32,
                selectedIndex: cubit.currentIndex,
                color: mainPurpleColor,
                activeColor: Colors.white,
                tabBackgroundColor: mainPurpleColor,
                tabs: cubit.bottomItems,
                onTabChange: (index){
                  cubit.changeBottomNavBar(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
