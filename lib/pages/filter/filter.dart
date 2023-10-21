import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerapp/pages/filter/filter_controller.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/widgets/coustom_text.dart';
import 'package:managerapp/widgets/dynamic_appbar.dart';
import 'package:managerapp/widgets/progress_bar.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final filtercontroller = Get.put(FilterController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(builder: ((controller) {
      return Stack(
        children: [
          Scaffold(
            backgroundColor: AppTheme.colorWhite,
            appBar: _appbar(),
            body: Stack(
              children: [
                Container(
                  height: double.infinity,
                  margin: const EdgeInsets.symmetric(
                      horizontal: Constant.MEDIUM_PADDING,
                      vertical: Constant.TOO_LARGE_PADDING),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText(
                          title: Strings.filterSortbyClass,
                          colors: AppTheme.titleDark,
                          fontSize: AppTheme.medium_1,
                        ),
                        const SizedBox(
                          height: Constant.SMALL_PADDING,
                        ),
                        DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButtonFormField(
                                value: filtercontroller.selectedClassitemId,
                                isDense: true,
                                isExpanded: false,
                                hint: CustomText(
                                  title: 'Select',
                                  colors: AppTheme.colorPrimary,
                                ),
                                borderRadius: BorderRadius.circular(
                                    Constant.LIST_TILE_ROUNDED_CORNER),
                                focusColor: AppTheme.colorBlack,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppTheme.colorBlack),
                                      borderRadius: BorderRadius.circular(
                                          Constant.LIST_TILE_ROUNDED_CORNER),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppTheme.colorBlack),
                                      borderRadius: BorderRadius.circular(
                                          Constant.LIST_TILE_ROUNDED_CORNER),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppTheme.colorBlack),
                                      borderRadius: BorderRadius.circular(
                                          Constant.LIST_TILE_ROUNDED_CORNER),
                                    ),
                                    isDense: true,
                                    focusColor: AppTheme.colorBlack,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: Constant.SMALL_PADDING,
                                        horizontal: Constant.SMALL_PADDING)),
                                items: filtercontroller.classList
                                    .map<DropdownMenuItem>((item) {
                                  return DropdownMenuItem(
                                    value: item.retailerclassid,
                                    child: CustomText(
                                      title: item.retailerclassname,
                                      colors: AppTheme.colorPrimary,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  filtercontroller.selectedClassitemId = value;
                                  filtercontroller.update();
                                }),
                          ),
                        ),
                        const SizedBox(
                          height: Constant.EXTRA_LARGE_PADDING,
                        ),
                        CustomText(
                          title: Strings.filterSortbyShopType,
                          colors: AppTheme.titleDark,
                          fontSize: AppTheme.medium_1,
                        ),
                        const SizedBox(
                          height: Constant.SMALL_PADDING,
                        ),
                        DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButtonFormField(
                                value: filtercontroller.selectedShopTypeitemId,
                                isDense: true,
                                isExpanded: false,
                                hint: CustomText(
                                  title: 'Select',
                                  colors: AppTheme.colorPrimary,
                                ),
                                borderRadius: BorderRadius.circular(
                                    Constant.LIST_TILE_ROUNDED_CORNER),
                                focusColor: AppTheme.colorBlack,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppTheme.colorBlack),
                                      borderRadius: BorderRadius.circular(
                                          Constant.LIST_TILE_ROUNDED_CORNER),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppTheme.colorBlack),
                                      borderRadius: BorderRadius.circular(
                                          Constant.LIST_TILE_ROUNDED_CORNER),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppTheme.colorBlack),
                                      borderRadius: BorderRadius.circular(
                                          Constant.LIST_TILE_ROUNDED_CORNER),
                                    ),
                                    isDense: true,
                                    focusColor: AppTheme.colorBlack,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: Constant.SMALL_PADDING,
                                        horizontal: Constant.SMALL_PADDING)),
                                items: filtercontroller.shopTypeList
                                    .map<DropdownMenuItem>((item) {
                                  return DropdownMenuItem(
                                    value: item.shopTypeCode,
                                    child: CustomText(
                                      title: item.shopType,
                                      colors: AppTheme.colorPrimary,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  filtercontroller.selectedShopTypeitemId =
                                      value;
                                  filtercontroller.update();
                                }),
                          ),
                        ),
                        const SizedBox(
                          height: Constant.EXTRA_LARGE_PADDING,
                        ),
                        CustomText(
                          title: Strings.filterSortbyListingType,
                          colors: AppTheme.titleDark,
                          fontSize: AppTheme.medium_1,
                        ),
                        const SizedBox(
                          height: Constant.SMALL_PADDING,
                        ),
                        DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButtonFormField(
                                value:
                                    filtercontroller.selectedListingTypeitemId,
                                isDense: true,
                                isExpanded: false,
                                hint: CustomText(
                                  title: 'Select',
                                  colors: AppTheme.colorPrimary,
                                ),
                                borderRadius: BorderRadius.circular(
                                    Constant.LIST_TILE_ROUNDED_CORNER),
                                focusColor: AppTheme.colorWhite,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppTheme.colorBlack),
                                      borderRadius: BorderRadius.circular(
                                          Constant.LIST_TILE_ROUNDED_CORNER),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppTheme.colorBlack),
                                      borderRadius: BorderRadius.circular(
                                          Constant.LIST_TILE_ROUNDED_CORNER),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppTheme.colorBlack),
                                      borderRadius: BorderRadius.circular(
                                          Constant.LIST_TILE_ROUNDED_CORNER),
                                    ),
                                    isDense: true,
                                    focusColor: AppTheme.colorBlack,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: Constant.SMALL_PADDING,
                                        horizontal: Constant.SMALL_PADDING)),
                                items: filtercontroller.listingTypeList
                                    .map<DropdownMenuItem>((item) {
                                  return DropdownMenuItem(
                                    value: item.listingTypeCode,
                                    child: CustomText(
                                      title: item.listingType,
                                      colors: AppTheme.colorPrimary,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  filtercontroller.selectedListingTypeitemId =
                                      value;
                                  filtercontroller.update();
                                }),
                          ),
                        ),
                        const SizedBox(
                          height: Constant.MEDIUM_PADDING,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: InkWell(
                            onTap: () {
                              clearFilter();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              color: AppTheme.colorBlack,
                              child: CustomText(
                                title: Strings.reset,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: InkWell(
                            onTap: () {
                              applyFilter();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              color: AppTheme.colorPrimary,
                              child: CustomText(
                                title: Strings.apply,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          ProgressBar(isLoader: filtercontroller.isLoading),
        ],
      );
    }));
  }

  _appbar() {
    return DynamicAppBar(
      'Filter',
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

  applyFilter() {
    Get.back(result: {
      'CLASS': filtercontroller.selectedClassitemId,
      'SHOPTYPE': filtercontroller.selectedShopTypeitemId,
      'LISTINGTYPE': filtercontroller.selectedListingTypeitemId,
    });
  }

  clearFilter() {
    filtercontroller.selectedClassitemId = null;
    filtercontroller.selectedShopTypeitemId = null;
    filtercontroller.selectedListingTypeitemId = null;
    filtercontroller.update();
    //Get.back();
  }
}
