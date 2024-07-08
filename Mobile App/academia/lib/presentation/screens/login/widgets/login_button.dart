import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/routes_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/common_widgets.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_states.dart';

class LoginButton extends StatelessWidget {
  final String email;
  final String password; 
  final GlobalKey<FormState> formKey;
  const LoginButton({super.key, required this.email, required this.password, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
      if (state is LoginSuccessState) {
        Navigator.pushNamed(context, Routes.bottomNavBar);
      }
    }, builder: (context, state) {
      var cubit = LoginCubit.get(context);

      return BigButton(
        text: AppStrings.login,
        margin: const EdgeInsets.symmetric(
            horizontal: AppMargin.m10),
        onPressed: () async {
           if(formKey.currentState!.validate()){
            await cubit.authenticate();
           } 
        }
      );
    }
    );
  }
}
