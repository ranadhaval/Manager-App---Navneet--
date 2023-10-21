import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/resources.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar(
      {super.key,
      this.profileIcon = user,
      required this.subTitle,
      this.subtitleStyle = Constant.appbarSubtextstyle,
      required this.title,
      this.titleStyle = Constant.appbarTitletextstyle});

  String profileIcon;
  String title;
  String subTitle;
  TextStyle titleStyle;
  TextStyle subtitleStyle;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 15, bottom: 8, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 23,
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: SvgPicture.asset(
                      widget.profileIcon,
                      color: Colors.grey,
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title, style: widget.titleStyle),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.subTitle,
                    style: widget.subtitleStyle,
                  )
                ],
              ),
            ],
          ),
          Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 23,
                child: Card(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    elevation: 5,
                    child: Stack(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.5),
                            child: CircleAvatar(
                              radius: 2,
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: SvgPicture.asset(
                          bell,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ])),
              )
            ],
          ),
        ],
      ),
    );
  }
}
