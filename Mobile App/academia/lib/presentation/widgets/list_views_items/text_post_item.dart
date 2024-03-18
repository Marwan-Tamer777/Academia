import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/font_manager.dart';
import '../../resources/routes_manager.dart';
import 'category_item.dart';

class TextPostItem extends StatelessWidget {
  const TextPostItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPoll = false;
    bool showPollResult = false;
    bool isImage = false;

    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      height: AppSize.s300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.s16),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Icon(
                // horizontal three dots icon,
                Icons.more_horiz,
                size: AppSize.s24,
              ),
              const SizedBox(width: AppSize.s16),
              Container(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p4),
              decoration: BoxDecoration(
                  color: ColorManager.textOrange,
                  borderRadius: BorderRadius.circular(AppSize.s16),
              ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'تواصل',
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: FontSize.s12,
                        color: ColorManager.white,
                      ),
                    ),
                    SvgPicture.asset(
                      ImageAssets.messageComment,
                      width: AppSize.s24,
                      height: AppSize.s24,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                'منذ 15 ساعة',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: FontSize.s13,
                  color: ColorManager.lightGrey,
                ),
              ),
            ],
          ),
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
            Container(
              height: AppSize.s250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s16),
                image: const DecorationImage(
                  image: AssetImage(ImageAssets.postImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          if(isPoll)
            Container(
              height: AppSize.s250,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
                    padding: const EdgeInsets.all(AppPadding.p12),
                    decoration: BoxDecoration(
                      color: ColorManager.lightGrey2,
                      borderRadius: BorderRadius.circular(AppSize.s16),
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p8),
                        child: Text( "لوريم ايبسوم", style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: FontSize.s12,
                          color: ColorManager.black,
                        ),),
                      ),
                    ),
                  );
                },
              ),
            ),
          if(showPollResult)
            Container(
              height: AppSize.s250,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
                    padding: const EdgeInsets.all(AppPadding.p12),
                    decoration: BoxDecoration(
                      color: ColorManager.lightGrey2,
                      borderRadius: BorderRadius.circular(AppSize.s16),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text( "30 الف صوت", style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              fontSize: FontSize.s12,
                              color: ColorManager.black,
                            ),),
                            const Spacer(),
                            Text( "لوريم ايبسوم", style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              fontSize: FontSize.s12,
                              color: ColorManager.black,
                            ),),
                          ],
                        ),
                        const SizedBox(height: AppSize.s8),
                        LinearProgressIndicator(
                          value: 0.5,
                          backgroundColor: ColorManager.lightGrey,
                          valueColor: const AlwaysStoppedAnimation<Color>(ColorManager.textOrange),
                          // make it rounded more higher
                          minHeight: AppSize.s10,
                          borderRadius: BorderRadius.circular(AppSize.s16),
                        ),
                      ],
                    )
                  );
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24, vertical: AppPadding.p4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.postComments);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '4092',
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: FontSize.s16,
                          color: ColorManager.lightGrey,
                        ),
                      ),
                      SvgPicture.asset(
                        ImageAssets.message,
                        width: AppSize.s24,
                        height: AppSize.s24,
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '4092',
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: FontSize.s16,
                        color: ColorManager.lightGrey,
                    ),
                    ),
                    SvgPicture.asset(
                      ImageAssets.arrowUp,
                      width: AppSize.s24,
                      height: AppSize.s24,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
