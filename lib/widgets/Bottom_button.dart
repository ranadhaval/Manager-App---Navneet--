import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/hex_code.dart';

class BottomButton extends StatefulWidget {
  // const BottomButton({super.key});

  double topPadding;
  double bottomPadding;
  double leftPadding;
  double rightPadding;
  Widget child;
  // void Function()? onTap;
  BottomButton({
    this.bottomPadding = 20,
    required this.child,
    this.leftPadding = 20,
    this.rightPadding = 20,
    this.topPadding = 20,
  });

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              padding: EdgeInsets.only(
                  top: widget.topPadding,
                  left: widget.leftPadding,
                  right: widget.rightPadding,
                  bottom: widget.bottomPadding - 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.transparent, width: 0),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  boxShadow: [Constant.boxShadowButton(Colors.black)]),
              child: Container(
                padding: const EdgeInsets.all(18),
                child: widget.child,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      HexColor('#3aafbf'),
                      HexColor('#2d94c0'),
                      HexColor("#227fc0"),
                    ])),
              )),
        ],
      ),
    );
  }
}

class BottomCardButton extends StatelessWidget {
  BottomCardButton(
      {super.key,
      required this.height,
      required this.title,
      required this.onTap});

  final double height;

  final String title;

  Function() onTap;

  @override
  Widget build(BuildContext context) {
    const btnradius = 40.0;
    return SizedBox(
        height: 80,
        child: Material(
          type: MaterialType.transparency,
          elevation: 10,
          child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: AppTheme.colorCardBg,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.colorGrey,
                      blurRadius: 12,
                    )
                  ],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.elliptical(30, 30))),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(btnradius),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              AppTheme.bgGradiontend,
                              AppTheme.bgGradiontStart
                            ])),
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: AppTheme.colorWhite,
                          fontSize: AppTheme.medium_1,
                        ),
                      ),
                    ),
                  ),
                ),
              )),
        ));
  }
}
