import 'package:flutter/material.dart';
import 'package:todo_app/core/database/cache/cache_helper.dart';
import 'package:todo_app/core/services/service.locator.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/auth/presentation/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:todo_app/features/task/presentation/screens/home_page_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigator();
  }

//presentation
  void navigator() {
    bool isVisted =
        sl<CacheHelper>().getData(key: AppStrings.onboardingKey) ?? false;
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return isVisted ? const HomePageScreen() : OnBoardingScreen();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logo),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppStrings.appName,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 40,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
