part of 'onboarding_cubit.dart';

@freezed
class OnboardingStates with _$OnboardingStates {
  const factory OnboardingStates.initial() = _Initial;
  const factory OnboardingStates.loading() = _Loading;
  const factory OnboardingStates.pageChanged(int currentPage) = _PageChanged;
  const factory OnboardingStates.loaded() = _Loaded;
  const factory OnboardingStates.error(String message) = _Error;
}
