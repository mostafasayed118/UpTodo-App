import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_app/core/database/cache/cache_helper.dart';
import 'package:todo_app/core/services/service.locator.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/widget/custom_elevated_button.dart';
import 'package:todo_app/core/widget/custom_text_button.dart';
import 'package:todo_app/features/auth/data/model/on_boarding_model.dart';
import 'package:todo_app/features/task/presentation/screens/home_page_screen.dart';

import '../../../../../core/common/commons.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: PageView.builder(
            itemCount: OnBoardingModel.onBoardingScreen.length,
            controller: controller,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  index != 2
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: CustomTextButton(
                            onPressed: () {
                              controller.jumpToPage(2);
                            },
                            text: AppStrings.skip,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                  color: AppColors.white.withOpacity(0.44),
                                ),
                          ))
                      : const SizedBox(
                          height: 50,
                        ),
                  const SizedBox(
                    height: 16,
                  ),
                  //Image
                  Image.asset(
                      OnBoardingModel.onBoardingScreen[index].imagePath),
                  const SizedBox(
                    height: 16,
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primary,
                      dotColor: AppColors.white,
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 8,
                    ),
                  ),
                  const SizedBox(
                    height: 52,
                  ),
                  // onboarding title String
                  Text(
                    OnBoardingModel.onBoardingScreen[index].title,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 32,
                        ),
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  // onboarding Subtitle String
                  Text(
                      textAlign: TextAlign.center,
                      OnBoardingModel.onBoardingScreen[index].subTitle,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 16)),
                  const SizedBox(
                    height: 180,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      index != 0
                          ? CustomTextButton(
                              onPressed: () {
                                controller.previousPage(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              },
                              text: AppStrings.back)
                          : Container(),
                      const Spacer(),
                      index != 2
                          ? CustomElevatedButton(
                              onPressed: () {
                                controller.nextPage(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeInOut,
                                );
                              },
                              text: AppStrings.next)
                          : CustomElevatedButton(
                              onPressed: () async {
                                // navigator();
                                await sl<CacheHelper>()
                                    .saveData(
                                        key: AppStrings.onboardingKey,
                                        value: true)
                                    .then(
                                  (value) {
                                    log('onboarding saved');
                                    navigate(
                                      context: context,
                                      screen: const HomePageScreen(),
                                    );
                                  },
                                ).catchError(
                                  (error) {
                                    log(
                                      error.toString(),
                                    );
                                  },
                                );
                              },
                              text: AppStrings.getStarted)
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
