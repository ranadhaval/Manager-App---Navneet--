import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerapp/pages/MccRetailer_Screen/mccretailer_controller.dart';
import 'package:managerapp/pages/delete_dialoge/delete_controller.dart';
import 'package:managerapp/pages/outletsAction/outlet_action_response.dart';
import 'package:managerapp/routes/app_routes.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/hex_code.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/widgets/Bottom_button.dart';
import 'package:managerapp/widgets/coustom_text.dart';
import 'package:managerapp/widgets/delete_dialoge.dart';
import 'package:managerapp/widgets/dynamic_appbar.dart';
import 'package:shimmer/shimmer.dart';
import '../../theme/app_theme.dart';

class MccRetailer_screen extends StatefulWidget {
  const MccRetailer_screen({super.key});

  @override
  State<MccRetailer_screen> createState() => _MccRetailer_screenState();
}

class _MccRetailer_screenState extends State<MccRetailer_screen>
    with WidgetsBindingObserver
    implements DeletAction {
  final controller = Get.put(MccRetailerController());

  @override
  void deleteAction({String? id, File? file}) {
    controller.listdate.clear();
    controller.listimage.clear();
    controller.dataList.clear();
    controller.getMccData();
    controller.update();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder(
        init: controller,
        builder: (con) {
          return Scaffold(
              appBar: _appbar(),
              body: SizedBox(
                height: height,
                width: width,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 17, top: 10, bottom: 5),
                      child: Row(
                        children: [
                          CustomText(
                              title: Strings.mccRetaileSummarry,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              fontFamily: Strings.fontFamilyComfortaa),
                        ],
                      ),
                    ),
                    controller.is_Loded
                        ? shimmer2()
                        : controller.dataList.isEmpty
                            ? const Expanded(
                                child: Center(
                                  child: Text(Strings.noDataFound),
                                ),
                              )
                            : Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, int index) {
                                    final item = controller.listdate[index];
                                    return Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Container(
                                            padding: const EdgeInsets.all(9),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 12,
                                                      spreadRadius: 0,
                                                      offset:
                                                          const Offset(0, 4),
                                                      color: Colors.black
                                                          .withOpacity(0.08))
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        RichText(
                                                            text: TextSpan(
                                                                text: 'Mcc Id',
                                                                style: TextStyle(
                                                                    color: AppTheme
                                                                        .titleDark,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                                children: const [])),
                                                        RichText(
                                                            text: TextSpan(
                                                                text:
                                                                    item.mccid,
                                                                style: TextStyle(
                                                                    color: AppTheme
                                                                        .titleDark
                                                                        .withOpacity(
                                                                            0.4),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                children: const [])),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        RichText(
                                                            text: TextSpan(
                                                                text:
                                                                    'Mcc Date',
                                                                style: TextStyle(
                                                                    color: AppTheme
                                                                        .titleDark,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                                children: const [])),
                                                        RichText(
                                                            text: TextSpan(
                                                                text: item
                                                                    .mccdate,
                                                                style: TextStyle(
                                                                    color: AppTheme
                                                                        .titleDark
                                                                        .withOpacity(
                                                                            0.4),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                children: const [])),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5, bottom: 5),
                                                  child: Container(
                                                    height: 1,
                                                    color: Colors.black
                                                        .withOpacity(0.2),
                                                  ),
                                                ),
                                                text(
                                                    'No of Person :',
                                                    item.noofperson
                                                        .toString()
                                                        .toString()),
                                                text(
                                                    'No of Purchase :',
                                                    item.noofpurchase
                                                        .toString()
                                                        .toString()),
                                                text(
                                                    'No Of Qty Purchase:',
                                                    item.qtypurchase
                                                        .toString()
                                                        .toString()),
                                                text(
                                                    'Product Of Fmcc: ',
                                                    item.productofmcc
                                                        .toString()
                                                        .toString()),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 6,
                                                      child: text(
                                                          'Remark:',
                                                          item.remark
                                                              .toString()
                                                              .toString()),
                                                    ),
                                                    item.lstimage!.isEmpty
                                                        ? Container()
                                                        : Expanded(
                                                            flex: 4,
                                                            child: Container(
                                                              clipBehavior:
                                                                  Clip.hardEdge,
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      20),
                                                              height: 50,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(12),
                                                                  boxShadow: [
                                                                    Constant.boxShadow(
                                                                        Colors
                                                                            .black)
                                                                  ]),
                                                              child:
                                                              
                                                               ListView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                children: [
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  for (int i =
                                                                          0;
                                                                      i <
                                                                          item.lstimage!
                                                                              .length;
                                                                      i++)
                                                                    InkWell(
                                                                        onTap:
                                                                            () {
                                                                          dialogebox(
                                                                              item.lstimage,
                                                                              i);
                                                                        },
                                                                        child:
                                                                            Align(
                                                                          widthFactor:
                                                                              0.5,
                                                                          child:
                                                                              CircleAvatar(
                                                                            backgroundColor:
                                                                                Colors.white,
                                                                            radius:
                                                                                18,
                                                                            child:
                                                                                CircleAvatar(
                                                                              radius: 15,
                                                                              backgroundImage: NetworkImage(item.lstimage![i].filePathName.toString()),
                                                                            ),
                                                                          ),
                                                                        )),
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  itemCount: controller.listdate.length,
                                ),
                              ),
                    const SizedBox(
                      height: 70,
                    )
                  ],
                ),
              ),
              bottomSheet: InkWell(
                onTap: () {
                  // var result =

                  Get.toNamed(
                    AppRoutes.ADD_MCC_RETAILER_SCREEN,
                  );
                  // arguments: {'outid': controller.outid});

                  // if (result != null) {
                  //   // controller.listdate.clear();
                  //   // controller.listimage.clear();
                  //   // controller.dataList.clear();
                  //   // controller.getMccData();
                  //   // controller.update();
                  //   // print("ve are ");
                  // } else {}
                },
                child: BottomButton(
                    leftPadding: 20,
                    rightPadding: 20,
                    topPadding: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Add Mcc",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    )),
              ));
        });
  }

  Future dialogebox(List<Lstimage>? lstimage, index) async {
    await showDialog(
      context: context,
      builder: (context) {
        return DeleteDialog(
          isDetailImage: false,
          detailImageList: const [],
          simpleImageList: lstimage!,
          deleteController: deleteController,
          deletAction: this,
          index: index,
        );
      },
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
                style: const TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500))
          ])),
    );
  }

  final deleteController = Get.put(DeleteController());

  shimmer2() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [Constant.boxShadow(Colors.black)]),
        child: Column(
          children: [
            shimmerCardContent(),
            shimmerCardContent(),
            shimmerCardContent(),
            shimmerCardContent(),
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

  Widget shimmerCardContent() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmer(80),
              const SizedBox(
                height: 3,
              ),
              shimmer(50)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              shimmer(80),
              const SizedBox(
                height: 3,
              ),
              shimmer(50)
            ],
          )
        ],
      ),
    );
  }

  Widget CardContent(
      {required String fisrtTitle,
      firstSubTitle,
      secondTitle,
      secondSubTitle,
      required double titlesize,
      subtitlesize}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fisrtTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: titlesize,
                  color: AppTheme.titleDark,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                firstSubTitle,
                style: TextStyle(
                    color: HexColor('#a7a8aa'),
                    fontSize: subtitlesize,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                secondTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: titlesize,
                  color: AppTheme.titleDark,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                secondSubTitle,
                style: TextStyle(
                    color: HexColor('#a7a8aa'),
                    fontSize: subtitlesize,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }

  _appbar() {
    return DynamicAppBar(
      'Mcc Retailer Screen',
      '',
      AppTheme.colorWhite,
      false,
      () => Get.back(),
      const [],
      fontColors: AppTheme.titleDark,
      fontWeight: FontWeight.w400,
      title2: '',
    );
  }

  @override
  void addAction() {
    // controller.listdate.clear();
    // controller.listimage.clear();
    // controller.dataList.clear();
    // controller.getMccData();
    // controller.update();

    print("hii lo");
  }
}
