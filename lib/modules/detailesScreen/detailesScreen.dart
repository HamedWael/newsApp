import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/webViewScreen/webViewScreen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/styles/colors.dart';

import '../settingsScreen/theme_cubit/cubit.dart';

class DetailesScreen extends StatelessWidget {
  const DetailesScreen(this.list, {Key? key}) : super(key: key);
  final dynamic list;

  @override
  Widget build(BuildContext context) {

    String description;

    if (list['description'] != null){
      description = '${list['description']}';
    } else {
      description = '';
    }

    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Directionality(
              textDirection: AppThemeCubit.get(context).isArabic ? TextDirection.rtl : TextDirection.ltr,
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      width: double.infinity,
                      height: 300,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(bottomEnd: Radius.circular(80)),
                      ),
                      child: Image.network(
                        '${list['urlToImage']}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                '${list['title']}',
                                style: Theme.of(context).textTheme.subtitle1,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Container(
                                width: double.infinity,
                                height: 3,
                                color: mainPurpleColor,
                                margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 0),
                              ),
                              Text(
                                description,
                                style: Theme.of(context).textTheme.subtitle2,

                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: mainPurpleColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextButton(
                        onPressed: (){
                          navigateTo(context, WebViewScreen(url: list['url']));
                        },
                        child: Text(
                          AppThemeCubit.get(context).isArabic ? 'قراءة باقي المقال' : 'READ THE FULL ARTICLE',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//Text('${list['description']}')
