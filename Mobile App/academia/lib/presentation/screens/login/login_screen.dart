import 'dart:ui';

import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/font_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/resources/style_manager.dart';
import 'package:academia/presentation/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              /// Background Pattern
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: AppSize.s5,
                    sigmaY: AppSize.s5,
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

              Column(
                children: [
                  const SizedBox(height: AppSize.s46),

                  /// Title and Description
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.loginWelcomeTitleMessage,
                          style: getSemiBoldTextStyle(
                            fontSize: AppSize.s37,
                            color: ColorManager.black,
                            fontFamily: FontConstants.cairo,
                          ),
                        ),
                        const SizedBox(height: AppSize.s10),
                        Text(
                          AppStrings.loginWelcomeDescriptionMessage,
                          style: getRegularTextStyle(
                            fontSize: AppSize.s17,
                            color: ColorManager.lightGrey,
                            fontFamily: FontConstants.cairo,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSize.s45),

                  /// Email Field
                  const CommonTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    hint: AppStrings.loginEmailHint,
                    label: AppStrings.loginEmailHint,
                  ),

                  /// Password Field
                  CommonTextFormField(
                    hint: AppStrings.loginPasswordHint,
                    label: AppStrings.loginPasswordHint,
                    prefixIcon: IconButton(
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: ColorManager.lightGrey,
                      ),
                      onPressed: () {},
                    ),
                  ),

                  const SizedBox(height: AppSize.s30),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Forgot Password Text Button
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.forgotPasswordScreen);
                          },
                          child: const Text(AppStrings.forgotPassword),
                        ),
                        const Spacer(),

                        /// Remember Me
                        const Text(AppStrings.rememberMe),
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSize.s66),

                  /// Login Button
                  BigButton(
                    text: AppStrings.login,
                    margin: const EdgeInsets.symmetric(horizontal: AppMargin.m10),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.bottomNavBar);
                    },
                  ),

                  /// Or Text
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: AppMargin.m20,
                      horizontal: AppMargin.m14,
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: ColorManager.lightGrey,
                            thickness: AppSize.s0_5,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: AppSize.s10),
                          child: Text(
                            AppStrings.or,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: ColorManager.lightGrey,
                            thickness: AppSize.s0_5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Text(AppStrings.useFingerPrint),

                  const SizedBox(height: AppSize.s15),
                  /// Finger Print Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () {},
                    child:
                        SvgPicture.asset(ImageAssets.imagesAndroidFingerprint),
                  ),

                  const SizedBox(height: AppSize.s25),

                  /// Register Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.register,
                          style: getBoldTextStyle(
                            fontSize: AppSize.s16,
                            fontFamily: FontConstants.cairo,
                            color: ColorManager.orangeStatusBar,
                          ),
                        ),
                      ),
                      const Text(AppStrings.noAccount),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
