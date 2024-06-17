import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_strings.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String description;
  OnBoardingModel(
      {required this.image, required this.title, required this.description});

  static List<OnBoardingModel> onBoardingScreen = [
    OnBoardingModel(
        image: AppAssets.onBoarding1,
        title: AppStrings.onBoardingTitleOne,
        description: AppStrings.onBoardingSubTitleOne),
    OnBoardingModel(
        image: AppAssets.onBoarding2,
        title: AppStrings.onBoardingTitleTwo,
        description: AppStrings.onBoardingSubTitleTwo),
    OnBoardingModel(
        image: AppAssets.onBoarding3,
        title: AppStrings.onBoardingTitleThree,
        description: AppStrings.onBoardingSubTitleThree),
  ];
}
