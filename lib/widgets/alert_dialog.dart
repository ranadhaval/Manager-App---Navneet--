import 'package:flutter/material.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/extensions.dart';

class AlertDialogHelper extends Dialog {
  late String title;
  late String message;
  late String positiveBtnText;
  late String negativeBtnText;
  late VoidCallback positiveBtnClick;
  late VoidCallback negativeBtnClick;

  AlertDialogHelper(
      {Key? key,
      title = '',
      message = '',
      positiveBtnText = '',
      negativeBtnText = '',
      positiveBtnClick,
      negativeBtnClick})
      : super(key: key) {
    this.title = title;
    this.message = message;
    this.positiveBtnText = positiveBtnText;
    this.negativeBtnText = negativeBtnText;
    this.positiveBtnClick = positiveBtnClick;
    this.negativeBtnClick = negativeBtnClick;
  }

  @override
  Widget build(BuildContext context) {
    // set up the buttons
    List<Widget> actions = [];
    if (!negativeBtnText.isNullOrEmpty()) {
      Widget negativeButton = TextButton(
        onPressed: negativeBtnClick,
        child: Text(
          negativeBtnText,
          style: TextStyle(
              color: AppTheme.colorPrimary,
              fontSize: AppTheme.medium,
              fontWeight: FontWeight.normal),
        ),
      );
      actions.add(negativeButton);
    }
    if (!positiveBtnText.isNullOrEmpty()) {
      Widget positiveButton = TextButton(
        onPressed: positiveBtnClick,
        child: Text(
          positiveBtnText,
          style: TextStyle(
              color: AppTheme.colorPrimary,
              fontSize: AppTheme.medium,
              fontWeight: FontWeight.normal),
        ),
      );
      actions.add(positiveButton);
    }

    return AlertDialog(
      title: Visibility(
          visible: !title.isNullOrEmpty(),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: AppTheme.large, fontWeight: FontWeight.w600),
          )),
      content: Visibility(
        visible: !message.isNullOrEmpty(),
        child: Text(message),
      ),
      actions: actions,
    );
  }
}
