import 'package:academia/presentation/widgets/reply.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import 'category_item.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key});

  @override
  Widget build(BuildContext context) {

    bool hasReplies = true;
    return Container(
      height: 1000,
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.s16),
        border: Border.all(width: 1),
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
          SizedBox(height: 10,),
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
          if (hasReplies)
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    height: 400,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context,index) {
                        hasReplies = false;
                        return const Reply();
                      },
                      separatorBuilder: (context,index) {
                        return const SizedBox(height: AppSize.s20);
                      },
                      itemCount: 1,
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: SizedBox(width: 20,)),
              ],
            ),
        ],
      ),
    );
  }
}
