import 'package:academia/presentation/widgets/custom_text.dart';
import 'package:flutter/Material.dart';

void showCustomAlertDialog({
  required BuildContext context,
  required String title,
  Widget? content, 
  List<Widget>? actions,
  double? horizontalPadding,
  double? verticalPadding,
  double? intensHorizontalPadding,
}) {
  showDialog(
    builder: (context) {
      return AlertDialog(
        insetPadding: EdgeInsets.symmetric(
          horizontal: intensHorizontalPadding ?? 12,
        ),
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Center(
          child: CustomText(
            text: title,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,)
          ),
        ),
        content: SingleChildScrollView(child: content), 
        contentPadding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 10,
          vertical: verticalPadding ?? 20,
        ),
      ); 

    },
    context: context,
  );
}
