import 'package:academia/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
class Circles extends StatelessWidget {
  const Circles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const CircleAvatar(
            radius: 20,
            backgroundColor: ColorManager.lightOrange1,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: -8);
        },
      ),
    );
  }
}
