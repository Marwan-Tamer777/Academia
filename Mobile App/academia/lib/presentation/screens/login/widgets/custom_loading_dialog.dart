import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/screens/login/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customLoadingDialog({
  required BuildContext context,
  String? text,
}) {
  showCustomAlertDialog(
    context: context,
    title: text ?? AppStrings.pleaseWait.tr,
    content: const Center(child: CircularProgressIndicator()),
  );
}
