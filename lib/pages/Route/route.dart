import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerapp/pages/Route/route_controller.dart';
import 'package:managerapp/pages/Route/route_loader.dart';
import 'package:managerapp/routes/app_routes.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/widgets/coustom_text.dart';
import 'package:managerapp/widgets/dynamic_appbar.dart';

import '../../util/hex_code.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({super.key});

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  final routeController = Get.put(RouteController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: routeController,
        builder: (_) {
          return Scaffold(
            backgroundColor: AppTheme.colorWhite,
            appBar: _appbar(),
            body: routeController.responseList.isEmpty
                ? const RouteLoader()
                : Container(
                    margin: const EdgeInsets.only(
                      top: Constant.EXTRA_LARGE_PADDING,
                      left: Constant.MEDIUM_PADDING,
                    ),
                    child: ListView.builder(
                        itemCount: routeController.listroute!.length,
                        itemBuilder: (context, int index) {
                          return InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.ROUTEPAGE, arguments: {
                                  'rtid': (routeController
                                      .listroute![index].rtid
                                      .toString()),
                                  'routeName': (routeController
                                      .listroute![index].rt
                                      .toString())
                                });
                              },
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                margin: const EdgeInsets.only(
                                    bottom: 12,
                                    top: 3,
                                    right: Constant.MEDIUM_PADDING),
                                decoration: BoxDecoration(
                                    color: AppTheme.colorWhite,
                                    borderRadius: BorderRadius.circular(
                                        Constant.LIST_TILE_ROUNDED_CORNER),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 2),
                                          blurRadius: 3,
                                          spreadRadius: 1,
                                          color: AppTheme.colorGray
                                              .withOpacity(.5))
                                    ]),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: Constant.MEDIUM_PADDING,
                                      color:
                                          listviewLeadingColortEXT[index % 4],
                                      height: Constant.LIST_TILE_HEIGHT,
                                    ),
                                    Positioned.fill(
                                      left: 3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppTheme.colorWhite,
                                          borderRadius: BorderRadius.circular(
                                              Constant
                                                  .LIST_TILE_ROUNDED_CORNER),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            const SizedBox(
                                              width: Constant.LARGE_PADDING,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(
                                                  Constant.SMALL_PADDING),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: listviewLeadingColorBg[
                                                    index % 4],
                                                // Colors.amber.shade200,
                                              ),
                                              child: CustomText(
                                                  title: routeController
                                                      .listroute![index].rt![0],
                                                  colors:
                                                      listviewLeadingColortEXT[
                                                          index % 4],
                                                  fontSize: AppTheme.medium_1,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              width: Constant.SMALL_PADDING,
                                            ),
                                            CustomText(
                                                title: routeController
                                                    .listroute![index].rt!,
                                                colors: AppTheme.titleDark,
                                                fontSize: AppTheme.medium,
                                                fontWeight: FontWeight.normal),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        }),
                  ),
          );
        });
  }

  _appbar() {
    return DynamicAppBar(
      'Route',
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

List<Color> listviewLeadingColorBg = [
  HexColor('#CBF8F4'),
  HexColor('#FFDFEE'),
  HexColor('#E3F0FF'),
  HexColor('#FEF5DE'),
];

List<Color> listviewLeadingColortEXT = [
  HexColor('#3C9D92'),
  HexColor('#BF376F'),
  HexColor('#537E9F'),
  HexColor('#D7A915'),
];
