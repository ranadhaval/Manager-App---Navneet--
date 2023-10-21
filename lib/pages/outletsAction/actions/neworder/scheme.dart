import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerapp/pages/outletsAction/actions/neworder/scheme_controller.dart';
import 'package:managerapp/pages/outletsAction/actions/neworder/new_order_response.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/widgets/coustom_text.dart';
import 'package:managerapp/widgets/dynamic_appbar.dart';
import 'package:managerapp/widgets/input_textfield.dart';
import 'package:managerapp/widgets/no_data_found.dart';

class Scheme extends StatefulWidget {
  const Scheme({super.key});

  @override
  State<Scheme> createState() => _SchemeState();
}

class _SchemeState extends State<Scheme> {
  final schemeController = Get.put(SchemeController());
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
          init: schemeController,
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
                              schemeController.searchTextController,
                          onTextValidator: (_) {},
                          onChanged: (value) => {
                                schemeController.updateList(value),
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
                      schemeController.schemeList.isEmpty
                          ? const NoDataFound()
                          : Expanded(
                              child: ListView.builder(
                                  itemCount: schemeController.schemeList.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, int index) {
                                    Listscheme item =
                                        schemeController.schemeList[index];
                                    return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: listTileItem(item));

                                    //listTileItem(item, index);
                                  }),
                            ),
                    ],
                  ),
                ));
          }),
    );
  }

  listTileItem(Listscheme item) {
    return InkWell(
        onTap: () {
          Get.back(result: item.scid);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: Constant.MEDIUM_PADDING),
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: AppTheme.colorCardBg,
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
                CustomText(
                  title: "#${item.scid}",
                  colors: AppTheme.colorPrimary,
                  fontSize: AppTheme.medium,
                ),
                SizedBox(
                  height: Constant.VERY_SMALL_PADDING,
                ),
                CustomText(
                  textAlign: TextAlign.left,
                  title: item.scn,
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
      'Select Scheme',
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
