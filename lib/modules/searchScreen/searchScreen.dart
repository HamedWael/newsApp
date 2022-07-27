import 'package:flutter/material.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBar(context, 'Search'),
        Expanded(
          child: Container(
            child: Text('Search'),
          ),
        ),
      ],
    );
  }
}
