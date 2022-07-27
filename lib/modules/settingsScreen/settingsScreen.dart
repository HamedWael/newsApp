
import 'package:day_night_switch/day_night_switch.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/settingsScreen/theme_cubit/cubit.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';


class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBar(context, 'Settings'),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dark Mode',
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
                      'Arabic News',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Switch(
                        value: AppThemeCubit.get(context).isArabic,
                        onChanged: (value) {
                          AppThemeCubit.get(context).getArabicNews(value, AppCubit.get(context));
                        },
                    )

                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
