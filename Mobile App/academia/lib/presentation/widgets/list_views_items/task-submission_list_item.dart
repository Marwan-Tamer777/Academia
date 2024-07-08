import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../custom_text.dart';

class TaskSubmissionListItem extends StatelessWidget {
  //final String name;
  final double progress;
  const TaskSubmissionListItem({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(flex: 1, child: Icon(Icons.clear)),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 4,
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: ColorManager.lightGrey,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(ColorManager.textOrange),
              minHeight: 10,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(text: '2030154 - تكليف 01',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: FontSize.s12,
                        )),
                const SizedBox(height: 5),
                CustomText(text: progress == 1 ? AppStrings. uploadCompleted: '${AppStrings.uploadRunning.tr}   ${(progress/1) *100}% - 2.05  ${AppStrings.mb.tr}',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: FontSize.s8,
                        )),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: ColorManager.lightOrange1,
              child: SvgPicture.asset(ImageAssets.file),
            ),
          ),
        ],
      ),
    );
  }
}
