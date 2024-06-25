import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/features/task/cubit/task_state.dart';

import '../../../core/utils/app_colors.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  DateTime currentDate = DateTime.now();
  String currentTime = DateFormat("HH:mm a").format(DateTime.now());
  String endTime = DateFormat("HH:mm a")
      .format(DateTime.now().add(const Duration(minutes: 45)));
  int selectColor = 0;

  void getDate(context) async {
    emit(GetDataTaskLoadingState());
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );

    if (selectedDate != null) {
      currentDate = selectedDate;
      emit(GetDataTaskSuccessState());
    } else {
      log('Date is not selected');
      emit(GetDataTaskLErrorState());
    }
  }

  void getStartTime(context) async {
    emit(GetStartTimeTaskLoadingState());
    TimeOfDay? selectedTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));

    if (selectedTime != null) {
      currentTime = selectedTime.format(context);
      emit(GetStartTimeTaskSuccessState());
    } else {
      log('Time is not selected');
      emit(GetStartTimeTaskLErrorState());
    }
  }

  void getEndTime(context) async {
    emit(GetEndTimeTaskLoadingState());
    TimeOfDay? selectedTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));

    if (selectedTime != null) {
      endTime = selectedTime.format(context);
      emit(GetEndTimeTaskSuccessState());
    } else {
      log('Time is not selected');
      emit(GetEndTimeTaskLErrorState());
    }
  }

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

  void changeCheckMarkIndex(index) {
    selectColor = index;
    emit(ChangeCheckMarkIndexState());
  }
}
