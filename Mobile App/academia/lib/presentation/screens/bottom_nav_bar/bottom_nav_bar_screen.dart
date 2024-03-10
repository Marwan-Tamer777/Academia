import 'package:academia/app/cubit/app_cubit.dart';
import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/theme_manager.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'bottom_nav_bar_cubit/bottom_nav_bar_states.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<NavigationBarIcons> icons = [
      NavigationBarIcons(
        iconActive: ImageAssets.profileActive,
        iconInactive: ImageAssets.profile,
      ),
      NavigationBarIcons(
        iconActive: ImageAssets.detailsActive,
        iconInactive: ImageAssets.details,
      ),
      NavigationBarIcons(
        iconActive: ImageAssets.calenderActive,
        iconInactive: ImageAssets.calender,
      ),
      NavigationBarIcons(
        iconActive: ImageAssets.homeActive,
        iconInactive: ImageAssets.home,
      ),
    ];
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        var cubit = BottomNavBarCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: cubit.currentIndex == 4
                    ? ColorManager.lightOrangeStatusBar
                    : ColorManager.darkBlueBackground,
                onPressed: () {
                  cubit.changeBottomNavBarState(4);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    ImageAssets.courses,
                  ),
                )),
            bottomNavigationBar: AnimatedBottomNavigationBar.builder(
              height: 60,
              onTap: (index) {
                cubit.changeBottomNavBarState(index);
              },
              notchSmoothness: NotchSmoothness.softEdge,
              gapLocation: GapLocation.center,
              activeIndex: cubit.currentIndex,
              itemCount: icons.length,
              leftCornerRadius: 30,
              rightCornerRadius: 30,
              tabBuilder: (index, isActive) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    isActive
                        ? icons[index].iconActive
                        : icons[index].iconInactive,
                  ),
                );
              },
              backgroundColor: Theme.of(context)
                  .extension<CustomThemeExtension>()!
                  .navBarColor,
            ),
            body: cubit.screens[cubit.currentIndex],
            resizeToAvoidBottomInset: false,
            extendBody: true,
            drawer: FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: cubit.currentIndex == 4
                    ? ColorManager.lightOrangeStatusBar
                    : ColorManager.darkBlueBackground,
                onPressed: () {
                  AppCubit.getCubit(context).changeTheme();
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.dark_mode,
                    color: ColorManager.white,
                  ),
                )),
            drawerEdgeDragWidth: 100,
          ),
        );
      },
    );
  }
}

class NavigationBarIcons {
  final String iconActive;
  final String iconInactive;
  // final String label;

  NavigationBarIcons({
    required this.iconActive,
    required this.iconInactive,
    // required this.label,
  });
}
