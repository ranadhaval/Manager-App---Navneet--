import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/extensions.dart';
import 'package:managerapp/util/resources.dart';

class DynamicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  String title2;

  String subTitle;
  Color colors;
  Color fontColors;
  Color fontColors2;

  double fontSize;
  FontWeight fontWeight;
  TextAlign textAlign;
  List<Widget> actions;
  double appBarHeight;
  bool isDrawer;
  bool showLeading;
  final Function() onBackTap;

  DynamicAppBar(
    this.title,
    this.subTitle,
    this.colors,
    this.isDrawer,
    this.onBackTap,
    this.actions, {
    required this.title2,
    this.appBarHeight = 60,
    this.fontSize = AppTheme.medium_1,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.fontColors = Colors.white,
    this.fontColors2 = Colors.blue,
    this.showLeading = true,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Expanded(
            //       child: Text(
            //         title,
            //         textAlign: textAlign,
            //         textScaleFactor: 1,
            //         softWrap: true,
            //         maxLines: 1,
            //         style: TextStyle(
            //             color: fontColors,
            //             fontSize: fontSize,
            //             fontWeight: fontWeight),
            //       ),
            //     ),
            //     Text(
            //       title2,
            //       textAlign: textAlign,
            //       textScaleFactor: 1,
            //       softWrap: true,
            //       maxLines: 1,
            //       style: TextStyle(
            //           color: fontColors2,
            //           fontSize: fontSize,
            //           fontWeight: fontWeight),
            //     ),
            //   ],
            // ),
            RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: AppTheme.titleDark,
                        height: 1,
                        fontSize: fontSize,
                        fontWeight: fontWeight),
                    children: [
                  TextSpan(text: title),
                  TextSpan(
                      text: title2,
                      style: TextStyle(color: AppTheme.colorPrimary))
                ])),
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: subTitle.isNullOrEmpty() ? false : true,
              child: Text(
                subTitle,
                textAlign: textAlign,
                textScaleFactor: 1,
                softWrap: true,
                maxLines: 1,
                style: TextStyle(
                  color: fontColors,
                  fontSize: AppTheme.small,
                  fontWeight: fontWeight,
                ),
              ),
            ),
          ]),
      titleSpacing: 5.00,
      leading: showLeading
          ? Builder(
              builder: (BuildContext context) {
                return Card(
                  margin: const EdgeInsets.all(9),
                  shape: const CircleBorder(),
                  elevation: 5,
                  shadowColor: AppTheme.colorGray,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: SvgPicture.asset(
                      isDrawer ? menuIconSvg : backArrowSvg,
                      height: isDrawer
                          ? Constant.MENU_ICON_SIZE
                          : Constant.ICON_SIZE,
                      width: isDrawer
                          ? Constant.MENU_ICON_SIZE
                          : Constant.ICON_SIZE,
                      color: fontColors,
                      fit: BoxFit.fill,
                    ),
                    onPressed:
                        onBackTap, //() => Scaffold.of(context).openDrawer(),
                  ),
                );
              },
            )
          : null,
      backgroundColor: colors,
      bottomOpacity: 0.0,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      actions: actions,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: colors,
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.dark, // For iOS (dark icons)
      ),
    );
  }
}
