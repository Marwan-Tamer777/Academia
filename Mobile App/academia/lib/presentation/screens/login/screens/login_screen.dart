import 'dart:ui';

import 'package:academia/app/dep_injection.dart';
import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/font_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/resources/style_manager.dart';
import 'package:academia/presentation/screens/login/cubit/login_cubit.dart';
import 'package:academia/presentation/screens/login/widgets/background_pattern.dart';
import 'package:academia/presentation/screens/login/widgets/custom_alert_dialog.dart';
import 'package:academia/presentation/screens/login/widgets/custom_loading_dialog.dart';
import 'package:academia/presentation/screens/login/widgets/email_text_form_field.dart';
import 'package:academia/presentation/screens/login/widgets/finger_print_button.dart';
import 'package:academia/presentation/screens/login/widgets/login_button.dart';
import 'package:academia/presentation/screens/login/widgets/or_widget.dart';
import 'package:academia/presentation/screens/login/widgets/password_options.dart';
import 'package:academia/presentation/screens/login/widgets/register_button.dart';
import 'package:academia/presentation/widgets/authentication_error_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/custom_text.dart';
import '../cubit/login_states.dart';
import '../widgets/password_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return BlocProvider<LoginCubit>.value(
      value:  getItInstance<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) { 
        if (state is LoginLoadingState) {
          customLoadingDialog(context: context);
        } else if (state is LoginErrorState) {
          Navigator.pop(context);
        } else

        if (state is LoginSuccessState) { 
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(context, Routes.bottomNavBar, (route) => false);
        }
      }, builder: (context, state) { 
        var cubit = LoginCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                children: [
                  /// Background Pattern
                  const BackgroundPattern(),

                  Form( 
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: AppSize.s46),
                    
                        /// Title and Description
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: AppSize.s20),
                          child: Column(
                            children: [
                              /// Welcome Title
                              CustomText(
                                text: AppStrings.loginWelcomeTitleMessage,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(fontSize: FontSize.s34),
                              ),
                              const SizedBox(height: AppSize.s10),
                    
                              /// Welcome Description
                              CustomText(
                                text: AppStrings.loginWelcomeDescriptionMessage, 
                                textAlign: TextAlign.center,
                                style: getRegularTextStyle(
                                  fontSize: AppSize.s17,
                                  color: ColorManager.lightGrey,
                                  fontFamily: FontConstants.cairo, 
                                ),
                              ),
                            ],
                          ),
                        ),
                    
                        const SizedBox(height: AppSize.s45),
                    
                    
                        if(state is LoginErrorState) ...  
                        [                        
                          AuthenticationErrorBox(message: state.message),
                          const SizedBox(height: AppSize.s20),
                        ],
                        /// Email Field
                        EmailTextFormField(emailController: cubit.emailController),
                    
                        /// Password Field
                        PasswordTextFormField(
                            passwordController: cubit.passwordController),
                    
                        const SizedBox(height: AppSize.s30),
                    
                        const PasswordOptions(),
                    
                        const SizedBox(height: AppSize.s66),
                    
                        /// Login Button
                        LoginButton(email: cubit.emailController.text, password: cubit.passwordController.text, formKey: _formKey),
                    
                        /// Or Text
                        const OrWidget(),
                    
                        CustomText(
                            text: AppStrings.useFingerPrint,
                            style: Theme.of(context).textTheme.bodyMedium!),
                    
                        const SizedBox(height: AppSize.s15),
                    
                        /// Finger Print Button
                        const FingerPrintButton(),
                    
                        const SizedBox(height: AppSize.s25),
                    
                        /// Register Button
                        const RegisterButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
