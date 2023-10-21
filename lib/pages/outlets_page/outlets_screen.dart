import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:managerapp/pages/Route/route.dart';
import 'package:managerapp/pages/Route/route_loader.dart';
import 'package:managerapp/pages/outlets_page/Model/Response/outlets_response.dart';
import 'package:managerapp/pages/outlets_page/outlets_controller.dart';
import 'package:managerapp/routes/app_routes.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/resources.dart';
import 'package:managerapp/widgets/coustom_text.dart';
import 'package:managerapp/widgets/dynamic_appbar.dart';
import 'package:managerapp/widgets/input_textfield.dart';
import 'package:managerapp/widgets/no_data_found.dart';

class OutletsScreen extends StatefulWidget {
  const OutletsScreen({super.key});

  @override
  State<OutletsScreen> createState() => _OutletsScreenState();
}

class _OutletsScreenState extends State<OutletsScreen> {
  final controller = Get.put(OutletsController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: GetBuilder(
          init: controller,
          builder: (_) {
            return Scaffold(
                backgroundColor: AppTheme.colorWhite,
                appBar: _appbar(),
                body: controller.orgnlOutletList.isEmpty
                    ? const RouteLoader()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Constant.MEDIUM_PADDING,
                                vertical: Constant.MEDIUM_PADDING),
                            child: CoustomTextField(
                              contentPadding:
                                  const EdgeInsets.all(Constant.SMALL_PADDING),
                              prefixIcon: Icon(
                                Icons.search,
                                size: Constant.ICON_SIZE_M,
                                color: AppTheme.titleDark,
                              ),
                              fontWeight: FontWeight.w400,
                              fontSize: AppTheme.small,
                              labelText: 'Search Here...',
                              hintColor: AppTheme.colorGray,
                              borderEnableColors: AppTheme.titleDark,
                              borderFocusColors: AppTheme.titleDark,
                              textEditingController:
                                  controller.SearchTextController,
                              onTextValidator: (_) {},
                              onChanged: (value) =>
                                  controller.updateList(value),
                            ),
                          ),
                          controller.outletList.isEmpty
                              ? const NoDataFound()
                              : Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      left: Constant.MEDIUM_PADDING,
                                    ),
                                    child: ListView.builder(
                                        itemCount: controller.outletList.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, int index) {
                                          Listretailer item =
                                              controller.outletList[index];
                                          return listTileItem(item, index);
                                        }),
                                  ),
                                ),
                        ],
                      ));
          }),
    );
  }

  listTileItem(Listretailer item, int index) {
    return InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.TESTPAGE, arguments: {
            "out": item.out,
            "outid": item.outid,
            "routeName": controller.rtname
          });
        },
        child: Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.only(
              bottom: 12, top: 3, right: Constant.MEDIUM_PADDING),
          decoration: BoxDecoration(
              color: AppTheme.colorWhite,
              borderRadius:
                  BorderRadius.circular(Constant.LIST_TILE_ROUNDED_CORNER),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 3,
                    spreadRadius: 1,
                    color: AppTheme.colorGray.withOpacity(.5))
              ]),
          child: Stack(
            children: [
              Container(
                width: Constant.MEDIUM_PADDING,
                color: listviewLeadingColortEXT[index % 4],
                height: Constant.LIST_TILE_HEIGHT,
              ),
              Positioned.fill(
                left: 3,
                child: Container(
                  padding:
                      const EdgeInsets.only(right: Constant.MEDIUM_PADDING),
                  decoration: BoxDecoration(
                    color: AppTheme.colorWhite,
                    borderRadius: BorderRadius.circular(
                        Constant.LIST_TILE_ROUNDED_CORNER),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const SizedBox(
                              width: Constant.MEDIUM_PADDING,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.all(Constant.SMALL_PADDING),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: listviewLeadingColorBg[index % 4],
                                // Colors.amber.shade200,
                              ),
                              child: CustomText(
                                  maxLines: 2,
                                  title: index + 1,
                                  colors: listviewLeadingColortEXT[index % 4],
                                  fontSize: AppTheme.medium_1,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: Constant.SMALL_PADDING,
                            ),
                            Expanded(
                              child: CustomText(
                                  textAlign: TextAlign.start,
                                  title: item.out!,
                                  colors: AppTheme.titleDark,
                                  fontSize: AppTheme.medium,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            item.customerLocationFlag == 'YES' &&
                                    item.customerLocationFlag != null
                                ? SvgPicture.asset(
                                    locationSvg,
                                    height: Constant.SVG_ICON_SIZE,
                                    width: Constant.SVG_ICON_SIZE,
                                    color: AppTheme.colorPrimary,
                                    fit: BoxFit.fill,
                                  )
                                : Container(),
                            item.customerLocationApprovalFlag == 'YES' &&
                                    item.customerLocationApprovalFlag != null
                                ? SvgPicture.asset(
                                    doubletickSvg,
                                    height: Constant.SVG_ICON_SIZE,
                                    width: Constant.SVG_ICON_SIZE,
                                    color: AppTheme.colorPrimary,
                                    fit: BoxFit.fill,
                                  )
                                : Container(),
                            item.retailerCheckInFlag == 'YES' &&
                                    item.retailerCheckInFlag != null &&
                                    item.retailerCheckOutFlag == 'YES' &&
                                    item.retailerCheckOutFlag != null
                                ? SvgPicture.asset(
                                    checkInOutSvg,
                                    height: Constant.SVG_ICON_SIZE + 5,
                                    width: Constant.SVG_ICON_SIZE + 5,
                                    color: AppTheme.colorPrimary,
                                    fit: BoxFit.fill,
                                  )
                                : item.retailerCheckInFlag == 'YES' &&
                                        item.retailerCheckInFlag != null
                                    ? SvgPicture.asset(
                                        checkInSvg,
                                        height: Constant.SVG_ICON_SIZE + 5,
                                        width: Constant.SVG_ICON_SIZE + 5,
                                        color: AppTheme.colorPrimary,
                                        fit: BoxFit.fill,
                                      )
                                    : Container(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  _appbar() {
    return DynamicAppBar(
      controller.rtname,
      '',
      AppTheme.colorWhite,
      false,
      () => Get.back(),
      [
        Card(
          margin: const EdgeInsets.all(9),
          shape: CircleBorder(
              side: BorderSide(
                  color: controller.isFilterApplied
                      ? AppTheme.colorPrimary
                      : AppTheme.colorTransparent,
                  width: .8)),
          elevation: 5,
          shadowColor: AppTheme.colorGray,
          child: IconButton(
              padding: EdgeInsets.zero,
              icon: SvgPicture.asset(
                filterSvg,
                height: Constant.SVG_ICON_SIZE,
                width: Constant.SVG_ICON_SIZE,
                color: AppTheme.colorPrimary,
                fit: BoxFit.fill,
              ),
              onPressed: () async {
                var result = await Get.toNamed(AppRoutes.FILTER, arguments: {
                  'CLASS': controller.selectedClassitemId,
                  'SHOPTYPE': controller.selectedShopTypeitemId,
                  'LISTINGTYPE': controller.selectedListingTypeitemId
                });
                if (result != null) {
                  applyFilter(result);
                }
              }),
        )
      ],
      fontColors: AppTheme.titleDark,
      fontWeight: FontWeight.w400,
      title2: '',
    );
  }

  applyFilter(dynamic result) {
    controller.selectedClassitemId = result['CLASS'];
    controller.selectedShopTypeitemId = result['SHOPTYPE'];
    controller.selectedListingTypeitemId = result['LISTINGTYPE'];

    controller.outletList.clear();

    if (controller.selectedClassitemId == null &&
        controller.selectedShopTypeitemId == null &&
        controller.selectedListingTypeitemId == null) {
      for (var element in controller.orgnlOutletList) {
        controller.outletList.add(element);
      }
      controller.isFilterApplied = false;
      controller.update();
      return;
    } else if (controller.selectedClassitemId != null &&
        controller.selectedShopTypeitemId != null &&
        controller.selectedListingTypeitemId != null) {
      for (var element in controller.orgnlOutletList) {
        if (element.retclasscode == controller.selectedClassitemId &&
            element.shoptypecode == controller.selectedShopTypeitemId &&
            element.listtypecode == controller.selectedListingTypeitemId) {
          controller.outletList.add(element);
        }
      }
    } else if (controller.selectedClassitemId != null &&
        controller.selectedShopTypeitemId != null &&
        controller.selectedListingTypeitemId == null) {
      for (var element in controller.orgnlOutletList) {
        if (element.retclasscode == controller.selectedClassitemId &&
            element.shoptypecode == controller.selectedShopTypeitemId) {
          controller.outletList.add(element);
        }
      }
    } else if (controller.selectedClassitemId != null &&
        controller.selectedShopTypeitemId == null &&
        controller.selectedListingTypeitemId != null) {
      for (var element in controller.orgnlOutletList) {
        if (element.retclasscode == controller.selectedClassitemId &&
            element.listtypecode == controller.selectedListingTypeitemId) {
          controller.outletList.add(element);
        }
      }
    } else if (controller.selectedClassitemId == null &&
        controller.selectedShopTypeitemId != null &&
        controller.selectedListingTypeitemId != null) {
      for (var element in controller.orgnlOutletList) {
        if (element.listtypecode == controller.selectedListingTypeitemId &&
            element.shoptypecode == controller.selectedShopTypeitemId) {
          controller.outletList.add(element);
        }
      }
    } else if (controller.selectedClassitemId != null &&
        controller.selectedShopTypeitemId == null &&
        controller.selectedListingTypeitemId == null) {
      for (var element in controller.orgnlOutletList) {
        if (element.retclasscode == controller.selectedClassitemId) {
          controller.outletList.add(element);
        }
      }
    } else if (controller.selectedClassitemId == null &&
        controller.selectedShopTypeitemId != null &&
        controller.selectedListingTypeitemId == null) {
      for (var element in controller.orgnlOutletList) {
        if (element.shoptypecode == controller.selectedShopTypeitemId) {
          controller.outletList.add(element);
        }
      }
    } else {
      for (var element in controller.orgnlOutletList) {
        if (element.listtypecode == controller.selectedListingTypeitemId) {
          controller.outletList.add(element);
        }
      }
    }
    controller.isFilterApplied = true;
    controller.update();
  }
}
