import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/widget/custom_elevated_button.dart';
import 'package:todo_app/features/task/cubit/task_cubit.dart';
import 'package:todo_app/features/task/cubit/task_state.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../components/custom_text_form_field.dart';

class AddTaskScreen extends StatelessWidget {
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.addTask,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          centerTitle: false,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: BlocBuilder<TaskCubit, TaskState>(
                builder: (context, state) {
                  final taskCubit = BlocProvider.of<TaskCubit>(context);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //! Title
                      CustomTextFormFieldComponent(
                        text: AppStrings.title,
                        controller: titleController,
                        hintText: AppStrings.titleHint,
                      ),
                      SizedBox(height: 24.h),
                      //! Note
                      CustomTextFormFieldComponent(
                        text: AppStrings.note,
                        controller: noteController,
                        hintText: AppStrings.noteHint,
                      ),
                      SizedBox(height: 24.h),
                      //! Date
                      CustomTextFormFieldComponent(
                        text: AppStrings.date,
                        hintText:
                            DateFormat.yMd().format(taskCubit.currentDate),
                        keyboardType: TextInputType.datetime,
                        readOnly: true,
                        suffixIcon: IconButton(
                          onPressed: () async {
                            taskCubit.getDate(context);
                          },
                          icon: const Icon(
                            Icons.calendar_month,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      //! Start - End time
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormFieldComponent(
                              text: AppStrings.startTime,
                              hintText: taskCubit.currentTime,
                              readOnly: true,
                              keyboardType: TextInputType.datetime,
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  taskCubit.getStartTime(context);
                                },
                                icon: const Icon(
                                  Icons.timer_outlined,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 27.w),
                          Expanded(
                            child: CustomTextFormFieldComponent(
                              text: AppStrings.endTime,
                              hintText: taskCubit.endTime,
                              readOnly: true,
                              keyboardType: TextInputType.datetime,
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  taskCubit.getEndTime(context);
                                },
                                icon: const Icon(
                                  Icons.timer_outlined,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      SizedBox(
                          height: 68.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.colors,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              SizedBox(height: 8.h),
                              Expanded(
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          taskCubit.changeCheckMarkIndex(index);
                                        },
                                        child: CircleAvatar(
                                          backgroundColor:
                                              taskCubit.getColor(index),
                                          radius: 20.r,
                                          child: taskCubit.selectColor == index
                                              ? const Icon(
                                                  Icons.check,
                                                  color: AppColors.white,
                                                )
                                              : null,
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(width: 18.w),
                                    itemCount: 6),
                              ),
                            ],
                          )),

                      SizedBox(height: 120.h),
                      //! Cerate Task Button
                      SizedBox(
                        height: 48.h,
                        width: double.infinity,
                        child: CustomElevatedButton(
                            onPressed: () {}, text: AppStrings.createTask),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
