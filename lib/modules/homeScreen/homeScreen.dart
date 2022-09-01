import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {

        var list = AppCubit.get(context).news;


        return Column(
          children: [
            //appBar(context, 'Newseum'),
            Expanded(
              child: ConditionalBuilder(
                condition: list.isNotEmpty,
                fallback: (context) => const Center(child: CircularProgressIndicator()),
                builder: (context) => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => newsListBuilder(context: context, index: index, list: list[index]),
                  separatorBuilder: (context, index) =>
                      Container(
                        height: 0.5,
                        color: mainPurpleColor,
                        margin: const EdgeInsets.only(left: 24, right: 24),
                      ),
                  itemCount: 20,
                ),
              ),
            ),
          ],
        );


      },
    );
  }
}
