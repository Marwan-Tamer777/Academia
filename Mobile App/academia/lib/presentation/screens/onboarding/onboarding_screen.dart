import 'dart:ui';
import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/resources/theme_manager.dart';
import 'package:academia/presentation/screens/onboarding/cubit/onboarding_cubit.dart';
import 'package:academia/presentation/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/onboarding_pages.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = OnboardingCubit.getCubit(context);

    return BlocConsumer<OnboardingCubit, OnboardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              /// Image Patterns Background
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY: 5,
                  ),
                  child: Opacity(
                    opacity: 0.15,
                    child: SvgPicture.asset(
                      ImageAssets.imagesOnBoardingPattern,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              /// PageView Builder
              PageView.builder(
                controller: cubit.pageController,
                itemCount: onboardingData.length,
                onPageChanged: (newIndex) {
                  cubit.changePage(newIndex);
                },
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Image
                      SvgPicture.asset(
                        onboardingData[index].image,
                        height: 300,
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      /// Title
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomText(text: 
                          onboardingData[index].title,
                          style: Theme.of(context).textTheme.labelLarge!,
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),

                      /// Description
                      CustomText(text: 
                        onboardingData[index].description,
                        style: Theme.of(context).textTheme.labelMedium!,
                      ),
                    ],
                  ),
                ),
              ),

              /// Next Button
              Positioned(
                bottom: 50,
                right: 20,
                left: 20,
                child: BigButton(
                  text: AppStrings.next,
                  onPressed: () {
                    cubit.next(context);
                  },
                ),
              ),

              /// PageView Indicator
              Positioned(
                top: 0,
                right: 20,
                left: 20,
                child: SafeArea(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                          onboardingData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.all(5),
                            height: 10,
                            width: cubit.currentPage == index ? 30 : 10,
                            decoration: BoxDecoration(
                              color: cubit.currentPage == index
                                  ? Theme.of(context)
                                      .extension<CustomThemeExtension>()!
                                      .pageIndicatorColor
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /// skip button
              Positioned(
                top: 0,
                left: 20,
                child: SafeArea(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        cubit.skip(context);
                      },
                      child: CustomText(text: 
                        AppStrings.skip,
                        style: Theme.of(context).textTheme.bodySmall!,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
