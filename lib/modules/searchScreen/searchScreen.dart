import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../../shared/cubit/cubit.dart';
import '../../shared/styles/colors.dart';
import '../settingsScreen/theme_cubit/cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();

    var list = AppCubit.get(context).search;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var list = AppCubit.get(context).search;

        return Directionality(
          textDirection: AppThemeCubit.get(context).isArabic
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
            appBar: AppBar(
              title:
                  Text(AppThemeCubit.get(context).isArabic ? 'بحث' : 'Search'),
              centerTitle: true,
              toolbarHeight: 80,
            ),
            body: Column(
              children: [

                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 48, right: 24, left: 24, bottom: 16),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller,
                          keyboardType: TextInputType.text,
                          onChanged: (value)
                          {
                            AppCubit.get(context).getSearchNews(value: value,);
                            },
                          validator: (value) {
                            if (value?.length == 0)
                            {
                              return 'Please enter something to search for';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: AppThemeCubit.get(context).isArabic ? 'بحث' : 'Search',
                            labelStyle: TextStyle(
                                color: AppThemeCubit.get(context).isDark ? Colors.white : Colors.black),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppThemeCubit.get(context).isDark ? Colors.white : Colors.black,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppThemeCubit.get(context).isDark
                                        ? Colors.white
                                        : Colors.black)),
                          ),
                        ),

                        //builder

                        newsSearchBuilder(list, context: context)
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
}
