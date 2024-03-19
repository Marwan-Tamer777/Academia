import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';

class PostPollResult extends StatelessWidget {
  const PostPollResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Text( "30 الف صوت", style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: FontSize.s12,
                        color: ColorManager.black,
                      ),),
                      const Spacer(),
                      Text( "لوريم ايبسوم", style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: FontSize.s12,
                        color: ColorManager.black,
                      ),),
                    ],
                  ),
                  const SizedBox(height: AppSize.s8),
                  LinearProgressIndicator(
                    value: 0.5,
                    backgroundColor: ColorManager.lightGrey,
                    valueColor: const AlwaysStoppedAnimation<Color>(ColorManager.textOrange),
                    // make it rounded more higher
                    minHeight: AppSize.s10,
                    borderRadius: BorderRadius.circular(AppSize.s16),
                  ),
                ],
              )
          );
        },
      ),
    );
  }
}
