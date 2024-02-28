import 'package:academia/presentation/widgets/elements/calender_empty_state.dart';
import 'package:academia/presentation/widgets/list_views_items/calender_task_list.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../widgets/backgrounds/background.dart';
import '../../../widgets/elements/notification_icon.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../resources/color_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../resources/assets_manager.dart';
import 'package:flutter/material.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(height: AppSize.s300.toInt(),),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p13, vertical: AppPadding.p16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NotificationIcon(),
                  Text("جدول المواعيد", style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: FontSize.s15,color: ColorManager.white)),
                  SvgPicture.asset(ImageAssets.arrowBackIcon, color: ColorManager.white),
                ],
              ),
              const SizedBox(height: AppSize.s20),
              Container(
                padding: const EdgeInsets.all(AppSize.s15),
                height: AppSize.s370,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.s30)),
                ),
                child: TableCalendar(
                  firstDay: DateTime.utc(2020, 10, 16),
                  lastDay: DateTime.utc(2025, 3, 14),
                  focusedDay: DateTime.now(),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    leftChevronIcon: Row(
                      children: [
                        SvgPicture.asset(ImageAssets.arrowLeft),
                        const SizedBox(width: AppSize.s5,),
                        SvgPicture.asset(ImageAssets.arrowBackIcon),
                      ],
                    ),
                    rightChevronIcon: Row(
                      children: [
                        Text("يوليو 2024", style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: FontSize.s15, color: ColorManager.black),),
                        const SizedBox(width: AppSize.s5,),
                        SvgPicture.asset(ImageAssets.calendarDay),
                      ],
                    ),
                  ),
                  // make the day names is only the first letter of the day
                  dayHitTestBehavior: HitTestBehavior.translucent,

                  ),

                ),
              const SizedBox(height: AppSize.s24),
              Align(
                alignment: const AlignmentDirectional(1, 0),
                child: Text(
                  'مواعيد اليوم',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s20),
                ),
              ),
              const SizedBox(height: AppSize.s15),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index) {
                    return const CalenderListItem();
                  },
                  separatorBuilder: (context,index) {
                    return const SizedBox(height: AppSize.s10,);
                  },
                  itemCount: 10,
                ),
              ),
              // const CalenderEmptyState(),
            ],
          ),
        )
      ]
);
  }
}
