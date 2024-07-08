import 'package:academia/domain/models/comment.dart';
import 'package:academia/presentation/widgets/list_views_items/reply.dart';
import 'package:flutter/material.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../custom_text.dart';

class CommentItem extends StatelessWidget { 
  final Comment comment;
  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    bool hasReplies = true;

    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s16),
        border: Border.all(width: 1, color: ColorManager.lightGrey),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          //const PostHeader(),
          const SizedBox(
            height: AppSize.s10,
          ),
          Reply(
            reply: comment,
          ),
          const SizedBox(
            height: 10,
          ),
          //const PostReactions(),
],
      ),
    );
  }
}
