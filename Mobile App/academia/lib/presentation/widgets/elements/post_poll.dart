import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';

class PostPoll extends StatelessWidget {
  const PostPoll({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s250,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
            padding: const EdgeInsets.all(AppPadding.p12),
            decoration: BoxDecoration(
              color: ColorManager.lightGrey2,
              borderRadius: BorderRadius.circular(AppSize.s16),
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p8),
                child: Text( "لوريم ايبسوم", style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: FontSize.s12,
                  color: ColorManager.black,
                ),),
              ),
            ),
          );
        },
      ),
    );
  }
}
