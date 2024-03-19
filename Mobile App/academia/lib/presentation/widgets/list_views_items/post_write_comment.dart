import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import '../common_widgets.dart';

class PostAddComment extends StatelessWidget {
  const PostAddComment({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController commentController = TextEditingController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 8,
          child: CommonTextFormField(
            controller: commentController,
            color: ColorManager.lightGrey3,
            hint: "اكتب تعليق",
            prefixIcon: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child:InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(ImageAssets.send)),
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: CircleAvatar(
            radius: AppSize.s20,
            backgroundColor: ColorManager.lightOrange1,

          ),
        ),
      ],
    );
  }
}
