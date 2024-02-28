import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/font_manager.dart';
import 'package:academia/presentation/screens/take_quiz_screen/take_quiz_screen_cubit/take_quiz_screen_cubit.dart';
import 'package:academia/presentation/screens/take_quiz_screen/take_quiz_screen_cubit/take_quiz_screen_states.dart';
import 'package:academia/presentation/widgets/backgrounds/background.dart';
import 'package:academia/presentation/widgets/list_views_items/Question_number.dart';
import 'package:academia/presentation/widgets/list_views_items/question_list_item.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/color_manager.dart';
import '../../widgets/elements/notification_icon.dart';
import '../bottom_nav_bar/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import '../bottom_nav_bar/bottom_nav_bar_cubit/bottom_nav_bar_states.dart';

class TakeQuizScreen extends StatelessWidget {
  const TakeQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                const Background(height: 400,),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const NotificationIcon(),
                          Text("الاختبار 1", style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: FontSize.s15,color: ColorManager.white)),
                          SvgPicture.asset(ImageAssets.arrowBackIcon, color: ColorManager.white),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Container(
                        height: 80,
                        child: ListView.separated(
                          //shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return QuestionNumber(questionNumber: index+1);
                          },
                          separatorBuilder: (context, index) => const SizedBox(width: 5),
                          itemCount: 10,
                        ),
                      ),
                      const SizedBox(height: 24),
                      QuestionListItem(),
          
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
              builder: (BuildContext context, BottomNavBarState state) {
                var cubit = BottomNavBarCubit.get(context);
                return CurvedNavigationBar(
                  index: cubit.currentIndex,
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
                    //cubit.changeBottomNavBarState(index);
                  },
                  letIndexChange: (index) => true,
                );
              },
            ),
          ),
        );
      },
    );
  }
}


