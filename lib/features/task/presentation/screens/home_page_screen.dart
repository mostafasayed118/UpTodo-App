import 'dart:developer';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat.yMMMMd().format(
                  DateTime.now(),
                ),
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(AppStrings.today,
                  style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(
                height: 8,
              ),
              DatePicker(
                DateTime.now(),
                width: 62,
                height: 94,
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primary,
                selectedTextColor: AppColors.white,
                dateTextStyle:
                    Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: AppColors.white.withOpacity(0.87),
                        ),
                dayTextStyle:
                    Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: AppColors.white.withOpacity(0.87),
                        ),
                monthTextStyle:
                    Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: AppColors.white.withOpacity(0.87),
                        ),
                onDateChange: (date) {
                  // New date selected
                  log(date.toString());
                },
              ),
              const SizedBox(
                height: 11,
              ),
              noTasksWidget(context),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.primary,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: AppColors.white,
            size: 32,
          ),
        ),
      ),
    );
  }

  Center noTasksWidget(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(AppAssets.noTask, width: 277, height: 277),
          const SizedBox(
            height: 10,
          ),
          Text(
            AppStrings.noTaskTitle,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            AppStrings.noTaskSubTitle,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
