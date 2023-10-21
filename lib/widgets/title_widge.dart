import 'package:flutter/material.dart';
import 'package:managerapp/theme/app_theme.dart';

class InputTitleRequire extends StatelessWidget {
  String title;
  bool require;

  InputTitleRequire({
    Key? key,
    required this.title,
    required this.require,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
          text: title,
          style: TextStyle(
            color: AppTheme.titleDark,
            fontSize: AppTheme.medium,
            fontWeight: FontWeight.normal,
          ),
          children: [
            if (require)
              const TextSpan(
                text: " *",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: AppTheme.small,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ]),
    );
  }
}
