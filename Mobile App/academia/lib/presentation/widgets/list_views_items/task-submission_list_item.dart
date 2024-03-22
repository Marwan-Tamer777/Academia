import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';

class TaskSubmissionListItem extends StatelessWidget {
  const TaskSubmissionListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              value: 0.5,
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
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('2030154 - تكليف 01',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: FontSize.s12,
                        )),
                const SizedBox(height: 5),
                Text('جاري التحميل 40% - 2.05 ميجابايت',
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
