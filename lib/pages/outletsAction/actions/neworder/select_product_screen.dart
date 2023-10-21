import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerapp/pages/outletsAction/actions/neworder/select_product_controller.dart';
import 'package:managerapp/pages/outletsAction/actions/neworder/new_order_response.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/widgets/coustom_text.dart';
import 'package:managerapp/widgets/dynamic_appbar.dart';
import 'package:managerapp/widgets/input_textfield.dart';
import 'package:managerapp/widgets/no_data_found.dart';

class SelectProduct extends StatefulWidget {
  const SelectProduct({super.key});

  @override
  State<SelectProduct> createState() => _SelectProductState();
}

class _SelectProductState extends State<SelectProduct> {
  final selectProductController = Get.put(SelectProductController());
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
          init: selectProductController,
          builder: (_) {
            return Scaffold(
                backgroundColor: AppTheme.colorWhite,
                appBar: _appbar(),
                body: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Constant.MEDIUM_PADDING,
                      vertical: Constant.MEDIUM_PADDING),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CoustomTextField(
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
                              selectProductController.searchTextController,
                          onTextValidator: (_) {},
                          onChanged: (value) => {
                                selectProductController.updateList(value),
                              }),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: Constant.MEDIUM_PADDING),
                        child: CustomText(
                          textAlign: TextAlign.left,
                          title: 'Product List',
                          fontWeight: FontWeight.w500,
                          fontSize: AppTheme.large,
                          colors: AppTheme.titleDark,
                        ),
                      ),
                      selectProductController.catagoryList.isEmpty
                          ? const NoDataFound()
                          : Expanded(
                              child: ListView.builder(
                                  itemCount: selectProductController
                                      .catagoryList.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, int index) {
                                    Listcat item = selectProductController
                                        .catagoryList[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Card(
                                        elevation: 5,
                                        child: ExpansionTile(
                                            backgroundColor:
                                                AppTheme.colorCardBg,
                                            collapsedBackgroundColor:
                                                AppTheme.colorCardBg,
                                            tilePadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 8),
                                            iconColor: AppTheme.colorPrimary,
                                            collapsedIconColor:
                                                AppTheme.colorPrimary,
                                            title: CustomText(
                                              title: item.cat,
                                              textAlign: TextAlign.start,
                                              fontSize: AppTheme.medium,
                                              colors: AppTheme.titleDark,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            childrenPadding:
                                                const EdgeInsets.all(10),
                                            children: item.listpord!
                                                .map<Widget>(
                                                    (e) => listTileItem(e))
                                                .toList()),
                                      ),
                                    );

                                    //listTileItem(item, index);
                                  }),
                            ),
                    ],
                  ),
                ));
          }),
    );
  }

  listTileItem(Listpord item) {
    return InkWell(
        onTap: () {
          Get.back(result: item);
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: Constant.MEDIUM_PADDING),
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: AppTheme.colorWhite,
              borderRadius:
                  BorderRadius.circular(Constant.LIST_TILE_ROUNDED_CORNER),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 3,
                    spreadRadius: 1,
                    color: AppTheme.colorGray.withOpacity(.9))
              ]),
          child: Container(
            padding: const EdgeInsets.all(Constant.MEDIUM_PADDING),
            decoration: BoxDecoration(
              color: AppTheme.colorWhite,
              borderRadius:
                  BorderRadius.circular(Constant.LIST_TILE_ROUNDED_CORNER),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: "#${item.pid}",
                        colors: AppTheme.colorPrimary,
                        fontSize: AppTheme.medium,
                      ),
                      CustomText(
                        title: "Unit Price: ${item.amt}",
                        colors: AppTheme.colorPrimary,
                        fontSize: AppTheme.medium,
                      ),
                    ]),
                const SizedBox(
                  height: Constant.VERY_SMALL_PADDING,
                ),
                CustomText(
                  textAlign: TextAlign.left,
                  title: item.prd,
                  colors: AppTheme.titleDark,
                  fontSize: AppTheme.medium,
                ),
              ],
            ),
          ),
        ));
  }

  _appbar() {
    return DynamicAppBar(
      'Select ',
      '',
      AppTheme.colorWhite,
      false,
      () => Get.back(),
      [],
      fontColors: AppTheme.titleDark,
      fontWeight: FontWeight.w400,
      title2: 'Product',
    );
  }
}
