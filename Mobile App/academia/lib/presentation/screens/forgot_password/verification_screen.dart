import 'dart:ui';

import 'package:academia/presentation/resources/values_manager.dart';
import 'package:academia/presentation/widgets/common_widgets.dart';
import 'package:academia/presentation/widgets/forgot_password_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/style_manager.dart';
import '../../widgets/custom_text.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomText(text: 
          AppStrings.emailCheck,
          style: getBoldTextStyle(
            fontSize: AppSize.s20,
            color: Colors.black,
            fontFamily: FontConstants.cairo,
          ),
        ),
        centerTitle: true,
        actions: [
          SvgPicture.asset(
            ImageAssets.arrowBackIcon,
            width: AppSize.s24,
            height: AppSize.s24,
          ),
        ],
      ),
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
                  const SizedBox(height: 25),

                  /// Title and Description
                  CustomText(text: 
                    AppStrings.verifyEmailMessage,
                    style: getSemiBoldTextStyle(
                      fontSize: AppSize.s14,
                      color: ColorManager.forgotPasswordMessageColor,
                      fontFamily: FontConstants.cairo,
                    ),
                  ),
                  const SizedBox(height: AppSize.s10),
                  CustomText(text: 
                    "zexx@email.com",
                    style: getBoldTextStyle(
                      fontSize: AppSize.s14,
                      color: ColorManager.lightPrimary,
                    ),
                  ),

                  const SizedBox(height: AppSize.s25),

                  /// Code Verification Field
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: VerificationCodeField()),
                      Expanded(child: VerificationCodeField()),
                      Expanded(child: VerificationCodeField()),
                      Expanded(child: VerificationCodeField()),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(AppSize.s10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Verify Button
            BigButton(
              margin: EdgeInsets.zero,
              onPressed: () {
                Navigator.pushNamed(context, Routes.resetPasswordScreen);
              },
              text: AppStrings.verifyTheCode,
            ),

            const SizedBox(height: AppSize.s10),

            // TODO : Add tr
            CustomText(text: 
              "${AppStrings.resetPasswordScreen} - 35  ${AppStrings.second}",
              style: getSemiBoldTextStyle(
                fontSize: AppSize.s16,
                color: ColorManager.lightPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
