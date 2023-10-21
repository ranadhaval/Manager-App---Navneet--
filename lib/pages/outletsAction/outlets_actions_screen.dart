import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:managerapp/pages/outletsAction/actions/retailerclass/retailer_class_dialog.dart';
import 'package:managerapp/pages/outletsAction/outlets_action_controller.dart';
import 'package:managerapp/pages/outletsAction/outlets_actions_loader.dart';
import 'package:managerapp/routes/app_routes.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/utils.dart';
import 'package:managerapp/widgets/coustom_text.dart';
import 'package:managerapp/widgets/dynamic_appbar.dart';
import 'package:managerapp/widgets/progress_bar.dart';

class OutletsActionScreen extends StatefulWidget {
  const OutletsActionScreen({super.key});

  @override
  State<OutletsActionScreen> createState() => _OutletsActionScreenState();
}

class _OutletsActionScreenState extends State<OutletsActionScreen> {
  OutletsActionController outletsActionController =
      Get.put(OutletsActionController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OutletsActionController>(builder: (controller) {
      return Scaffold(
        appBar: _appbar(),
        body: outletsActionController.isLoading
            ? const OutletActionLoader()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(Constant.MEDIUM_PADDING),
                  child: Column(children: [
                    actionCard('Action Event Check In-Out/Order',
                        outletsActionController.actionlist1),
                    actionCard('Action Event Utilities',
                        outletsActionController.actionlist2),
                    actionCard('Action Event Manage Retailer',
                        outletsActionController.actionlist3),
                    actionCard('Action Event Image/Location',
                        outletsActionController.actionlist4),
                  ]),
                ),
              ),
      );
    });
  }

  Container actionCard(String title, List<ActionCard> list) {
    if (list == outletsActionController.actionlist3) {
      ActionCard item = list[2];
      return Container(
        margin: const EdgeInsets.only(bottom: Constant.MEDIUM_PADDING),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Constant.ROUNDED_CORNER),
            border: Border.all(color: AppTheme.colorGray)),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: AppTheme.bgActionTitle,
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(Constant.ROUNDED_CORNER))),
              padding: const EdgeInsets.all(Constant.MEDIUM_PADDING),
              width: double.infinity,
              child: CustomText(
                textAlign: TextAlign.start,
                title: title,
                colors: AppTheme.titleDark,
                fontSize: AppTheme.medium,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: list.map((item) {
                if (item.id == 11) {
                  return Container();
                } else {
                  return Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              performAction(item.id);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: Constant.MEDIUM_PADDING,
                                  bottom: Constant.SMALL_PADDING),
                              padding: const EdgeInsets.all(
                                  Constant.SMALL_PADDING + 2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.colorPrimary,
                              ),
                              child: SvgPicture.asset(
                                item.iconPath,
                                height: Constant.SVG_ICON_SIZE,
                                width: Constant.SVG_ICON_SIZE,
                                color: AppTheme.colorWhite,
                              ),
                            ),
                          ),
                          CustomText(
                            title: item.name,
                            maxLines: 2,
                            colors: AppTheme.titleDark,
                          )
                        ],
                      ),
                    ),
                  );
                }
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  performAction(item.id);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: Constant.MEDIUM_PADDING,
                            bottom: Constant.SMALL_PADDING),
                        padding:
                            const EdgeInsets.all(Constant.SMALL_PADDING + 2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.colorPrimary,
                        ),
                        child: SvgPicture.asset(
                          item.iconPath,
                          height: Constant.SVG_ICON_SIZE,
                          width: Constant.SVG_ICON_SIZE,
                          color: AppTheme.colorWhite,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: item.name,
                            maxLines: 2,
                            colors: AppTheme.titleDark,
                          ),
                          CustomText(
                            title: outletsActionController.outletData!.cno!,
                            maxLines: 2,
                            colors: AppTheme.titleDark,
                          ),
                        ],
                      ),
                    ),
                    const Flexible(
                      flex: 1,
                      child: SizedBox(
                        width: Constant.MEDIUM_PADDING,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: Constant.MEDIUM_PADDING,
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(bottom: Constant.MEDIUM_PADDING),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Constant.ROUNDED_CORNER),
            border: Border.all(color: AppTheme.colorGray)),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: AppTheme.bgActionTitle,
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(Constant.ROUNDED_CORNER))),
              padding: const EdgeInsets.all(Constant.MEDIUM_PADDING),
              width: double.infinity,
              child: CustomText(
                textAlign: TextAlign.start,
                title: title,
                colors: AppTheme.titleDark,
                fontSize: AppTheme.medium,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: list.map((item) {
                if (item.id == 11) {
                  return Container();
                } else {
                  return Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              performAction(item.id);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: Constant.MEDIUM_PADDING,
                                  bottom: Constant.SMALL_PADDING),
                              padding: const EdgeInsets.all(
                                  Constant.SMALL_PADDING + 2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.colorPrimary,
                              ),
                              child: SvgPicture.asset(
                                item.iconPath,
                                height: Constant.SVG_ICON_SIZE,
                                width: Constant.SVG_ICON_SIZE,
                                color: AppTheme.colorWhite,
                              ),
                            ),
                          ),
                          CustomText(
                            title: item.name,
                            maxLines: 2,
                            colors: AppTheme.titleDark,
                          )
                        ],
                      ),
                    ),
                  );
                }
              }).toList(),
            ),
            const SizedBox(
              height: Constant.MEDIUM_PADDING,
            ),
          ],
        ),
      );
    }
  }

  _appbar() {
    return DynamicAppBar(
      outletsActionController.title,
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

  performAction(int id) async {
    switch (id) {
      case 1:
        break;
      case 2:
        break;
      case 3:
        Get.toNamed(AppRoutes.NEWORDER,
            arguments: {"outid": outletsActionController.outid, "type": 0});
        break;
      case 4:
        Get.toNamed(AppRoutes.RECENT_ORDER_SCREEN,
            arguments: [outletsActionController.outid.toString()]);
        break;
      case 5:
        Get.toNamed(AppRoutes.MCC_RETAILER_SCREEN,
            arguments: [outletsActionController.outid.toString()]);
        break;
      case 6:
        Get.toNamed(AppRoutes.ADD_MCC_RETAILER_SCREEN, arguments: {
          "outid": outletsActionController.outid,
        });
        break;
      case 7:
        var result = await Get.toNamed(AppRoutes.VIEWEDITACTION, arguments: {
          'routeName': outletsActionController.rtname,
          'response': outletsActionController.outletData,
          "outid": outletsActionController.outid,
        });
        if (result != null && result == true) {
          outletsActionController.getOutletData();
        }
        break;
      case 8:
        Utils.openMap(outletsActionController.outletData!.latitude!,
            outletsActionController.outletData!.longitude!);
        break;
      case 9:
        Get.toNamed(AppRoutes.NEWORDER,
            arguments: {"outid": outletsActionController.outid, "type": 1});
        break;
      case 10:
        var result = await Get.dialog(const RetailerClassDialog(), arguments: {
          "CLASS": outletsActionController.outletData!.retclasscode,
          "outid": outletsActionController.outid
        });
        if (result != null && result == true) {
          outletsActionController.getOutletData();
        }
        break;
      case 11:
        Utils.makePhoneCall(outletsActionController.outletData!.cno!);
        break;
      case 12:
        Get.toNamed(AppRoutes.POTENTIAL,
            arguments: {"outid": outletsActionController.outid});
        break;
      case 13:
        var result = await Get.toNamed(AppRoutes.IMAGES, arguments: {
          "outid": outletsActionController.outid,
          "type": "SHOP",
          "images": outletsActionController.outletData!.lstimageShop
        });
        if (result != null && result == true) {
          outletsActionController.getOutletData();
        }
        break;
      case 14:
        var result = await Get.toNamed(AppRoutes.IMAGES, arguments: {
          "outid": outletsActionController.outid,
          "type": "VISITCARD",
          "images": outletsActionController.outletData!.lstimageVisitCard
        });
        if (result != null && result == true) {
          outletsActionController.getOutletData();
        }
        break;
      case 15:
        var result = await Get.toNamed(AppRoutes.IMAGES, arguments: {
          "outid": outletsActionController.outid,
          "type": "Retailer_Logo",
          "images": outletsActionController.outletData!.lstimageLogo
        });
        if (result != null && result == true) {
          outletsActionController.getOutletData();
        }
        break;
      case 16:
        break;
      default:
    }
  }
}
