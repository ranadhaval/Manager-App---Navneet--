import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';

class CoustomTextField extends StatelessWidget {
  final String? labelText;
  final Widget? prefixIcon;
  final TextEditingController? textEditingController;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final FormFieldValidator<String>? onTextValidator;
  final bool obscureText;
  final int maxLines;
  final Function()? onTextFiledOnTap;
  final bool readOnly;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final double borderCorner;
  final Color? borderEnableColors;
  final Color? borderFocusColors;
  final Color? borderErrorColors;
  final Color? fillColor;
  final Color? cursorColor;
  final Color? textColor;
  final Color? hintColor;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final double? fontSize;
  final double? errorFontSize;
  final FontWeight? fontWeight;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool showCursor;
  final bool isTablet;
  BoxConstraints? prefixIconBoxConstrains;

  CoustomTextField({
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.textEditingController,
    this.onChanged,
    this.onSubmit,
    this.obscureText = false,
    this.maxLines = 1,
    this.onTextFiledOnTap,
    required this.onTextValidator,
    this.readOnly = false,
    this.showCursor = true,
    this.isTablet = false,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.borderEnableColors,
    this.borderFocusColors,
    this.borderErrorColors,
    this.fillColor,
    this.cursorColor,
    this.textColor,
    this.textAlign,
    this.contentPadding,
    this.prefixIconBoxConstrains,
    this.fontSize,
    this.errorFontSize,
    this.fontWeight,
    this.maxLength,
    this.inputFormatters,
    this.hintColor,
    this.borderCorner = Constant.BTN_ROUNDED_CORNER,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: TextFormField(
        cursorColor: cursorColor ?? AppTheme.titleDark,
        cursorWidth: 2,
        cursorHeight: isTablet ? 20 : 15,
        cursorRadius: const Radius.circular(1),
        textAlign: textAlign ?? TextAlign.start,
        focusNode: focusNode,
        showCursor: showCursor,
        textAlignVertical: TextAlignVertical.center,
        inputFormatters: (inputFormatters != null) ? inputFormatters : null,
        decoration: InputDecoration(
            contentPadding: contentPadding,
            prefixIcon: prefixIcon ?? null,
            suffixIcon: suffixIcon ?? null,
            filled: true,
            isCollapsed: true,
            isDense: false,
            hoverColor: Colors.white,
            fillColor: fillColor ?? AppTheme.colorWhite,
            counterText: "",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderCorner),
              borderSide: BorderSide(color: AppTheme.colorPrimary, width: 0.5),
            ),
            focusColor: Colors.transparent,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderCorner),
              borderSide: BorderSide(
                  color: borderFocusColors ?? AppTheme.colorPrimary,
                  width: 0.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderCorner),
              borderSide: BorderSide(
                color: borderEnableColors ?? AppTheme.colorIconGrey,
                width: 0.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderCorner),
              borderSide: BorderSide(
                  color: borderErrorColors ?? AppTheme.colorError, width: 0.5),
            ),
            //labelText: labelText,
            hintText: labelText,
            hintStyle: TextStyle(
                fontSize: fontSize ?? AppTheme.medium,
                fontWeight: FontWeight.normal,
                height: 1,
                color: hintColor ?? AppTheme.titleDark),
            alignLabelWithHint: true,
            labelStyle: TextStyle(
              color: AppTheme.titleDark,
              fontSize: fontSize ?? AppTheme.medium,
              fontWeight: FontWeight.normal,
              height: 1,
              fontFamily: AppTheme.appFontName,
              decoration: TextDecoration.none,
            ),
            errorStyle: TextStyle(
              color: AppTheme.colorError,
              fontWeight: FontWeight.normal,
              fontSize: errorFontSize ?? AppTheme.errorSize,
            ),
            errorMaxLines: 3),
        style: TextStyle(
          color: readOnly
              ? textColor ?? AppTheme.colorGray
              : textColor ?? AppTheme.titleDark,
          fontSize: fontSize ?? AppTheme.medium,
          fontWeight: fontWeight ?? FontWeight.w400,
          height: 1.5,
          fontFamily: AppTheme.appFontName,
          decoration: TextDecoration.none,
        ),
        keyboardType: keyboardType,
        readOnly: readOnly,
        obscureText: obscureText,
        maxLines: maxLines,
        maxLength: maxLength ?? null,
        onChanged: onChanged,
        onTap: onTextFiledOnTap,
        onFieldSubmitted: onSubmit,
        controller: textEditingController,
        validator: onTextValidator,
        textInputAction: textInputAction,
        //textCapitalization: TextCapitalization.sentences,
      ),
    );
  }
}
