import 'package:flutter/material.dart';
import 'package:news_app/shared/components/components.dart';

import '../settingsScreen/theme_cubit/cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBar(context, AppThemeCubit.get(context).isArabic ? 'بحث' : 'Search'),
        Expanded(
          child: Container(
            child: Text(AppThemeCubit.get(context).isArabic ? 'البحث' : 'Search'),
          ),
        ),
      ],
    );
  }
}
