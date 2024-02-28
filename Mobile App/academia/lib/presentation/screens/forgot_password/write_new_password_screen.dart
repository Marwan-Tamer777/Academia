import 'dart:ui';

import 'package:academia/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/style_manager.dart';
import '../../widgets/common_widgets.dart';

class WriteNewPasswordScreen extends StatelessWidget {
  const WriteNewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
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
                  const SizedBox(height: AppSize.s25),

                  /// Title and Description
                  Text(
                    AppStrings.newPasswordScreenMessage,
                    style: getSemiBoldTextStyle(
                      fontSize: AppSize.s14,
                      color: ColorManager.forgotPasswordMessageColor,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppSize.s25),

                  /// New Password Field
                  CommonTextFormField(
                    hint: AppStrings.passwordLabel,
                    label: AppStrings.passwordLabel,
                    prefixIcon: IconButton(
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: ColorManager.lightGrey,
                      ),
                      onPressed: () {},
                    ),
                  ),

                  /// Confirm Password Field
                  CommonTextFormField(
                    hint: AppStrings.confirmPassword,
                    label: AppStrings.confirmPassword,
                    prefixIcon: IconButton(
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: ColorManager.lightGrey,
                      ),
                      onPressed: () {},
                    ),
                  ),

                  const SizedBox(height: AppSize.s500),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet:

          /// Confirm New Password Button
          BigButton(
        margin: const EdgeInsets.all(AppMargin.m10),
        onPressed: () {
          Navigator.pushNamed(context, Routes.login);
        },
        text: AppStrings.newPasswordButtonTitle,
      ),
    );
  }
}
