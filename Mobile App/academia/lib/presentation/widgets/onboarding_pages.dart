import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnboardingData {
  final String image;
  final String title;
  final String description;

  OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingData> onboardingData = [
  OnboardingData(
    image: ImageAssets.imagesOnboarding1,
    title: AppStrings.onBoardingTitle11,
    description: AppStrings.onBoardingDescription11,
  ),
  OnboardingData(
    image: ImageAssets.imagesOnboarding2,
    title: AppStrings.onBoardingTitle22,
    description: AppStrings.onBoardingDescription22,
  ),
  OnboardingData(
    image: ImageAssets.imagesOnboarding3,
    title: AppStrings.onBoardingTitle33,
    description: AppStrings.onBoardingDescription33,
  ),
];
