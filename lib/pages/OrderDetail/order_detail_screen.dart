import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerapp/pages/OrderDetail/order_detail_controller.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/hex_code.dart';
import 'package:managerapp/widgets/dynamic_appbar.dart';
import 'package:shimmer/shimmer.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  final orderDetailcontroller = Get.put(OrderDetailController());
  @override
  late double mediawidth;
  late double mediaheight;
  _appbar() {
    return DynamicAppBar(
      'Order Detail',
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

  Widget build(BuildContext context) {
    return GetBuilder(
        init: orderDetailcontroller,
        builder: (control) {
          final item = orderDetailcontroller.orderDetailsData;
          mediawidth = MediaQuery.of(context).size.width;
          mediaheight = MediaQuery.of(context).size.height;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: _appbar(),
            body: Container(
              height: mediaheight,
              width: mediawidth,
              child: orderDetailcontroller.isEmptyList
                  ? Column(
                      children: [shimmer_effect(), shimmer2()],
                    )
                  : 
                  Column(
                      children: [
                        Padding(
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                            text: item!.outid,
                                            style: TextStyle(
                                                color: HexColor('#5867dd'),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                            children: [])),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            orderDetailcontroller.subTitle,
                                            style: TextStyle(
                                                color: AppTheme.titleDark,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Container(
                                    height: 1,
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                ),
                                text('Order Date :', item.dto.toString()),
                                text('Delivery Date :', item.dtdel.toString()),
                                text('Message :', item.msg.toString()),
                                // text(
                                //     'Total Amount :',
                                //     orderDetailcontroller.orderDetailList[0].tamt
                                //         .toString()),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Container(
                                    height: 1,
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Text(
                                              orderDetailcontroller
                                                  .totalQuantity
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: HexColor('#40f49f')),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text("Total Quantity",
                                                style: TextStyle(
                                                    color: AppTheme.titleDark))
                                          ],
                                        ),
                                      ),
                                    )),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: Container(
                                        height: 55,
                                        width: 1,
                                        color: Colors.black.withOpacity(0.2),
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Text(
                                              orderDetailcontroller.totalPrice
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: HexColor('#6aabe5')),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Total Price",
                                              style: TextStyle(
                                                  color: AppTheme.titleDark),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 17, top: 10, bottom: 5),
                          child: Row(
                            children: [
                              Text(
                                "Order Detail Summary",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    fontFamily: 'Comfortaa'),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount:
                                  orderDetailcontroller.orderDetailList.length,
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
                                              color: Colors.black
                                                  .withOpacity(0.08))
                                        ],
                                        borderRadius: BorderRadius.circular(7)),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          child: Center(
                                              child: Column(
                                            children: [
                                              Text(
                                                orderDetailcontroller
                                                    .orderDetailList[index].pid
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: HexColor('#6aabe5')),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text("Product id",
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
                                                orderDetailcontroller
                                                    .orderDetailList[index].qty
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
                                                orderDetailcontroller
                                                    .orderDetailList[index].amt
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: HexColor('#40f49f')),
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
                                );
                              }),
                        )
                      ],
                    ),
          
          
          
            ),
          );
        });
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

  Widget text(String title, String data) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: RichText(
          text: TextSpan(
              text: title + ' ',
              style: TextStyle(
                  color: AppTheme.titleDark, fontWeight: FontWeight.w500),
              children: [
            TextSpan(
                text: data,
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500))
          ])),
    );
  }

  Widget shimmer_effect() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
            color: Colors.white54,
            boxShadow: [
              BoxShadow(
                  blurRadius: 12,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                  color: Colors.black.withOpacity(0.08))
            ],
            borderRadius: BorderRadius.circular(7)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.2),
                    highlightColor: Colors.white,
                    child: Container(
                      color: Colors.grey,
                      width: 140,
                      height: 10,
                    )),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.2),
                          highlightColor: Colors.white,
                          child: Container(
                            color: Colors.grey,
                            width: 70,
                            height: 10,
                          )),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Container(
                height: 1,
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            shimmer(60),
            shimmer(70),
            shimmer(80),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Container(
                height: 1,
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        shimmer(70),
                        SizedBox(
                          height: 5,
                        ),
                        shimmer(90),
                      ],
                    ),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Container(
                    height: 55,
                    width: 1,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
                Expanded(
                    child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        shimmer(70),
                        SizedBox(
                          height: 5,
                        ),
                        shimmer(90),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ],
        ),
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
    return Expanded(
      child: ListView.builder(
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
          }),
    );
  }
}
