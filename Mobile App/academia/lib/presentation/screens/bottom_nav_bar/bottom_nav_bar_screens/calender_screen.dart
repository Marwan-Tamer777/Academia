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

import '../../../widgets/header.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(children: [
        // background
        Background(
          height: AppSize.s300.toInt(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p13, vertical: AppPadding.p16),
          child: Column(
            children: [
              // title and notification icon
              const ScreenHeader(
                title: "جدول المواعيد",
              ),
              const SizedBox(height: AppSize.s20),

              // calender
              Container(
                padding: const EdgeInsets.all(AppSize.s15),
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
                        SvgPicture.asset(
                          ImageAssets.arrowLeft,
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(
                          width: AppSize.s5,
                        ),
                        SvgPicture.asset(ImageAssets.arrowBackIcon),
                      ],
                    ),
                    rightChevronIcon: Row(
                      children: [
                        Text(
                          "يوليو 2024",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  fontSize: FontSize.s15,
                                  color: ColorManager.black),
                        ),
                        const SizedBox(
                          width: AppSize.s5,
                        ),
                        SvgPicture.asset(ImageAssets.calendarDay),
                      ],
                    ),
                    // hide the Middle Text of the header
                    titleCentered: false,
                    titleTextStyle: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 0),
                  ),
                  daysOfWeekHeight: AppSize.s30,
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  // change the container style of the current day
                    rangeStartDay: DateTime.now(),
                    rangeEndDay: DateTime.now(),
                  selectedDayPredicate: (day) {
                    return isSameDay(DateTime.now(), day);
                  },
                  calendarBuilders: CalendarBuilders(
                    dowBuilder: (context, day) {
                      return Container(
                        margin: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: Text(
                          days[day.weekday] as String,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontSize: FontSize.s15),
                        ),
                      );
                    },
                    selectedBuilder: (context, date, _) {
                      return Container(
                        decoration: BoxDecoration(
                          color: ColorManager.lightOrange1,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${date.day}',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontSize: FontSize.s15),
                        ),
                      );
                    },

                  )
                  // make the days 4 rows only

                  // make the day names is only the first letter of the day name
                ),
              ),
              const SizedBox(height: AppSize.s24),

              // calender tasks
              Align(
                alignment: const AlignmentDirectional(1, 0),
                child: Text(
                  'مواعيد اليوم',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: FontSize.s20),
                ),
              ),
              const SizedBox(height: AppSize.s15),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const CalenderListItem();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: AppSize.s10,
                  );
                },
                itemCount: 10,
              ),

              // if there is no tasks
              // const CalenderEmptyState(),
            ],
          ),
        )
      ]),
    );
  }
}

// create map take the number of the day and return the first letter of the day name

Map days = {
  1: "F",
  2: "S",
  3: "S",
  4: "M",
  5: "T",
  6: "W",
  7: "T"
};
