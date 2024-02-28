import 'package:academia/presentation/resources/color_manager.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'bottom_nav_bar_cubit/bottom_nav_bar_states.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        var cubit = BottomNavBarCubit.get(context);

        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              index: 0,
              height: 60.0,
              items: <Widget>[
                Icon(Icons.add, size: 30),
                Icon(Icons.list, size: 30),
                Icon(Icons.compare_arrows, size: 30),
                Icon(Icons.call_split, size: 30),
                Icon(Icons.perm_identity, size: 30),
              ],
              color: Colors.white,
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 600),
              onTap: (index) {
                cubit.changeBottomNavBarState(index);
              },
              letIndexChange: (index) => true,
            ),

            body: cubit.screens[cubit.currentIndex],
          ),
        );
      },
    );
  }
}
