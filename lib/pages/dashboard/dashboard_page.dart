import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:managerapp/pages/Dashboard/dashboard_controller.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/widgets/CustomTile2.dart';
import 'package:managerapp/widgets/CustomTile.dart';
import 'package:managerapp/widgets/customTile3.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/hex_code.dart';
import 'package:managerapp/util/resources.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardPage> {
  GetStorage storage = GetStorage();

  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: ((dashboardController) {
        return Scaffold(body: _body());
      }),
    );
  }

  _body() {
    double mediaWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.colorWhite,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Constant.DASHBOARD_BOTTOM_CORNER),
              bottomRight: Radius.circular(Constant.DASHBOARD_BOTTOM_CORNER))),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.zero,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: mediaWidth,
                      color: Colors.transparent,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          disableCenter: true,
                        ),
                        items: Constant.randomList
                            .map((item) => Container(
                                  margin: const EdgeInsets.all(
                                      Constant.DASHBOARD_CAROUSEL_MARGIN),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: Constant.BOOTOM_COLOUR),
                                    borderRadius: BorderRadius.circular(
                                        Constant.CROUSEL_RADIUS),
                                  ),
                                  width: mediaWidth /
                                      Constant.dashboardCrouselCardWidth,
                                ))
                            .toList(),
                      ),
                    ),
                    orderPlate(content(), Strings.recent, Strings.primaryOrder),
                    orderPlate(
                      content2(Constant.isFalse),
                      Strings.recent,
                      Strings.secondaryOrder,
                    ),
                    orderPlate(
                      content2(Constant.isTrue),
                      Strings.emptyString,
                      Strings.topProduct,
                    ),
                    orderPlate(content3(), Strings.top, Strings.retailer),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget orderPlate(
    Widget widget2,
    String titleText1,
    String titleText2,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            boxShadow: [Constant.boxShadow(Colors.black)],
            color: AppTheme.colorWhite,
            borderRadius: BorderRadius.circular(14)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                      text: titleText1,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      children: [
                        TextSpan(
                            text: titleText2,
                            style: TextStyle(color: HexColor("#008ECE"))),
                      ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 8, left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: HexColor("#D4D4D4").withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          Strings.viewAll,
                          style: TextStyle(
                              color: HexColor('#565656'),
                              fontSize: 11,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            widget2,
            widget2,
            widget2,
            widget2,
            widget2,
          ],
        ),
      ),
    );
  }

  Widget content() {
    return CustomTile(
        firstDate: '10/04/2023',
        secondDate: '10/04/2023',
        subTitle: '12345678910',
        svgIcon: group,
        title: 'Navneet Test demo');
  }

  Widget content3() {
    return CustomTile3(
        firstDate: '10/04/2023',
        secondDate: '10/04/2023',
        subTitle: 'Bhavesh IT Demo',
        svgIcon: group,
        subtileStyle: TextStyle(fontSize: 14),
        title: 'Navneet Test demo');
  }

  Widget content2(bool is_productlist) {
    return CustomTile2(
        is_productlist: is_productlist,
        firstDate: '10/04/2023',
        secondDate: '10/04/2023',
        subTitle: '123456789',
        svgIcon: group,
        title: 'Navneet Test demo');
  }
}
