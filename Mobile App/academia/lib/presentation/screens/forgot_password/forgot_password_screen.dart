import 'dart:ui';

import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/resources/style_manager.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
import '../../widgets/common_widgets.dart';
import '../../widgets/custom_text.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: CustomText(text: 
          AppStrings.forgotPassword,
          style: getBoldTextStyle(
            fontSize: AppSize.s20,
            color: Colors.black,
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
        // Disable back button
        automaticallyImplyLeading: false,
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

              Column(
                children: [
                  const SizedBox(height: AppSize.s26),

                  /// Title and Description
                  CustomText(text: 
                    AppStrings.forgotPasswordTitleMessage,
                    style: getSemiBoldTextStyle(
                      fontSize: AppSize.s14,
                      color: ColorManager.forgotPasswordMessageColor,
                      fontFamily: FontConstants.cairo,
                    ),
                  ),

                  const SizedBox(height: AppSize.s26),

                  /// Email Field
                  const CommonTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    hint: AppStrings.loginEmailHint,
                    label: AppStrings.loginEmailHint,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BigButton(
        margin: const EdgeInsets.all(AppPadding.p10),
        onPressed: () {
          Navigator.pushNamed(context, Routes.forgotPasswordOtpScreen);
        },
        text: AppStrings.forgotPasswordButtonTitle,
      ),
    );
  }
}
