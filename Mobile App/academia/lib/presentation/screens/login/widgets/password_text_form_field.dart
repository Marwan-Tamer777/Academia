import 'package:academia/presentation/screens/login/cubit/login_cubit.dart';
import 'package:academia/presentation/screens/login/cubit/login_states.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../widgets/common_widgets.dart';

class PasswordTextFormField extends StatelessWidget {
  final TextEditingController passwordController;
  PasswordTextFormField({super.key, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {     
         var cubit = LoginCubit.get(context);
        return CommonTextFormField(
          controller: passwordController,
          hint: AppStrings.loginPasswordHint,
          label: AppStrings.loginPasswordHint,
          obscureText: !cubit.showPassword, 
          validator: (value) {
            if (value!.isEmpty) {
              return AppStrings.loginPasswordError;
            }
            return null;
          },
          prefixIcon: IconButton(
            icon: Icon(cubit.showPassword ?
               Icons.visibility_off : Icons.visibility,
              color: ColorManager.lightGrey, 
              size: 20,
            ),
            onPressed: () {
              cubit.togglePasswordVisibility();
            },
          ),
        );
      },
    );
  }
}
