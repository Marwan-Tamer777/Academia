import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:academia/presentation/widgets/list_views_items/post_write_comment.dart';
import 'package:academia/presentation/widgets/list_views_items/reaction.dart';
import 'package:academia/presentation/widgets/elements/post_header.dart';
import 'package:academia/presentation/widgets/elements/post_image.dart';
import 'package:academia/presentation/widgets/elements/post_poll_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../resources/font_manager.dart';
import '../elements/post_poll.dart';
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
          Text(
            'لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت, ,كونسيكتيتور أدايبا يسكينج أليايت .... قراءة المزيد',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: FontSize.s13,
              color: ColorManager.lightGrey,
              // make space between lines
              height: AppSize.s2,
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              const Spacer(),
              CategoryItem(
                width: AppSize.s100,
                color: ColorManager.lightOrange1,
                textColor: ColorManager.textOrange,
                fontSize: FontSize.s12,
                child: Row(
                  children: [
                    Text(
                      "ملخص الدرس",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 10, color: ColorManager.textOrange),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(ImageAssets.pdf),
                  ],
                ) ,
              ),
              const SizedBox(width: 10,),
              CategoryItem(
                width: AppSize.s100,
                color: ColorManager.lightOrange1,
                textColor: ColorManager.textOrange,
                fontSize: FontSize.s12,
                child: Row(
                  children: [
                    Text(
                      "ملخص الدرس",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 10, color: ColorManager.textOrange),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(ImageAssets.pdf),
                  ],
                ) ,
              ),
            ],
          ),
          const SizedBox(height: 10,),
          if(isImage)
            const PostImage(image: ImageAssets.postImage),
          if(isPoll)
            const PostPoll(),
          if(showPollResult)
            const PostPollResult(),
          const PostReactions(),
          const SizedBox(height: 10,),
          const PostAddComment(),
        ],
      ),
    );
  }
}
