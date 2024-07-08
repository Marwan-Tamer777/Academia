import 'package:academia/domain/models/post.dart';
import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:academia/presentation/widgets/list_views_items/post_write_comment.dart';
import 'package:academia/presentation/widgets/list_views_items/reaction.dart';
import 'package:academia/presentation/widgets/elements/post_header.dart';
import 'package:academia/presentation/widgets/elements/post_image.dart';
import 'package:academia/presentation/widgets/elements/post_poll_result.dart';
import 'package:academia/presentation/widgets/post_attachments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../resources/font_manager.dart';
import '../custom_text.dart';
import '../elements/post_poll.dart';
import '../remaining_days_part.dart';
import 'category_item.dart';

class TextPostCommentsItem extends StatelessWidget {
  const TextPostCommentsItem({super.key});

  @override
  Widget build(BuildContext context) { 

    bool isPoll = false;
    bool showPollResult = false;
    bool isImage = true;

    TextEditingController commentController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(AppSize.s16),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          //PostHeader(post: post),
          const SizedBox(
            height: AppSize.s10,
          ),

          CustomText(text: 
            'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت, ,كونسيكتيتور أدايبا يسكينج أليايت .... قراءة المزيد',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: FontSize.s16,
                  height: AppSize.s2,
                ),
          ),

          const RemainingDays(remainingDays: 4),
          CustomText(text:
            'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت, ,كونسيكتيتور أدايبا يسكينج أليايت .... قراءة المزيد',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: FontSize.s13,
                  color: ColorManager.lightGrey,
                  // make space between lines
                  height: AppSize.s2,
                ),
          ),
          const SizedBox(
            height: 10,
          ),

          const PostAttachments(),
          const SizedBox(
            height: 10,
          ),

          if (isImage) const PostImage(image: ImageAssets.postImage),
          if (isPoll) const PostPoll(),
          if (showPollResult) const PostPollResult(),

         //PostReactions(post: post),
          const SizedBox(
            height: 10,
          ),
          const PostAddComment(),
        ],
      ),
    );
  }
}
