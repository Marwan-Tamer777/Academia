import 'package:academia/domain/models/post.dart';
import 'package:academia/domain/models/quiz.dart';
import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/routes_manager.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:academia/presentation/screens/course_screen/cubit/course_cubit.dart';
import 'package:academia/presentation/widgets/list_views_items/reaction.dart';
import 'package:academia/presentation/widgets/elements/post_header.dart';
import 'package:academia/presentation/widgets/elements/post_image.dart';
import 'package:academia/presentation/widgets/list_views_items/task_component.dart';
import 'package:flutter/material.dart';
import '../../resources/font_manager.dart';
import '../custom_text.dart';
import '../elements/post_poll.dart';
import '../elements/post_poll_result.dart';

class TextPostItem extends StatelessWidget { 
  final Post post;
  const TextPostItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    bool isPoll = false;
    bool showPollResult = false;
    bool isImage = false;
    Quiz? quiz = post.quiz;

    return InkWell( 
      onTap: () async { 
         await CourseCubit.of(context).getPostComments(post);
         Navigator.pushNamed(context, Routes.postComments, arguments: post);
      },
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(AppSize.s16),
          shape: BoxShape.rectangle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max, 
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            PostHeader(post: post),
            const SizedBox(
              height: AppSize.s10,
            ),
            CustomText(text: post.content!,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: FontSize.s16,
                    height: AppSize.s2,
                  ),
            ),
            // const RemainingDays(remainingDays: 4), 
            SizedBox(height: 10,),
            if (isImage)
              const PostImage(
                image: ImageAssets.postImage,
              ),
            if (isPoll) const PostPoll(),
            if (showPollResult) const PostPollResult(), 
            if(quiz != null) ... {
              TaskComponent(quiz: quiz,)
            },
            
           PostReactions(likes: post.likes!.length, comments: post.comments!.length),
          ],
        ),
      ),
    );
  }
}
