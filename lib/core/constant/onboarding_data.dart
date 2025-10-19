import 'package:grabby_app/core/constant/app_string.dart';
import 'package:grabby_app/models/onbaording_models.dart';

import 'app_images.dart';

class OnboardingData {
  static List<OnboardingModel> get items => [
    OnboardingModel(
      title: AppStrings.onboardingTile1,
      description: AppStrings.onboardingDesc1,
      image: AppImages.onboarding2,
      btntext: '',
    ),
    OnboardingModel(
      title: AppStrings.onboardignTile2,
      description: AppStrings.onboardingDesc2,
      image: AppImages.onboarding4,
      btntext: '',
    ),
    OnboardingModel(
      title: AppStrings.onboardingTile3,
      description: AppStrings.onboardingDesc3,
      image: AppImages.onboarding3,
      btntext: '',
    ),
  ];
}
