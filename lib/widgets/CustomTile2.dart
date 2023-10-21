import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:managerapp/util/resources.dart';

class CustomTile2 extends StatefulWidget {
  String tileName;
  String svgIcon;
  String title;
  String subTitle;
  String firstDate;
  String secondDate;
  TextStyle subtileStyle;
  TextStyle titleStyle;
  double iconsize = 20;

  bool is_productlist;

  CustomTile2({
    required this.is_productlist,
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
  State<CustomTile2> createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile2> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                  margin: EdgeInsets.only(right: 5),
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(18)),
                  child: Center(
                    child: Image(
                      image: AssetImage(logoIcon),
                    ),
                  )),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.title,
                    style: widget.titleStyle,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        widget.subTitle,
                        style: widget.subtileStyle,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  widget.is_productlist
                      ? Text("")
                      : Row(
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
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              widget.firstDate,
                              style: const TextStyle(fontSize: 10),
                            ),
                            const SizedBox(
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
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              widget.secondDate,
                              style: const TextStyle(fontSize: 10),
                            )
                          ],
                        )
                ],
              ),
            ],
          ),
          const SizedBox(
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
