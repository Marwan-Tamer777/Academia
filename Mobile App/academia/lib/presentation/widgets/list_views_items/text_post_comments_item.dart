import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/font_manager.dart';
import '../common_widgets.dart';
import 'category_item.dart';

class TextPostCommentsItem extends StatelessWidget {
  const TextPostCommentsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPoll = false;
    bool showPollResult = false;
    bool isImage = false;

    TextEditingController commentController = TextEditingController();




    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      //height: AppSize.s300,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'محمد أحمد حسنين',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: FontSize.s12,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'منذ 15 ساعة',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: FontSize.s8,
                      color: ColorManager.lightGrey,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10,),
              CircleAvatar(
                radius: AppSize.s20,
                backgroundColor: ColorManager.lightOrange1,

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
                  // width: AppSize.s80,
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
          SizedBox(height: 10,),
          Row(
            children: [
              Spacer(),
              Container(
        padding: const EdgeInsets.all(AppPadding.p10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s30),
          color: ColorManager.lightOrange1,
        ),
        child: Center(
            child: Row(
              children: [
                Text(
                  "ملخص الدرس",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 10, color: ColorManager.textOrange),
                ),
                SizedBox(width: 5,),
                SvgPicture.asset(ImageAssets.pdf),
              ],
            )),
      ),
              SizedBox(width: 10,),
              Container(
                padding: const EdgeInsets.all(AppPadding.p10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s30),
                  color: ColorManager.lightOrange1,
                ),
                child: Center(
                    child: Row(
                      children: [
                        Text(
                          "ملخص الدرس",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 10, color: ColorManager.textOrange),
                        ),
                        SizedBox(width: 5,),
                        SvgPicture.asset(ImageAssets.pdf),
                      ],
                    )),
              ),
            ],
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
                      ImageAssets.message,
                      width: AppSize.s24,
                      height: AppSize.s24,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      ImageAssets.arrowDown,
                      width: AppSize.s24,
                      height: AppSize.s24,
                    ),
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
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                flex: 8,
                child: CommonTextFormField(
                  controller: commentController,
                  hint: "اكتب تعليق",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child:InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(ImageAssets.send)),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  radius: AppSize.s20,
                  backgroundColor: ColorManager.lightOrange1,

                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
