import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerapp/routes/app_routes.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/widgets/coustom_text.dart';

errorDialog(String message, [String? title, bool screenback = false]) {
  if (title == null) {
    title = Strings.error;
  }
  Get.dialog(AlertDialog(
    title: CustomText(
      textAlign: TextAlign.left,
      title: title,
      fontSize: AppTheme.large,
      colors: AppTheme.titleDark,
    ),
    content: CustomText(
      textAlign: TextAlign.left,
      title: message,
      fontSize: AppTheme.medium,
      maxLines: 3,
      colors: AppTheme.titleDark,
    ),
    actions: [
      TextButton(
        onPressed: () {
          Get.back();
          if (screenback) {
            Get.back(result: true);
          }
        },
        child: CustomText(
          textAlign: TextAlign.left,
          title: Strings.ok,
          maxLines: 3,
          fontSize: AppTheme.medium,
          colors: AppTheme.colorPrimary,
        ),
      )
    ],
  ));
}
