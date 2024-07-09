import 'package:academia/app/constants.dart';
import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/routes_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/profile/profile_cubit/profile_cubit.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/profile/profile_cubit/profile_states.dart';
import 'package:academia/presentation/widgets/backgrounds/background.dart';
import 'package:academia/presentation/widgets/elements/header.dart';
import 'package:academia/presentation/widgets/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../resources/assets_manager.dart';
import '../../../../../resources/font_manager.dart';
import '../../../../../resources/values_manager.dart';
import '../../../../../widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return state is ProfileLoadingState
            ? const Center(child: CircularProgressIndicator())
            : state is ProfileErrorState
                ? Center(
                    child: CustomText(
                    text: state.error,
                    style: Theme.of(context).textTheme.bodyLarge!,
                  ))
                : SingleChildScrollView(
                    child: Stack(children: [
                      // background
                      const Background(
                        height: 240,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p13,
                            vertical: AppPadding.p16),
                        child: Column(
                          children: [
                            // title and notification icon
                            ScreenHeader(title: AppStrings.profile.tr, isBackButton: false),

                            const SizedBox(height: AppSize.s90),

                            // // user image
                            UserImage(
                              avatar: cubit.user!.avatar!,
                            ),

                            const SizedBox(
                              height: AppSize.s15,
                            ),

                            // // user name
                            CustomText(
                              text: cubit.user!.name!,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    fontSize: FontSize.s26,
                                  ),
                            ),
                            const SizedBox(
                              height: AppSize.s10,
                            ),

                            // user job
                            CustomText(
                              text: userData!.title!,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
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
                                    leading: DropdownButton<String>(
                                      value: cubit.selectedLanguage?.tr,
                                      // can you make the icon in the another side
                                      underline: const SizedBox(),
                                      iconEnabledColor: Theme.of(context).canvasColor,
                                      items: cubit.languages
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        cubit.changeLanguage(newValue!);
                                      },
                                    ),
                                    title: CustomText(
                                      text: AppStrings.changeLanguage,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!,
                                    ),
                                    trailing: CircleAvatar(
                                      radius: 30,
                                      backgroundColor:
                                          ColorManager.lightOrange1,
                                      child: SvgPicture.asset(
                                          ImageAssets.language),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  ListTile(
                                    leading: DropdownButton<String>(
                                      value: cubit.selectedTheme,
                                      underline: const SizedBox(),
                                      iconEnabledColor: Theme.of(context).canvasColor,
                                      items: cubit.themes
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        cubit.changeTheme(newValue!, context);
                                      },
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          text: AppStrings.modeSelection,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        CustomText(
                                          text: AppStrings.nightModeDescription,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  color: ColorManager.lightGrey,
                                                  fontSize: FontSize.s10),
                                        ),
                                      ],
                                    ),
                                    trailing: CircleAvatar(
                                      radius: 30,
                                      backgroundColor:
                                          ColorManager.lightOrange1,
                                      child: SvgPicture.asset(ImageAssets.mode),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  ListTile(
                                    leading: DropdownButton<String>(
                                      value: cubit.selectedFontSize,
                                      underline: const SizedBox(),
                                      iconEnabledColor: Theme.of(context).canvasColor,
                                      items: cubit.fontSizes
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        cubit.changeFontSize(newValue!);
                                      },
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CustomText(
                                          text: AppStrings.fontSelection,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomText(
                                          text: AppStrings
                                              .fontSelectionDescription,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  color: ColorManager.lightGrey,
                                                  fontSize: FontSize.s10),
                                        ),
                                      ],
                                    ),
                                    trailing: CircleAvatar(
                                      radius: 30,
                                      backgroundColor:
                                          ColorManager.lightOrange1,
                                      child: SvgPicture.asset(ImageAssets.lock),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  ListTile(
                                    leading: const Icon(
                                        Icons.arrow_back_ios_new_outlined),
                                    title: CustomText(
                                      text: AppStrings.changePassword,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!,
                                    ),
                                    trailing: CircleAvatar(
                                      radius: 30,
                                      backgroundColor:
                                          ColorManager.lightOrange1,
                                      child: SvgPicture.asset(ImageAssets.lock),
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, Routes.resetPasswordScreen);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  ListTile(
                                    leading: const Icon(
                                        Icons.arrow_back_ios_new_outlined),
                                    title: CustomText(
                                      text: AppStrings.rateOurApp,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!,
                                    ),
                                    trailing: CircleAvatar(
                                      radius: 30,
                                      backgroundColor:
                                          ColorManager.lightOrange1,
                                      child:
                                          SvgPicture.asset(ImageAssets.heart),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  ListTile(
                                    title: CustomText(
                                      text: AppStrings.logout,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!,
                                    ),
                                    trailing: CircleAvatar(
                                      radius: 30,
                                      backgroundColor:
                                          ColorManager.lightOrange1,
                                      child:
                                          SvgPicture.asset(ImageAssets.logout),
                                    ),
                                    onTap: () {
                                      cubit.logOut(context);
                                    },
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
      },
    );
  }
}
