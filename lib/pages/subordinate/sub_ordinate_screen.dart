import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:managerapp/pages/subordinate/model/response/SubordinateResponse.dart';
import 'package:managerapp/pages/subordinate/sub_ordinate_controller.dart';

import 'package:managerapp/routes/app_routes.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/util/utils.dart';
import 'package:managerapp/widgets/coustom_text.dart';

import 'package:managerapp/widgets/dynamic_appbar.dart';
import 'package:managerapp/widgets/input_textfield.dart';

import 'package:managerapp/widgets/simple_button.dart';
import 'package:shimmer/shimmer.dart';
import '../../util/hex_code.dart';

class SubOrdinateScreen extends StatefulWidget {
  const SubOrdinateScreen({super.key});

  @override
  State<SubOrdinateScreen> createState() => _SubOrdinateState();
}

class _SubOrdinateState extends State<SubOrdinateScreen> {
  final subOrdinateController = Get.put(SubOrdinateController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (con) {
        return Scaffold(
          backgroundColor: AppTheme.colorWhite,
          appBar: _appbar(),
          body: _body(),
        );
      },
      init: subOrdinateController,
    );
  }

  _body() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(Constant.SUBORDINATE_PADDING),
          child: Row(
            children: [
              Expanded(
                  child: InkWell(
                child: Container(
                  padding: const EdgeInsets.only(
                      left: Constant.SUBORDINATE_TEXT_FEILD_LEFT_PADDING),
                  height: Constant.SUBORDINATE_TEXT_FEILD_HEIGHT,
                  child: CoustomTextField(
                    fontSize: Constant.SUBORDINATE_TEXT_FEILD_TEXT_SIZE,
                    fontWeight: FontWeight.w400,
                    showCursor: Constant.isFalse,
                    textEditingController: subOrdinateController.fromDate,
                    contentPadding: const EdgeInsets.only(
                        left: Constant.SUBORDINATE_TEXT_FEILD_CONTENT_PADDING),
                    textAlign: TextAlign.center,
                    readOnly: Constant.isTrue,
                    onTextValidator: (c) {},
                    onTextFiledOnTap: () async {
                      DateTime? datePicked = await Utils.getdate(context);

                      subOrdinateController.fromDate.text =
                          DateFormat('dd/MM/yyyy').format(DateTime(
                              datePicked!.year,
                              datePicked.month,
                              datePicked.day));
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
                padding: const EdgeInsets.only(
                    left: Constant.SUBORDINATE_TEXT_FEILD_LEFT_PADDING),
                height: Constant.SUBORDINATE_TEXT_FEILD_HEIGHT,
                child: CoustomTextField(
                  borderEnableColors: AppTheme.titleDark,
                  showCursor: Constant.isFalse,
                  borderFocusColors: AppTheme.titleDark,
                  fontSize: Constant.SUBORDINATE_TEXT_FEILD_TEXT_SIZE,
                  contentPadding: const EdgeInsets.only(
                      left: Constant.SUBORDINATE_TEXT_FEILD_CONTENT_PADDING),
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  textEditingController: subOrdinateController.toDate,
                  onTextFiledOnTap: () async {
                    DateTime? datePicked = await Utils.getdate(context);
                    subOrdinateController.toDate.text = DateFormat('dd/MM/yyyy')
                        .format(DateTime(datePicked!.year, datePicked.month,
                            datePicked.day));
                  },
                  readOnly: Constant.isTrue,
                  suffixIcon:
                      Icon(Icons.calendar_month, color: AppTheme.titleDark),
                  onTextValidator: (c) {},
                ),
              )),
              const SizedBox(
                width: Constant.SIZEDBOX_10,
              ),
              SimpleButton(
                  bgColors: AppTheme.applyButtonColor,
                  onTap: () {
                    subOrdinateController.subordinateRequestApi();
                  },
                  child: CustomText(
                    title: Strings.apply,
                    colors: AppTheme.colorWhite,
                    fontFamily: Strings.fontFamilyComfortaa,
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: Constant.subOrdinateTextLeftPadding,
              top: Constant.subOrdinateTextTopPadding,
              bottom: Constant.subOrdinateTextBottomPadding),
          child: Row(
            children: [
              CustomText(
                title: Strings.subOrdinateSummary,
                fontWeight: FontWeight.bold,
                fontSize: Constant.SUBORDINATE_TEXT_SIZE,
                fontFamily: Strings.fontFamilyComfortaa,
                colors: AppTheme.colorBlack,
              )
            ],
          ),
        ),
        Expanded(
          child: subOrdinateController.isLoading
              ? subOrdinateLoader()
              : subOrdinateController.subOrdinateList.isEmpty
                  ? Center(
                      child: CustomText(
                        title: Strings.noDataFound,
                        colors: AppTheme.colorBlack,
                      ),
                    )
                  : ListView.builder(
                      itemCount: subOrdinateController.subOrdinateList.length,
                      itemBuilder: (context, index) {
                        SubordinateDetail item =
                            subOrdinateController.subOrdinateList[index];
                        return subordinateListTile(item, index);
                      }),
        ),
      ],
    );
  }

  subordinateListTile(SubordinateDetail item, int index) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Constant.subOrdinateTileLeftPadding,
          right: Constant.subOrdinateTileRightPadding,
          top: Constant.subOrdinateTileTopPadding,
          bottom: Constant.subOrdinateTileBottomPadding),
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.ORDER_SCREEN,
              arguments: [item.oid, item.out.toString()]);
        },
        child: Container(
          padding: const EdgeInsets.all(Constant.SUBORDINATE_TILE_ALL_PADDING),
          margin: const EdgeInsets.all(Constant.SUBORDINATE_TILE_ALL_MARGIN),
          decoration: BoxDecoration(
              boxShadow: [Constant.boxShadow(AppTheme.colorBlack)],
              color: AppTheme.colorWhite,
              borderRadius:
                  BorderRadius.circular(Constant.SUBORDINATE_TILE_RADIUS)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: Constant.SUBORDINATE_TILE_CIRCLE_RADIUS,
                    backgroundColor:
                        DarkColor[index % DarkColor.length].withOpacity(0.4),
                    child: CircleAvatar(
                      backgroundColor: AppTheme.colorWhite,
                      child: CustomText(
                        title: item.out != null
                            ? item.out.toString().characters.first
                            : Strings.emptyString,
                        fontWeight: FontWeight.bold,
                        colors: DarkColor[index % DarkColor.length],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: Constant.SIZEDBOX_10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      item.out != null
                          ? item.out.toString()
                          : Strings.emptyString,
                      style: const TextStyle(
                          fontFamily: Strings.fontFamilyComfortaa,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          CustomText(
                            title: item.amt != null
                                ? item.amt.toString()
                                : Strings.emptyString,
                            fontFamily: Strings.fontFamilyComfortaa,
                            fontWeight: FontWeight.bold,
                            fontSize: Constant.TEXT_SIZE_15,
                            colors: AppTheme.colorBlack,
                          ),
                          const SizedBox(
                            height: Constant.SIZEDBOX_5,
                          ),
                          CustomText(
                            title: Strings.amount,
                            fontFamily: Strings.fontFamilyComfortaa,
                            colors: AppTheme.titleDark,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  subOrdinateLoader() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(Constant.SUBORDINATE_SHIMMER_PADDING),
          child: Container(
            padding: const EdgeInsets.all(Constant.SUBORDINATE_SHIMMER_PADDING),
            margin: const EdgeInsets.all(Constant.SUBORDINATE_TILE_ALL_MARGIN),
            decoration: BoxDecoration(
                boxShadow: [Constant.boxShadow(AppTheme.colorGray)],
                color: Colors.white54,
                borderRadius: BorderRadius.circular(
                    Constant.SUBORDINATE_TILE_CIRCLE_RADIUS)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: AppTheme.colorGray.withOpacity(0.2),
                      highlightColor: AppTheme.colorWhite,
                      child: CircleAvatar(
                        radius: Constant.SUBORDINATE_TILE_CIRCLE_RADIUS,
                        child: CircleAvatar(
                          backgroundColor: AppTheme.colorWhite,
                          child: Container(
                            width: Constant.SUBORDINATE_SHIMMER_TILE_WIDTH,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: Constant.SIZEDBOX_10),
                    Shimmer.fromColors(
                        baseColor: AppTheme.colorGray.withOpacity(0.2),
                        highlightColor: AppTheme.colorWhite,
                        child: Container(
                          color: AppTheme.colorGray,
                          width: Constant.SUBORDINATE_SHIMMER_TILE_WIDTH,
                        ))
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Shimmer.fromColors(
                                baseColor: AppTheme.colorGray.withOpacity(0.2),
                                highlightColor: AppTheme.colorWhite,
                                child: Container(
                                  color: AppTheme.colorGray,
                                  height: Constant
                                      .SUBORDINATE_SHIMMER_TILE_AMOUNT_HEIGHT,
                                  width: Constant
                                      .SUBORDINATE_SHIMMER_TILE_AMOUNT_WIDTH,
                                )),
                            const SizedBox(
                              height: Constant.SIZEDBOX_10,
                            ),
                            Shimmer.fromColors(
                                baseColor: AppTheme.colorGray.withOpacity(0.2),
                                highlightColor: AppTheme.colorWhite,
                                child: Container(
                                  color: AppTheme.colorGray,
                                  height: Constant
                                      .SUBORDINATE_SHIMMER_TILE_AMOUNT_TITLE_HEIGHT,
                                  width: Constant
                                      .SUBORDINATE_SHIMMER_TILE_AMOUNT_TITLE_WIDTH,
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
      itemCount: 4,
    );
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
      'Subordinate',
      Strings.emptyString,
      AppTheme.colorWhite,
      false,
      () => Get.back(),
      const [],
      fontColors: AppTheme.titleDark,
      fontWeight: FontWeight.w400,
      title2: Strings.emptyString,
    );
  }
}
