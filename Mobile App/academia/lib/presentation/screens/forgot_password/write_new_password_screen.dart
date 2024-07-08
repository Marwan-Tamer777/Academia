import 'dart:ui';

import 'package:academia/app/constants.dart';
import 'package:academia/app/dep_injection.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/profile/profile_cubit/profile_cubit.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/profile/profile_cubit/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/style_manager.dart';
import '../../widgets/common_widgets.dart';
import '../../widgets/custom_text.dart';

class WriteNewPasswordScreen extends StatelessWidget {
  const WriteNewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    final TextEditingController oldPasswordController = TextEditingController(); 
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmNewPasswordController = TextEditingController();

    return BlocProvider<ProfileCubit>.value(
      value: getItInstance<ProfileCubit>(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) { 
          var cubit = ProfileCubit.get(context);
          return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                    CustomText(text: 
                      AppStrings.newPasswordScreenMessage,
                      style: getSemiBoldTextStyle(
                        fontSize: AppSize.s14,
                        color: ColorManager.forgotPasswordMessageColor,
                      ),
                    ),
      
                    const SizedBox(height: AppSize.s25),
      
                    /// Old Password Field
                    CommonTextFormField(
                      controller: oldPasswordController,
                      hint: AppStrings.passwordLabel,
                      label: AppStrings.oldPassword,
                      obscureText: cubit.isOldPasswordShown,
                      prefixIcon: IconButton(
                        icon:  Icon(
                          cubit.isOldPasswordShown ? Icons.remove_red_eye : Icons.visibility_off,
                          color: ColorManager.lightGrey,
                        ),
                        onPressed: () { 
                          cubit.showOldPassword();
                        },
                      ),
                    ),
      

                    /// New Password Field
                    CommonTextFormField(
                      controller: newPasswordController,
                      hint: AppStrings.passwordLabel,
                      label: AppStrings.newPassword,
                      obscureText: cubit.isNewPasswordShown,
                      prefixIcon: IconButton(
                        icon: Icon(
                          cubit.isNewPasswordShown ? Icons.remove_red_eye : Icons.visibility_off,
                          color: ColorManager.lightGrey,
                        ),
                        onPressed: () {
                          cubit.showNewPassword();
                        },
                      ),
                    ),
      
                    /// Confirm Password Field
                    CommonTextFormField(
                      controller: confirmNewPasswordController,
                      hint: AppStrings.confirmPassword,
                      label: AppStrings.confirmPassword,
                      obscureText: cubit.isConfirmPasswordShown,
                      prefixIcon: IconButton(
                        icon: Icon(
                          cubit.isConfirmPasswordShown ? Icons.remove_red_eye : Icons.visibility_off,
                          color: ColorManager.lightGrey,
                        ),
                        onPressed: () { 
                          cubit.showConfirmPassword();
                        },
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
            cubit.resetPassword( oldPasswordController.text, newPasswordController.text);
          },
          text: AppStrings.newPasswordButtonTitle,
        ),
      );
        
        },
      ),
    );
    
    }
}
