import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../custom_text.dart';

class TasksCalender extends StatelessWidget {
  const TasksCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSize.s15),
      decoration: const BoxDecoration(
        color: ColorManager.white,
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
                CustomText(text: 
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
                child: CustomText(text: 
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
                decoration: const BoxDecoration(
                  color: ColorManager.lightOrange1,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: CustomText(text: 
                  '${date.day}',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: FontSize.s15),
                ),
              );
            },
          )
      ),
    );
  }
}

Map days = {
  1: "F",
  2: "S",
  3: "S",
  4: "M",
  5: "T",
  6: "W",
  7: "T"
};

