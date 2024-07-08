import 'package:academia/domain/models/comment.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/courses/screens/courses_screen.dart';
import 'package:academia/presentation/widgets/list_views_items/reaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../custom_text.dart';

class Reply extends StatelessWidget {
  final Comment reply;
  const Reply({super.key, required this.reply});

  @override
  Widget build(BuildContext context) {
    // bool hasReplies = true;
    return Column(
      mainAxisSize: MainAxisSize.max, 
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Icon(
              // horizontal three dots icon,
              Icons.more_horiz,
              size: AppSize.s24,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(text: 
                  'محمد أحمد حسنين',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: FontSize.s15,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomText(text: 
                  dateTimeFormatter(reply.postedOn!.toIso8601String()),
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: FontSize.s10,
                        color: ColorManager.lightGrey,
                      ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            const CircleAvatar(
              radius: AppSize.s20,
              backgroundColor: ColorManager.lightOrange1,
            ),
          ],
        ),
        const SizedBox(
          height: AppSize.s10,
        ),
        CustomText(text: 
          reply.content!,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: FontSize.s16,
                height: AppSize.s2,
              ),
        ),
        const SizedBox(
          height: 10,
        ),
        PostReactions(
          likes: reply.likes!.length,
          comments: 0,
        ),
        ],
    );
  }
}
