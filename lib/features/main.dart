import 'package:flutter/material.dart';
import 'package:todo_app/app/app.dart';
import 'package:todo_app/core/database/cache/cache_helper.dart';
import 'package:todo_app/core/services/service.locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await CacheHelper().init();
  setup();
  await sl<CacheHelper>().init();
  runApp(const ToDoApp());
  // runApp(const MyApp());
}
