import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widget/custom_text_form_field.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

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
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.title,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: titleController,
                hintText: AppStrings.titleHint,
              ),
              const SizedBox(height: 24),
              Text(
                AppStrings.note,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: noteController,
                hintText: AppStrings.noteHint,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
