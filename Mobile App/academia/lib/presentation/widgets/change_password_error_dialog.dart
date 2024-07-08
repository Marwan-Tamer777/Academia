import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/font_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:academia/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ChangePasswordErrorDaialog extends StatelessWidget {
  const ChangePasswordErrorDaialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        // height: AppSize.s250,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s16),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            const CircleAvatar(
              radius: AppSize.s36,
              backgroundColor: ColorManager.success,
              child:           Icon(
            Icons.error_outline,
            color: Colors.red, 
            size: 50,
          ),
            ),
            const SizedBox(height: AppSize.s16),
            CustomText(text: 
              AppStrings.error.tr,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: FontSize.s16,
              ),
            ),
            const SizedBox(height: AppSize.s16),
            CustomText(text: 
              AppStrings.passwordChangedError.tr,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: FontSize.s14,
              ),
            ),

            const SizedBox(height: AppSize.s16),
            SizedBox(
              width: double.infinity,
              height: AppSize.s50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: CustomText(text: AppStrings.goHome, style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: FontSize.s16,
                  color: ColorManager.white,
                ),),
              ),
            ),
          ],
        ),
      )
    );
  }
}
