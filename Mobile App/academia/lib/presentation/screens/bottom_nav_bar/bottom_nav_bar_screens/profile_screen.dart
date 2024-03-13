import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/widgets/backgrounds/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/elements/notification_icon.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(children: [
        // background
        const Background(
          height: 240,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p13, vertical: AppPadding.p16),
          child: Column(
            children: [
              // title and notification icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NotificationIcon(),
                  Text(
                    "الملف الشخصى",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Colors.white,
                          fontSize: FontSize.s17,
                        ),
                  ),
                  SvgPicture.asset(
                    ImageAssets.arrowBackIcon,
                    width: AppSize.s24,
                    height: AppSize.s24,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(height: AppSize.s90),

              // user image
              Container(
                height: AppSize.s150,
                width: AppSize.s150,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(AppSize.s30)),
                ),
              ),
              const SizedBox(
                height: AppSize.s15,
              ),

              // user name
              Text(
                'مروان تامر جلال عبدالمجيد',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: FontSize.s26,
                    ),
              ),
              const SizedBox(
                height: AppSize.s10,
              ),

              // user job
              Text(
                'أستاذ مساعد',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Colors.grey,
                      fontSize: FontSize.s14,
                    ),
              ),
              const SizedBox(
                height: 35,
              ),

              // settings
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "تغيير اللغة",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset(ImageAssets.egypt),
                        ],
                      ),
                      title: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "تغيير اللغة",
                            style: Theme.of(context).textTheme.bodyLarge,
                          )),
                      trailing: CircleAvatar(
                        radius: 30,
                        backgroundColor: ColorManager.lightOrange1,
                        child: SvgPicture.asset(ImageAssets.language),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ListTile(
                      leading: SvgPicture.asset(ImageAssets.switchButton),
                      title: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "الوضع الليلى",
                            style: Theme.of(context).textTheme.bodyLarge,
                          )),
                      trailing: CircleAvatar(
                        radius: 30,
                        backgroundColor: ColorManager.lightOrange1,
                        child: SvgPicture.asset(ImageAssets.mode),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ListTile(
                      leading: SvgPicture.asset(ImageAssets.arrowLeft),
                      title: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "تغيير كلمة المرور",
                            style: Theme.of(context).textTheme.bodyLarge,
                          )),
                      trailing: CircleAvatar(
                        radius: 30,
                        backgroundColor: ColorManager.lightOrange1,
                        child: SvgPicture.asset(ImageAssets.lock),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ListTile(
                      leading: SvgPicture.asset(ImageAssets.arrowLeft),
                      title: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "قيم تطبيقنا",
                            style: Theme.of(context).textTheme.bodyLarge,
                          )),
                      trailing: CircleAvatar(
                        radius: 30,
                        backgroundColor: ColorManager.lightOrange1,
                        child: SvgPicture.asset(ImageAssets.heart),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ListTile(
                      title: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "تسجيل الخروج",
                            style: Theme.of(context).textTheme.bodyLarge,
                          )),
                      trailing: CircleAvatar(
                        radius: 30,
                        backgroundColor: ColorManager.lightOrange1,
                        child: SvgPicture.asset(ImageAssets.logout),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              )
            ],
          ),
        )
      ]),
    );
  }
}
