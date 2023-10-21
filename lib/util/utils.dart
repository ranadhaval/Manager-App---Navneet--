import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/extensions.dart';
import 'package:managerapp/util/strings.dart';
import 'package:url_launcher/url_launcher.dart';

mixin Utils {
  static var minYear = 1960;
  static var minMonth = 1;
  static var minDay = 1;

  static bool isLightMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  static String getStringTranslations(String key) {
    try {
      if (key != '') {
        return key.tr;
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }


  static getdate(context) async {
    DateTime? date_picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2025, DateTime.august, 8));

    return date_picked;
  }
  static showSnackbar(title, message, colorText, colorBg,
      {duration = 2, margin = Constant.SMALL_PADDING}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: colorBg,
        colorText: colorText,
        duration: Duration(seconds: duration),
        margin: EdgeInsets.all(margin));
  }

  static List<String> getSplitTime(String time) {
    return time.split(":");
  }

  static String durationToMinutesHours(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }

  static String changeDateFormat(String date, String dtFormat) {
    DateFormat dateFormat = DateFormat(dtFormat);
    DateTime dateTimeLocal = DateTime.parse(date).toUtc().toLocal();
    return dateFormat.format(dateTimeLocal);
  }

  static InputDecoration ddlDecoration({String? title, Color? fillColor}) {
    return InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(
            Constant.SMALL_PADDING, 0, Constant.MEDIUM_PADDING, 0),
        fillColor: fillColor ?? AppTheme.colorWhite,
        hintStyle: AppTheme.dropdownHintStyle,
        labelStyle: AppTheme.dropdownLabelStyle,
        errorStyle: AppTheme.dropdownErrorStyle,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(Constant.DROP_DOWN_ROUNDED_CORNER),
          borderSide: BorderSide(color: AppTheme.colorIconGrey, width: 0.8),
        ),
        focusColor: Colors.transparent,
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(Constant.DROP_DOWN_ROUNDED_CORNER),
          borderSide: BorderSide(color: AppTheme.colorIconGrey, width: 0.8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(Constant.DROP_DOWN_ROUNDED_CORNER),
          borderSide: BorderSide(
            color: AppTheme.colorIconGrey,
            width: 1.0,
          ),
        ),
        errorMaxLines: 3);
  }

  static List<String> month = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  static String removeLastComa(String data) {
    if (data.isNotEmpty && data.contains(",")) {
      String newData = "";
      String lastChar = data.substring(data.length - 1);
      if (lastChar.equalsIgnoreCase(",")) {
        newData = data.substring(0, data.length - 1);
      } else {
        newData = data;
      }
      return newData;
    }
    return data;
  }

  static Future<void> openMap(String latitude, String longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    Uri uri = Uri.parse(googleUrl);
    try {
      await launchUrl(uri);
    } catch (e) {
      Utils.showSnackbar(
          Strings.error, e.toString(), AppTheme.colorWhite, AppTheme.colorRed);
    }
  }

  static Future<void> makePhoneCall(String phoneNo) async {
    Uri uri = Uri.parse("tel://$phoneNo");
    try {
      await launchUrl(uri);
    } catch (e) {
      Utils.showSnackbar(
          Strings.error, e.toString(), AppTheme.colorWhite, AppTheme.colorRed);
    }
  }
}
