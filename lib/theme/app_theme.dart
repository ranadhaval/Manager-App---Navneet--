import 'package:flutter/material.dart';
import 'package:managerapp/util/hex_code.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light = lightTheme;
  static ThemeData dark = darkTheme;

  static const String appFontName = 'Roboto';

  // Font Size
  static const double verySmall = 10;
  static const double small = 12;
  static const double medium = 14;
  static const double medium_1 = 16;
  static const double large = 18;
  static const double large_1 = 20;
  static const double extraLarge = 22;
  static const double doubleExtraLarge = 24;
  static const double authTitle = 25.5;
  static const double errorSize = 14;
  static const double largeTitleSize = 32;
  static const double mediumTitleSize = 30;

// Colors
  static Color colorPrimary = HexColor('#008ECE'); //184392, FFB71A,5867DD
  static Color colorAccent = HexColor("#5867DD");
  static Color colorStatusBar = HexColor("#6C92F4");
  static Color colorTransparent = Colors.transparent;
  static Color lightPrimary = HexColor('#F8BD0A');
  static Color themeColor = HexColor('#3cb4bf');
  static Color appbarTtileColor = HexColor("#227fc0");
  static Color speedDialColor = HexColor('#3782a0');
  static Color applyButtonColor = HexColor('#5867de');
  static Color uplaodTileColor = HexColor('F0F3F4');
  static Color uplaodTileBorderColor = HexColor("#04bfda");




  static Color distanceColor = HexColor('#f5f5f5');

  static const Color colorPrimaryTheme = Color(0xFF5867DD);
  static const Color colorAccentTheme = Color(0xFF5867DD);

  static const Color colorWhite = Colors.white;
  static Color colorBlack = HexColor("#000000");
  static Color colorLightBlack = colorBlack.withOpacity(0.6);
  static Color colorIconGrey = HexColor("#999999");
  static Color colorGrey = HexColor("#8d8d8d");
  static Color colorLightGrey = HexColor("#E4E4E4");
  static Color colorDisableGray = HexColor("#ABABAB");
  static Color colorGrayTxtBg = HexColor('#E9E9E9');

  static Color colorRed = HexColor("#F4516C");
  static Color colorError = HexColor("#D32F2E");
  static Color colorGreen = HexColor("#2ED47A");
  static Color colorBlue = HexColor("#1F77C1");

  static Color colorBlackStart = HexColor("#000000");
  static Color colorBlackEnd = HexColor("#212121");

  static Color colorProgress = HexColor('#008ECE');
  static Color colorProgressBg = HexColor("#F5F6FF");

  static Color colorPositive = HexColor("#87BCBF");
  static Color colorNagative = HexColor("#D97D54");

  static Color dividerColor = HexColor("#707070");

  static Color titleDark = HexColor('#334856');
  static Color titleNormal = HexColor('#899095');

  static Color colorBG = HexColor('#F0F3F4');
  static Color colorCardBtn = HexColor("#ECF0F1");
  static Color colorCardWhiteBtn = HexColor("#FBE7E2");
  static Color colorCardBg = HexColor("#F7F9F9");

  static Color appbar = HexColor("#5C70E2");
  static Color colorDrawerSelectedBg = HexColor("#F1F1F1");

  static Color colorGray = HexColor("#B0B8BF");
  static Color colorDarkGray = HexColor("#777984");
  static Color colorListItemGray = HexColor("#D6D6D8");

  static Color bgGradiontStart = HexColor('#2887C5');
  static Color bgGradiontend = HexColor('#52B7D5');

  static Color bgActionTitle = HexColor('#F3F8FE');
  static Color textfieldbordercolor = HexColor('#6C6C6C');

  static Color loginCheckBox = HexColor("#006DCA");
  static Color loginInputBorderColor = HexColor("#216B99");

  // text style
  static TextStyle textStyle(
      {fontWeight = FontWeight.normal,
      fontSize = medium,
      color = Colors.black}) {
    return TextStyle(
        fontFamily: appFontName,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        height: 1);
  }

  // dropdown text style
  static TextStyle dropdownTextStyle = TextStyle(
    color: AppTheme.colorBlack,
    fontSize: AppTheme.large,
    fontWeight: FontWeight.w400,
    height: 1,
    fontFamily: AppTheme.appFontName,
    decoration: TextDecoration.none,
  );

  // dropdown error style
  static TextStyle dropdownErrorStyle = TextStyle(
    color: AppTheme.colorError,
    fontWeight: FontWeight.normal,
    fontSize: AppTheme.errorSize,
  );

  // dropdown label style
  static TextStyle dropdownLabelStyle = TextStyle(
    color: AppTheme.colorBlack,
    fontSize: AppTheme.large,
    fontWeight: FontWeight.normal,
    height: 1,
    fontFamily: AppTheme.appFontName,
    decoration: TextDecoration.none,
  );

  // dropdown hint style
  static TextStyle dropdownHintStyle = TextStyle(
    fontSize: AppTheme.large,
    fontWeight: FontWeight.normal,
    height: 1,
    color: AppTheme.colorIconGrey,
    fontFamily: AppTheme.appFontName,
    decoration: TextDecoration.none,
  );

  static TextTheme textTheme = const TextTheme(
      bodyMedium: TextStyle(
          fontFamily: appFontName,
          fontWeight: FontWeight.normal,
          fontSize: medium,
          color: Colors.black,
          height: 1));

  // Font Size

  static const double bottomPadding = 15;
  static const double spacebetweendialitem = 10;
  static const double dialiconsize = 35;
  static const double dialsize = 50;
  static const double TWENTY_radius = 20;

  static Color dialIconColor = HexColor('#3cb4bf');
}
