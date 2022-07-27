import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/styles/colors.dart';

Widget newsListBuilder (list, context){
  return Stack(
    alignment: Alignment.centerRight,
    children: [
      Container(
        width: double.infinity,
        height: 120,
        margin: const EdgeInsets.only(left: 24, bottom: 24, top: 24, right: 40),
        padding: const EdgeInsetsDirectional.only(end: 32),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(topRight: Radius.circular(40),),
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
                borderRadius: BorderRadius.only(topRight: Radius.circular(40),),
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
        margin: const EdgeInsets.only(right: 24),
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
  );
}

Widget appBar (context, @required title){
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
      tabs: AppCubit.get(context).bottomItems,
      onTabChange: (index){
        AppCubit.get(context).changeBottomNavBar(index);
      },
    ),
  );
}