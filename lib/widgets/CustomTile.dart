import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:managerapp/util/resources.dart';

class CustomTile extends StatefulWidget {
  String tileName;
  String svgIcon;
  String title;
  String subTitle;
  String firstDate;
  String secondDate;
  TextStyle subtileStyle;
  TextStyle titleStyle;

  CustomTile({
    this.firstDate = 'mm/dd/yyyy',
    this.secondDate = 'mm/dd/yyyy',
    required this.subTitle,
    required this.svgIcon,
    this.tileName = 'Tile Name',
    required this.title,
    this.subtileStyle = const TextStyle(fontSize: 11),
    this.titleStyle =
        const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
  });

  @override
  State<CustomTile> createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile> {
  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: widget.titleStyle,
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.subTitle,
                style: widget.subtileStyle,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    widget.svgIcon,
                    width: 12,
                    height: 12,
                  ),
                  // Image(
                  //     image: AssetImage(
                  //   widget.svgIcon,
                  // )),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    widget.firstDate,
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset(
                    widget.svgIcon,
                    width: 12,
                    height: 12,
                  ),
                  // Image(
                  //     image: AssetImage(
                  //   widget.svgIcon,
                  // )),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    widget.secondDate,
                    style: TextStyle(fontSize: 10),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 1,
            color: Colors.black.withOpacity(0.09),
          )
        ],
      ),
    );
  }
}
