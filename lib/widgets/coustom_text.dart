import 'package:flutter/material.dart';
import 'package:managerapp/theme/app_theme.dart';

class CustomText extends StatefulWidget {
  var title;
  Color colors;
  double fontSize;
  double height;
  FontWeight fontWeight;
  TextAlign textAlign;
  int? maxLines;
  TextDecoration? decoration;
  String fontFamily;

  CustomText({
    Key? key,
    this.fontFamily = "",
    required this.title,
    this.colors = Colors.white,
    this.fontSize = AppTheme.small,
    this.height = 1,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.maxLines,
    this.decoration,
  }) : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title.toString(),
      textAlign: widget.textAlign,
      style: TextStyle(
        color: widget.colors,
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
        height: widget.height,
        decoration: widget.decoration,
        fontFamily: widget.fontFamily,
      ),
      textScaleFactor: 1,
      softWrap: true,
      maxLines: widget.maxLines,
    );
  }
}
