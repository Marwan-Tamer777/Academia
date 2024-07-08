import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/widgets/finish_evaluation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:academia/presentation/widgets/common_widgets.dart';
import 'package:academia/presentation/widgets/custom_text.dart';

class EvaluationBottomSheet extends StatefulWidget {
  const EvaluationBottomSheet({super.key});

  @override
  State<EvaluationBottomSheet> createState() => _EvaluationBottomSheetState();
}

class _EvaluationBottomSheetState extends State<EvaluationBottomSheet> {
  final PageController _pageController = PageController();
  final TextEditingController _commentController = TextEditingController();
  double _rating = 3; // Default rating

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Container( 
                  padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 10,
          ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [ 
               Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none, // Allows the icon to be half outside the container
                children: [
                  Column( 
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 30), // Adjusted for the icon's half outside
                      // Your existing widgets...
                    ],
                  ),
                  Positioned(
                    top: -50, // Half of the icon's size to be outside
                    child: CircleAvatar( 
                      radius: 50, 
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: ColorManager.lightOrange1, // Example color
                        child: SvgPicture.asset(
                          ImageAssets.evaluation,
                          width: 40,
                          height: 40,
                      ),
                      )
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s30),
              SmoothPageIndicator(
                controller: _pageController,
                count: 4,
                effect: const ExpandingDotsEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  spacing: 4,
                  expansionFactor: 4,
                  activeDotColor: ColorManager.textOrange,
                ),
              ),
              const SizedBox(height: AppSize.s20),
              Container( 
                height: 400,
                child: PageView(
                  controller: _pageController,
                  children: List.generate(4, (index) => _buildEvaluationPage(index)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } 

  String getSendButtonText(int index) {
    if (index == 0) {
      return AppStrings.startEvaluation.tr;
    } else if(index == 3) {
      return AppStrings.sendEvaluation.tr;
    } else {
      return AppStrings.next.tr;
    }
  }

  Widget _buildEvaluationPage(int index) {
      if(index == 0) {
        return Column(
          children: [
                    CustomText(text: AppStrings.helpUsImprove, style: Theme.of(context).textTheme.bodyLarge!,textAlign: TextAlign.center,),
const SizedBox(height: AppSize.s20), 
        CustomText(text: AppStrings.helpUsImproveDescription, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: ColorManager.darkGrey),textAlign: TextAlign.center,),
        const SizedBox(height: AppSize.s20),
                BigButton(
          onPressed: () {
            // go to next page 
            _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
            _commentController.clear();
          },
          text: getSendButtonText(index),
        ),
          ],
          );
      }
      else { 
        return Column(
      children: [
        CustomText(text: evaluations[index], style: Theme.of(context).textTheme.bodyLarge!),
        const SizedBox(height: AppSize.s20),
        CustomRatingBar(
          initialRating: _rating,
          onRatingSelected: (rating) {
            setState(() {
              _rating = rating;
            });
          },
        ),
        const SizedBox(height: AppSize.s20),
        CommonTextFormField(
          controller: _commentController,
          hint: AppStrings.writeYourComment.tr, 
          maxLines: 5,
        ),
        const SizedBox(height: AppSize.s20),
        BigButton(
          onPressed: () {
            if (index == 3) {
            Get.back(); 
            showDialog(
            context: context,
            builder: (context) => const FinishEvaluationDialog(),
          );            } else {
              // go to next page
              _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
              _commentController.clear();
            }
          },
          text: getSendButtonText(index),
        ),
      ],
    );
  
      }
    }
}


class CustomRatingBar extends StatefulWidget {
  final double initialRating;
  final Function(double) onRatingSelected;

  const CustomRatingBar({
    Key? key,
    required this.initialRating,
    required this.onRatingSelected,
  }) : super(key: key);

  @override
  _CustomRatingBarState createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {
  double? _selectedRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedRating = index.toDouble();
            });
            widget.onRatingSelected(index.toDouble());
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  _getStarAsset(index),
                  color: (_selectedRating != null && index == _selectedRating!) ? Colors.amber : Colors.grey,
                ),
                Text(
                  _getStarLabel(index),
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        );
      }).reversed.toList(),
    );
  }

  String _getStarAsset(int index) {
    switch (index) {
      case 0:
        return ImageAssets.poor;
      case 1:
        return ImageAssets.accepted;
      case 2:
        return ImageAssets.good;
      case 3:
        return ImageAssets.veryGood;
      case 4:
        return ImageAssets.excellent;
      default:
        return ImageAssets.poor; // Default case, should not be reached
    }
  }

  String _getStarLabel(int index) {
    switch (index) {
      case 0:
        return AppStrings.poor.tr;
      case 1:
        return AppStrings.accepted.tr;
      case 2:
        return AppStrings.good.tr;
      case 3:
        return AppStrings.veryGood.tr;
      case 4:
        return AppStrings.excellent.tr;
      default:
        return ""; // Default case, should not be reached
    }
  }
}

List<String> evaluations = [
    AppStrings.evaluationQuestion1,
    AppStrings.evaluationQuestion1,
    AppStrings.evaluationQuestion2,
    AppStrings.evaluationQuestion3,
];