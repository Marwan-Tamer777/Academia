import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class Dots extends StatelessWidget { 
  final int currentIndex; 
  final int length; 
  
  const Dots({super.key, required this.currentIndex, required this.length});

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(5),
                        height: 10,
                        width: currentIndex == index ? 30 : 10,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? ColorManager.textOrange
                              : ColorManager.lightOrange1,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                );
  }
}