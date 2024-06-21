import 'dart:developer';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/common/commons.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/widget/custom_elevated_button.dart';

import '../add_task/add_task_screen.dart';

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
                height: 24,
              ),
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 240,
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          color: AppColors.deepGrey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: CustomElevatedButton(
                                    color: AppColors.primary,
                                    onPressed: () {},
                                    text: AppStrings.taskCompleted),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: CustomElevatedButton(
                                    color: AppColors.red,
                                    onPressed: () {},
                                    text: AppStrings.deleteTask),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: CustomElevatedButton(
                                    color: AppColors.primary,
                                    onPressed: () {},
                                    text: AppStrings.cancel),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const TaskComponent()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigate(context: context, screen:  AddTaskScreen());
          },
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

class TaskComponent extends StatelessWidget {
  const TaskComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.red,
      ),
      margin: const EdgeInsets.only(bottom: 24),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Task 1',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.timer_outlined,
                        color: AppColors.white,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '09:00 AM - 10:00 AM',
                        style: Theme.of(context).textTheme.displayMedium,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Learn Dart',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ),
            Container(
              width: 1.5,
              height: 75,
              margin: const EdgeInsets.symmetric(horizontal: 9),
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.44),
              ),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(AppStrings.todo,
                  style: Theme.of(context).textTheme.displayMedium),
            ),
          ],
        ),
      ),
    );
  }
}
