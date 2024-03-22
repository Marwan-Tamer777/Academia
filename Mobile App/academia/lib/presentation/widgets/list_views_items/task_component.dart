import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';

class TaskComponent extends StatelessWidget {
  const TaskComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text('تبقى 4 ساعات',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: FontSize.s12,
                          color: ColorManager.lightError)),
                  const Spacer(),
                  Text('تكليف 01',
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: FontSize.s16,
                              )),
                ],
              ),
              const SizedBox(height: AppSize.s10),
              Text('منهجيات البحث التجريدى',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: FontSize.s16)),
            ],
          ),
        ),
        const SizedBox(
          width: AppSize.s20,
        ),
        Expanded(
          flex: 2,
          child: CircleAvatar(
            radius: AppSize.s30,
            backgroundColor: ColorManager.lightOrange1,
            child: SvgPicture.asset(ImageAssets.calendarTime),
          ),
        ),
      ],
    );
  }
}
