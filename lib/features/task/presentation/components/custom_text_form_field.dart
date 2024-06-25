import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFieldComponent extends StatelessWidget {
  CustomTextFormFieldComponent({
    super.key,
    required this.hintText,
    this.controller,
    required this.text,
    this.keyboardType,
    this.suffixIcon,
    this.readOnly = false,
  });
  final String hintText;
  TextEditingController? controller = TextEditingController();
  final String text;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  bool readOnly = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          readOnly: readOnly,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
