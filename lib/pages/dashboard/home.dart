import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:managerapp/pages/Dashboard/dashboard_page.dart';
import 'package:managerapp/pages/Dashboard/home_controller.dart';
import 'package:managerapp/pages/Dashboard/inout_page.dart';
import 'package:managerapp/pages/Dashboard/report_page.dart';
import 'package:managerapp/routes/app_routes.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:managerapp/util/resources.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/widgets/CustomAppbar.dart';
import 'package:managerapp/widgets/coustom_text.dart';
import 'package:managerapp/widgets/no_appbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: GetBuilder<HomeController>(builder: ((controller) {
        return Scaffold(
            backgroundColor: AppTheme.colorWhite,
            appBar: NoAppBar(),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: AppTheme.bottomPadding),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: homeController.is_open ? 1 : 0,
                    sigmaY: homeController.is_open ? 1 : 0),
                child: SpeedDial(
                  activeChild: const Icon(
                    Icons.close,
                    size: Constant.spedddialcancleSize,
                  ),
                  foregroundColor: AppTheme.dialIconColor,
                  icon: Icons.add,
                  backgroundColor: AppTheme.colorWhite,
                  overlayColor: AppTheme.colorBlack,
                  overlayOpacity: 0.3,
                  spaceBetweenChildren: AppTheme.spacebetweendialitem,
                  iconTheme: const IconThemeData(size: AppTheme.dialiconsize),
                  buttonSize: const Size(AppTheme.dialsize, AppTheme.dialsize),
                  onOpen: () {
                    homeController.is_open = Constant.isFalse;
                    homeController.update();
                  },
                  onClose: () {
                    homeController.is_open = Constant.isFalse;
                    homeController.update();
                  },
                  children: [
                    speedchild(
                        icon: New_retailer_order,
                        label: Strings.newRetailerOrder),
                    speedchild(
                        icon: distribution, label: Strings.newDistributerOrder),
                    speedchild(
                        icon: new_attandance, label: Strings.newAttendance),
                    speedchild(icon: expensesmenu, label: Strings.newExpense),
                    speedchild(
                        icon: New_regestration, label: Strings.newEntryRequest),
                    speedchild(
                        icon: notification, label: Strings.newRetrilerRequest),
                    speedchild(
                        icon: feedback, label: Strings.sugestionFeddback),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            body: _body(),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.all(Constant.TEN_PADDING),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  gradient:
                      LinearGradient(colors: Constant.BOOTOM_SHEET_COOLR)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  navigationItem(
                      id: Constant.ONE,
                      icon: homeIcon,
                      isNavigationbar: Constant.isTrue),
                  navigationItem(
                      id: Constant.TWO,
                      icon: distance,
                      isNavigationbar: Constant.isTrue),
                  navigationItem(
                      id: Constant.THREE,
                      icon: report,
                      isNavigationbar: Constant.isTrue),
                  bottomSheetButton(
                      id: Constant.FOUR,
                      icon: menu,
                      isNavigationbar: Constant.isTrue,
                      is_tapped: Constant.isFalse),
                  const SizedBox(
                    width: Constant.TWENTY_SIZEDBOX,
                  ),
                ],
              ),
            ));
      })),
    );
  }

  _body() {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: Constant.BOOTOM_SHEET_COOLR)),
      ),
      Container(
        decoration: BoxDecoration(
            color: AppTheme.colorWhite,
            border: Border.all(color: AppTheme.colorTransparent),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppTheme.TWENTY_radius),
                bottomRight: Radius.circular(AppTheme.TWENTY_radius))),
        child: Column(
          children: [
            CustomAppBar(
                subTitle: homeController.userData!.username,
                titleStyle: TextStyle(
                    color: AppTheme.appbarTtileColor,
                    fontWeight: FontWeight.bold),
                subtitleStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w400),
                title: Strings.appbarTitleName),
            Container(
              height: Constant.DISTANCE_SIZE,
              color: AppTheme.distanceColor,
            ),
            const SizedBox(
              height: Constant.APPBAR_TO_ITEM_DISTANCE,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: Constant.DASHBOARD_BOTTOM_PADDING),
                child: Builder(builder: (context) {
                  switch (homeController.index) {
                    case 1:
                      return const DashboardPage();
                    case 2:
                      return const InOutPage();
                    case 3:
                      return const ReportPage();
                    default:
                      return const DashboardPage();
                  }
                }),
              ),
            ),
          ],
        ),
      )
    ]);
  }

  bottomSheet() {
    return showModalBottomSheet(
        isScrollControlled: true,
        barrierColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Stack(children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 30,
                  color: Colors.transparent,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: Constant.BOTTOM_SHEET_BODY_TOP_PADDING,
                      bottom: Constant.BOTTOM_SHEET_BODY_BOTTOM_PADDING,
                      left: Constant.BOTTOM_SHEET_BODY_LEFT_PADDING,
                      right: Constant.BOTTOM_SHEET_BODY_RIGHT_PADDING),
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: Constant.BOOTOM_SHEET_COOLR),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      bottomSheetNavigationItem(
                          id: Constant.ONE,
                          icon: homeIcon,
                          isNavigationbar: false),
                      bottomSheetNavigationItem(
                          id: Constant.TWO,
                          icon: distance,
                          isNavigationbar: true),
                      bottomSheetNavigationItem(
                          id: Constant.THREE,
                          icon: report,
                          isNavigationbar: false),
                      bottomSheetButton(
                          id: Constant.FOUR,
                          is_tapped: true,
                          icon: menu,
                          isNavigationbar: false),
                      const SizedBox(
                        width: Constant.TWENTY_SIZEDBOX,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.all(Constant.TEN_PADDING),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 0.5,
                              blurRadius: 0.5,
                              blurStyle: BlurStyle.outer,
                              color: Colors.transparent)
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Constant.BOOTOM_SHEET_COOLR[0].withOpacity(0.9),
                              Constant.BOOTOM_SHEET_COOLR[2].withOpacity(0.9),
                            ])),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Column(
                        children: [
                          StaggeredGridView.countBuilder(
                            padding: const EdgeInsets.all(10),
                            crossAxisCount: Constant.BOTTOM_SHEET_ITEM_LIMIT,
                            crossAxisSpacing: Constant.ZERO,
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            mainAxisSpacing: Constant.MAIN_SPACE,
                            itemCount: 10,
                            staggeredTileBuilder: (index) {
                              return const StaggeredTile.fit(1);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return menuItems(
                                  id: index + 1,
                                  icon: icons[index],
                                  title: title[index],
                                  routeName: menuRoutes[index]);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: Constant.FIFTEEN_PADDING,
                      right: Constant.TEN_PADDING),
                  child: InkWell(
                    borderRadius:
                        BorderRadius.circular(Constant.BORDER_RADIUS_SIXTY),
                    onTap: () {
                      Get.back();
                    },
                    child: Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              Constant.BORDER_RADIUS_SIXTY),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      elevation: Constant.EIGHT_ELEVATION,
                      child: CircleAvatar(
                        radius: Constant.TWENTY_FIVE_RADIUS,
                        backgroundColor: AppTheme.colorWhite,
                        child: Center(
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 35,
                            color: AppTheme.themeColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]);
        });
  }

  Widget bottomSheetButton(
      {required int id,
      required String icon,
      required bool isNavigationbar,
      required bool is_tapped}) {
    return InkWell(
      onTap: () {
        homeController.tapped = !homeController.tapped;
        homeController.update();
        bottomSheet();
        !isNavigationbar ? Get.back() : null;
      },
      child: CircleAvatar(
        radius: Constant.TWENTY_THREE_RADIUS,
        backgroundColor: Colors.transparent,
        child: Card(
            color: is_tapped ? Colors.white : Colors.transparent,
            shape: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(Constant.BORDER_RADIUS_FIFTY),
                borderSide: const BorderSide(color: Colors.transparent)),
            shadowColor: is_tapped ? Colors.grey : Colors.transparent,
            elevation: is_tapped ? Constant.TEN_ELEVATION : Constant.ZERO,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    icon,
                    width: is_tapped
                        ? Constant.NAVIGATION_ICON_TAPPED_SIZE
                        : Constant.NAVIGATION_ICON_ORIGINAL_SIZE,
                    height: is_tapped
                        ? Constant.NAVIGATION_ICON_TAPPED_SIZE
                        : Constant.NAVIGATION_ICON_ORIGINAL_SIZE,
                    color: is_tapped
                        ? Constant.BOOTOM_SHEET_COOLR[0]
                        : AppTheme.colorWhite,
                  ),
                  const SizedBox(
                    height: Constant.FOUR_SIZED,
                  ),
                  is_tapped
                      ? const CircleAvatar(
                          radius: Constant.RADIUS_TWO,
                        )
                      : Container()
                ],
              ),
            )),
      ),
    );
  }

  List<String> menuRoutes = [
    AppRoutes.SUBORDINATE,
    AppRoutes.DASHBOARD,
    AppRoutes.DEMO,
    AppRoutes.DEMO,
    AppRoutes.DEMO,
    AppRoutes.DEMO,
    AppRoutes.DEMO,
    AppRoutes.DEMO,
    AppRoutes.DEMO,
    AppRoutes.DEMO,
  ];

  speedchild({required String icon, required String label}) {
    return SpeedDialChild(
      labelWidget: Row(
        children: [
          Text(
            label,
            style: const TextStyle(color: AppTheme.colorWhite),
          ),
          const SizedBox(
            width: Constant.SIZEDBOX_15,
          ),
          CircleAvatar(
            backgroundColor: AppTheme.speedDialColor,
            radius: Constant.SPEED_DIAL_RADIUS,
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: Constant.SPEED_DIAL_SIZE,
                height: Constant.SPEED_DIAL_SIZE,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> icons = [
    subordinateSE,
    leave,
    attendancemenu,
    distribution,
    distributor,
    expensesmenu,
    newproduct,
    upgrademenu,
    filepending,
    logout
  ];

  List<String> title = [
    Strings.subordinates,
    Strings.leave,
    Strings.attendance,
    Strings.distribution,
    Strings.distributor,
    Strings.expanse,
    Strings.newProduct,
    Strings.upgardemenu,
    Strings.retailerRemovedRequest,
    Strings.logout
  ];

  Widget navigationItem(
      {required int id, required String icon, required bool isNavigationbar}) {
    return InkWell(
      onTap: () {
        homeController.index = id;
        homeController.update();
        if (homeController.index == Constant.FOUR) {
          bottomSheet();
        }
        !isNavigationbar ? Get.back() : null;
      },
      child: CircleAvatar(
        radius: Constant.TWENTY_THREE_RADIUS,
        backgroundColor: Colors.transparent,
        child: Card(
            color: homeController.index == id
                ? AppTheme.colorWhite
                : Colors.transparent,
            shape: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(Constant.BORDER_RADIUS_FIFTY),
                borderSide: const BorderSide(color: Colors.transparent)),
            shadowColor: homeController.index == id
                ? AppTheme.colorGrey
                : Colors.transparent,
            elevation: homeController.index == id
                ? Constant.TEN_ELEVATION
                : Constant.ZERO,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    icon,
                    width: homeController.index == id
                        ? Constant.NAVIGATION_ICON_TAPPED_SIZE
                        : Constant.NAVIGATION_ICON_ORIGINAL_SIZE,
                    height: homeController.index == id
                        ? Constant.NAVIGATION_ICON_TAPPED_SIZE
                        : Constant.NAVIGATION_ICON_ORIGINAL_SIZE,
                    color: homeController.index == id
                        ? Constant.BOOTOM_SHEET_COOLR[0]
                        : AppTheme.colorWhite,
                  ),
                  const SizedBox(
                    height: Constant.FOUR_SIZED,
                  ),
                  homeController.index == id
                      ? const CircleAvatar(
                          radius: Constant.RADIUS_TWO,
                        )
                      : Container()
                ],
              ),
            )),
      ),
    );
  }

  Widget menuItems(
      {required int id,
      required String icon,
      required String title,
      required String routeName}) {
    return InkWell(
      onTap: () {
        homeController.index = id;
        homeController.update();
        Get.back();
        Get.toNamed(routeName);
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: Constant.BOTTOM_SHEET_ICON_SIZE,
              height: Constant.BOTTOM_SHEET_ICON_SIZE,
              color: AppTheme.colorWhite,
            ),
            const SizedBox(
              height: Constant.TEN_SIZEDBOX,
            ),
            CustomText(
              textAlign: TextAlign.center,
              fontSize: Constant.APPBAR_TITLE_TEXT_SIZE,
              colors: AppTheme.colorWhite,
              title: title,
            )
          ],
        ),
      ),
    );
  }

  Widget bottomSheetNavigationItem(
      {required int id, required String icon, required bool isNavigationbar}) {
    return InkWell(
      onTap: () {
        homeController.index = id;
        homeController.update();
        Get.back();
      },
      child: CircleAvatar(
        radius: Constant.TWENTY_THREE_RADIUS,
        backgroundColor: Colors.transparent,
        child: Card(
            color: Colors.transparent,
            shape: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(Constant.BORDER_RADIUS_FIFTY),
                borderSide: const BorderSide(color: Colors.transparent)),
            shadowColor: Colors.transparent,
            elevation: Constant.ZERO,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    icon,
                    width: Constant.NAVIGATION_ICON_ORIGINAL_SIZE,
                    height: Constant.NAVIGATION_ICON_ORIGINAL_SIZE,
                    color: AppTheme.colorWhite,
                  ),
                  const SizedBox(
                    height: Constant.FOUR_SIZED,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
