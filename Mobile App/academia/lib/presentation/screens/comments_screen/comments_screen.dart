import 'package:academia/presentation/widgets/elements/app_bar.dart';
import 'package:academia/presentation/widgets/list_views_items/comment_item.dart';
import 'package:academia/presentation/widgets/list_views_items/text_post_comments_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/elements/notification_icon.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leadingWidth: 70,
        backgroundColor: ColorManager.darkBlueBackground,
        leading: const Padding(
          padding: EdgeInsets.all(16.0),
          child: NotificationIcon(),
        ),
        title: Text('اسم المادة', style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s20,color: ColorManager.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p13, vertical: AppPadding.p16),
            child: SvgPicture.asset(ImageAssets.arrowBackIcon, color: ColorManager.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
                const TextPostCommentsItem(),
                const SizedBox(height: AppSize.s20),
                Row(
                  children: [
                    SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(ImageAssets.message,)),
                    const Spacer(),
                    Text('التعليقات', style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s20,color: ColorManager.darkBlueBackground)),
                  ],
                ),
                const SizedBox(height: AppSize.s20),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  itemBuilder: (context,index) {
                    return const CommentItem();
                  },
                  separatorBuilder: (context,index) {
                    return const SizedBox(height: AppSize.s20);
                  },
                  itemCount: 10,
                )
            ],
          ),
        ),
      ),
    );
  }
}
