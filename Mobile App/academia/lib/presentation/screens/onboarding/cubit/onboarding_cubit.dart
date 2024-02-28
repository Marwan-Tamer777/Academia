import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../resources/routes_manager.dart';
import '../../../widgets/onboarding_pages.dart';

part 'onboarding_cubit.freezed.dart';
part 'onboarding_states.dart';

class OnboardingCubit extends Cubit<OnboardingStates> {
  OnboardingCubit() : super(const _Initial());

  static OnboardingCubit getCubit(context) => BlocProvider.of(context);
  final PageController pageController = PageController();
  int currentPage = 0;

  void changePage(int index) {
    currentPage = index;
    emit(_PageChanged(index));
  }

  void next(BuildContext context) {
    if (currentPage == onboardingData.length - 1) {
      Navigator.pushNamed(context, Routes.login);
    } else {
      currentPage++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    emit(_PageChanged(currentPage));
  }

  void skip(BuildContext context) {
    Navigator.pushNamed(context, Routes.login);
  }
}
