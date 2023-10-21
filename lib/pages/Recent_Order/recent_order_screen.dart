import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:managerapp/pages/OrderDetail/order_detail_controller.dart';
import 'package:managerapp/pages/Recent_Order/recent_order_controller.dart';
import 'package:managerapp/routes/app_routes.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/hex_code.dart';
import 'package:managerapp/util/utils.dart';
import 'package:managerapp/widgets/dynamic_appbar.dart';
import 'package:managerapp/widgets/input_textfield.dart';
import 'package:managerapp/widgets/simple_button.dart';
import 'package:shimmer/shimmer.dart';

class RecentOrderDetailScreen extends StatefulWidget {
  const RecentOrderDetailScreen({super.key});

  @override
  State<RecentOrderDetailScreen> createState() =>
      _RecentOrderDetailScreenState();
}

class _RecentOrderDetailScreenState extends State<RecentOrderDetailScreen> {
  final recentOrdercontroller = Get.put(RecentOrderController());

  @override
  Widget build(BuildContext context) {
    final mediaHight = MediaQuery.of(context).size.height;
    final mediawidth = MediaQuery.of(context).size.width;

    return GetBuilder(
      builder: (con) {
        return Scaffold(
          backgroundColor: AppTheme.colorWhite,
          appBar: _appbar(),
          body: Stack(children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.only(left: 5),
                          margin: EdgeInsets.all(2),
                          child: CoustomTextField(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            textEditingController:
                                recentOrdercontroller.firstDate,
                            contentPadding: EdgeInsets.only(left: 5),
                            textAlign: TextAlign.center,
                            readOnly: true,
                            showCursor: Constant.isFalse,
                            onTextValidator: (c) {},
                            onTextFiledOnTap: () async {
                              DateTime? datePicked =
                                  await Utils.getdate(context);
                              recentOrdercontroller.firstDate.text =
                                  DateFormat('MM/dd/yyyy').format(datePicked!);
                              print(datePicked);
                              recentOrdercontroller.update();
                            },
                            borderEnableColors: AppTheme.titleDark,
                            borderFocusColors: AppTheme.titleDark,
                            suffixIcon: Icon(
                              Icons.calendar_month,
                              color: AppTheme.titleDark,
                            ),
                          ),
                        ),
                      )),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(left: 5),
                        height: 40,
                        margin: const EdgeInsets.all(2),
                        child: CoustomTextField(
                          // borderEnableColors: Colors.black,
                          borderEnableColors: AppTheme.titleDark,
                          showCursor: Constant.isFalse,

                          borderFocusColors: AppTheme.titleDark,
                          fontSize: 12,
                          contentPadding: EdgeInsets.only(left: 5),
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w400,
                          textEditingController:
                              recentOrdercontroller.secondDate,
                          onTextFiledOnTap: () async {
                            DateTime? datePicked = Utils.getdate(context);
                            recentOrdercontroller.secondDate.text =
                                DateFormat('MM/dd/yyyy').format(DateTime(
                                    datePicked!.year,
                                    datePicked.month,
                                    datePicked.day));
                            recentOrdercontroller.update();
                          },
                          readOnly: true,
                          // borderFocusColors: Colors.black,
                          suffixIcon: Icon(Icons.calendar_month,
                              color: AppTheme.titleDark),
                          onTextValidator: (c) {},
                        ),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      SimpleButton(
                          child: Text(
                            "Apply",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Comfortaa',
                            ),
                          ),
                          bgColors: HexColor('#5867de'),
                          onTap: () {
                            recentOrdercontroller.subordinateRequestApi();
                          })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17, top: 10, bottom: 5),
                  child: Row(
                    children: [
                      Text(
                        "Recent Order Summary",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            fontFamily: 'Comfortaa'),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: recentOrdercontroller.isLoded
                      ? shimmer2()
                      : recentOrdercontroller.responseList2!.isEmpty
                          ? const Center(
                              child: Text("No data found"),
                            )
                          : ListView.builder(
                              itemCount:
                                  recentOrdercontroller.responseList2!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.ORDER_SCREEN,
                                          arguments: [
                                            recentOrdercontroller
                                                .responseList2![index].oid,
                                            recentOrdercontroller.outid
                                                .toString()
                                          ]);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(9),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 12,
                                                spreadRadius: 0,
                                                offset: Offset(0, 4),
                                                color: Colors.black
                                                    .withOpacity(0.08))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                            child: Center(
                                                child: Column(
                                              children: [
                                                Text(
                                                  recentOrdercontroller
                                                      .responseList2![index].dto
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color:
                                                          HexColor('#6aabe5')),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text("Order Date",
                                                    style: TextStyle(
                                                        color:
                                                            AppTheme.titleDark))
                                              ],
                                            )),
                                          )),
                                          VerticalLine(),
                                          Expanded(
                                              child: Container(
                                            child: Center(
                                                child: Column(
                                              children: [
                                                Text(
                                                  recentOrdercontroller
                                                      .responseList2![index].qty
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.amber),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text("Qty",
                                                    style: TextStyle(
                                                        color:
                                                            AppTheme.titleDark))
                                              ],
                                            )),
                                          )),
                                          VerticalLine(),
                                          Expanded(
                                              child: Container(
                                            child: Center(
                                                child: Column(
                                              children: [
                                                Text(
                                                  recentOrdercontroller
                                                      .responseList2![index].amt
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color:
                                                          HexColor('#40f49f')),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text("Amount",
                                                    style: TextStyle(
                                                        color:
                                                            AppTheme.titleDark))
                                              ],
                                            )),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                ),
              ],
            ),
          ]),
        );
      },
      init: recentOrdercontroller,
    );
  }

  Widget VerticalLine() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
        width: 1,
        height: 50,
        color: Colors.black.withOpacity(0.2),
      ),
    );
  }

  Widget shimmer(double width) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.2),
          highlightColor: Colors.white,
          child: Container(
            color: Colors.grey,
            width: width,
            height: 10,
          )),
    );
  }

  Widget shimmer2() {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding: EdgeInsets.all(9),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 12,
                        spreadRadius: 0,
                        offset: Offset(0, 4),
                        color: Colors.black.withOpacity(0.08))
                  ],
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Center(
                        child: Column(
                      children: [
                        shimmer(50),
                        SizedBox(
                          height: 5,
                        ),
                        shimmer(80)
                      ],
                    )),
                  )),
                  VerticalLine(),
                  Expanded(
                      child: Container(
                    child: Center(
                        child: Column(
                      children: [
                        shimmer(50),
                        SizedBox(
                          height: 5,
                        ),
                        shimmer(80)
                      ],
                    )),
                  )),
                  VerticalLine(),
                  Expanded(
                      child: Container(
                    child: Center(
                        child: Column(
                      children: [
                        shimmer(50),
                        SizedBox(
                          height: 5,
                        ),
                        shimmer(80)
                      ],
                    )),
                  )),
                ],
              ),
            ),
          );
        });
  }

  List DarkColor = [
    HexColor("#3264bd"),
    HexColor("#bc8a55"),
    HexColor("#8578c9"),
    HexColor("#c94d71"),
    HexColor("#158767"),
  ];
  List OpColor = [
    HexColor("#eef2fe"),
    HexColor("#fff6ef"),
    HexColor("#ffedf3"),
    HexColor("#f5f2ff"),
    HexColor("#e5f8f6"),
  ];

  _appbar() {
    return DynamicAppBar(
      'Recent Order Detail Screen',
      '',
      AppTheme.colorWhite,
      false,
      () => Get.back(),
      [],
      fontColors: AppTheme.titleDark,
      fontWeight: FontWeight.w400,
      title2: '',
    );
  }
}
