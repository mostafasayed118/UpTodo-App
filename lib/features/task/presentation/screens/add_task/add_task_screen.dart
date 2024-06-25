import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/widget/custom_elevated_button.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../components/custom_text_form_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController noteController = TextEditingController();

  DateTime currentDate = DateTime.now();
  String currentTime = DateFormat("HH:mm a").format(DateTime.now());
  String endTime = DateFormat("HH:mm a")
      .format(DateTime.now().add(const Duration(minutes: 45)));
  int selectColor = 0;
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
              child: Column(
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
                    hintText: DateFormat.yMd().format(currentDate),
                    keyboardType: TextInputType.datetime,
                    readOnly: true,
                    suffixIcon: IconButton(
                      onPressed: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050),
                        );
                        setState(() {
                          if (selectedDate != null) {
                            currentDate = selectedDate;
                          } else {
                            log('Date is not selected');
                          }
                        });
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
                          hintText: currentTime,
                          readOnly: true,
                          keyboardType: TextInputType.datetime,
                          suffixIcon: IconButton(
                            onPressed: () async {
                              TimeOfDay? selectedTime = await showTimePicker(
                                  context: context,
                                  initialTime:
                                      TimeOfDay.fromDateTime(DateTime.now()));
                              setState(() {
                                if (selectedTime != null) {
                                  currentTime = selectedTime.format(context);
                                } else {
                                  log('Time is not selected');
                                }
                              });
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
                          hintText: endTime,
                          readOnly: true,
                          keyboardType: TextInputType.datetime,
                          suffixIcon: IconButton(
                            onPressed: () async {
                              TimeOfDay? selectedTime = await showTimePicker(
                                  context: context,
                                  initialTime:
                                      TimeOfDay.fromDateTime(DateTime.now()));
                              setState(() {
                                if (selectedTime != null) {
                                  endTime = selectedTime.format(context);
                                } else {
                                  log('Time is not selected');
                                }
                              });
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
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          SizedBox(height: 8.h),
                          Expanded(
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  Color getColor(int index) {
                                    switch (index) {
                                      case 0:
                                        return AppColors.red;
                                      case 1:
                                        return AppColors.green;
                                      case 2:
                                        return AppColors.blueGrey;
                                      case 3:
                                        return AppColors.blue;
                                      case 4:
                                        return AppColors.orange;
                                      case 5:
                                        return AppColors.purple;
                                      default:
                                        return AppColors.grey;
                                    }
                                  }

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectColor = index;
                                      });
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: getColor(index),
                                      radius: 20.r,
                                      child: selectColor == index
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

                  SizedBox(height: 135.h),
                  //! Cerate Task Button
                  SizedBox(
                    height: 48.h,
                    width: double.infinity,
                    child: CustomElevatedButton(
                        onPressed: () {}, text: AppStrings.createTask),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
