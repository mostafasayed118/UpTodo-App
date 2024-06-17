import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/theme.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/auth/presentation/screens/splash_screen/splash_screen.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      darkTheme: getAppDarkTheme(),
      themeMode: ThemeMode.light,
      title: AppStrings.appName,
      home: const SplashScreen(),
    );
  }
}
