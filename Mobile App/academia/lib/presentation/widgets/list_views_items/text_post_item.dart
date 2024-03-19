import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:academia/presentation/widgets/list_views_items/reaction.dart';
import 'package:academia/presentation/widgets/elements/post_header.dart';
import 'package:academia/presentation/widgets/elements/post_image.dart';
import 'package:flutter/material.dart';
import '../../resources/font_manager.dart';
import '../elements/post_poll.dart';
import '../elements/post_poll_result.dart';
import 'category_item.dart';

class TextPostItem extends StatelessWidget {
  const TextPostItem({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPoll = false;
    bool showPollResult = false;
    bool isImage = false;

    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.s16),
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
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(AppPadding.p8),
              child: CategoryItem(
                  title: "تبقى 4 ايام",
                   width: AppSize.s80,
                  // height: AppSize.s30,
                  color: ColorManager.lightOrange1,
                  textColor: ColorManager.textOrange,
                  fontSize: FontSize.s12,
              ),
            ),
          ),
          if(isImage)
            const PostImage(image: ImageAssets.postImage,),
          if(isPoll)
            const PostPoll(),
          if(showPollResult)
            const PostPollResult(),
          const PostReactions(),
        ],
      ),
    );
  }
}
