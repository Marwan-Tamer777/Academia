import 'package:academia/app/dep_injection.dart';
import 'package:academia/domain/models/post.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/resources/theme_manager.dart';
import 'package:academia/presentation/screens/course_screen/cubit/course_cubit.dart';
import 'package:academia/presentation/screens/course_screen/cubit/course_states.dart';
import 'package:academia/presentation/widgets/list_views_items/comment_item.dart';
import 'package:academia/presentation/widgets/list_views_items/text_post_comments_item.dart';
import 'package:academia/presentation/widgets/list_views_items/text_post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/elements/notification_icon.dart';
import '../../widgets/custom_text.dart';

class CommentsScreen extends StatelessWidget {
  final Post post;
  const CommentsScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CourseCubit>.value( 
      value: getItInstance<CourseCubit>(),
      child: BlocBuilder<CourseCubit, CourseStates>(
        builder: (context, state) { 
          var cubit = CourseCubit.of(context);
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 70,
              leadingWidth: 70,
              backgroundColor: Theme.of(context)
                  .extension<CustomThemeExtension>()!
                  .patternAppBarColor,
              leading: const Padding(
                padding: EdgeInsets.all(16.0),
                child: NotificationIcon(),
              ),
              title: CustomText(
                  text: AppStrings.courseName,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: FontSize.s20, color: ColorManager.white)),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p13, vertical: AppPadding.p16),
                  child: SvgPicture.asset(ImageAssets.arrowBackIcon,
                      color: ColorManager.white),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(11.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextPostItem(
                      post: post,
                    ),
                    const SizedBox(height: AppSize.s20),
                    Row(
                      children: [
                        SizedBox(
                            height: 24,
                            width: 24,
                            child: SvgPicture.asset(
                              ImageAssets.message,
                            )),
                        const Spacer(),
                        CustomText(
                            text: AppStrings.comments,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: FontSize.s20,
                                  // color: ColorManager.darkBlueBackground,
                                )),
                      ],
                    ),
                    const SizedBox(height: AppSize.s20),
                      cubit.comments!.isNotEmpty ? ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CommentItem(comment: cubit.comments![index],);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: AppSize.s20);
                      },
                      itemCount: cubit.comments!.length,
                    ) : const CircularProgressIndicator(),
                  
                    ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
