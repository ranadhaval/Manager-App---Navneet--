import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:managerapp/pages/outletsAction/actions/retailerclass/retailer_class_controller.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/widgets/coustom_text.dart';
import 'package:managerapp/widgets/gradient_button.dart';
import 'package:managerapp/widgets/progress_bar.dart';

class RetailerClassDialog extends StatefulWidget {
  const RetailerClassDialog({super.key});

  @override
  State<RetailerClassDialog> createState() => _RetailerClassDialogState();
}

class _RetailerClassDialogState extends State<RetailerClassDialog> {
  RetailerClassController retailerClassController =
      Get.put(RetailerClassController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RetailerClassController>(builder: (controller) {
      return Stack(
        children: [
          AlertDialog(
            content: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Constant.ROUNDED_CORNER)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    textAlign: TextAlign.start,
                    title: "Select Retailer Class",
                    colors: AppTheme.colorPrimary,
                    fontSize: AppTheme.large,
                    fontWeight: FontWeight.w500,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: Constant.EXTRA_LARGE_PADDING),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButtonFormField(
                            value: retailerClassController.selectedClassitemId,
                            isDense: true,
                            isExpanded: true,
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
                                      color: AppTheme.textfieldbordercolor),
                                  borderRadius: BorderRadius.circular(
                                      Constant.LIST_TILE_ROUNDED_CORNER),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.textfieldbordercolor),
                                  borderRadius: BorderRadius.circular(
                                      Constant.LIST_TILE_ROUNDED_CORNER),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppTheme.textfieldbordercolor),
                                  borderRadius: BorderRadius.circular(
                                      Constant.LIST_TILE_ROUNDED_CORNER),
                                ),
                                isDense: true,
                                focusColor: AppTheme.colorBlack,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: Constant.SMALL_PADDING,
                                  //horizontal: Constant
                                  //  .VERY_SMALL_PADDING
                                )),
                            items: retailerClassController.classList
                                .map<DropdownMenuItem>((e) => DropdownMenuItem(
                                    value: e.retailerclassid,
                                    child: Text(e.retailerclassname!)))
                                .toList(),
                            onChanged: (value) {
                              retailerClassController.selectedClassitemId =
                                  value;
                              retailerClassController.update();
                            }),
                      ),
                    ),
                  ),
                  GradientButton(
                      width: Constant.BTN_WIDTH,
                      height: 40,
                      topPadding: Constant.VERY_SMALL_PADDING,
                      startColor: AppTheme.bgGradiontend,
                      endColor: AppTheme.bgGradiontStart,
                      onTap: () {
                        retailerClassController.updateRetailerClass();
                      },
                      child: CustomText(title: Strings.submit))
                ],
              ),
            ),
          ),
          ProgressBar(isLoader: retailerClassController.isLoading)
        ],
      );
    });
  }
}
