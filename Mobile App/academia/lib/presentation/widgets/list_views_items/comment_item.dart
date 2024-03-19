import 'package:academia/presentation/widgets/list_views_items/reaction.dart';
import 'package:academia/presentation/widgets/elements/post_header.dart';
import 'package:academia/presentation/widgets/list_views_items/reply.dart';
import 'package:flutter/material.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key});

  @override
  Widget build(BuildContext context) {
    bool hasReplies = true; 

    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s16),
        border: Border.all(width: 1,color: ColorManager.lightGrey),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const PostHeader(),
          const SizedBox(
            height: AppSize.s10,
          ),
          Text(
            'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت, ,كونسيكتيتور أدايبا يسكينج أليايت .... قراءة المزيد',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: FontSize.s16,
              color: ColorManager.black,
              // make space between lines
              height: AppSize.s2,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 10,),
          const PostReactions(),
          if (hasReplies)
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index) {
                      return const Reply();
                    },
                    separatorBuilder: (context,index) {
                      return const SizedBox(height: AppSize.s20);
                    },
                    itemCount: 1,
                  ),
                ),
                const Expanded(
                    flex: 1,
                    child: VerticalDivider(
                      color: ColorManager.lightGrey,
                      thickness: 4,
                    )
                ),
              ],
            ),
        ],
      ),
    );
  }
}
