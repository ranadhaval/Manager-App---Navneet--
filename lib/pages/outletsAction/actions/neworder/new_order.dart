import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:managerapp/pages/outletsAction/actions/neworder/new_order_controller.dart';
import 'package:managerapp/pages/outletsAction/actions/neworder/new_order_response.dart';
import 'package:managerapp/routes/app_routes.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/resources.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/widgets/coustom_text.dart';
import 'package:managerapp/widgets/dynamic_appbar.dart';
import 'package:managerapp/widgets/error_dialog.dart';
import 'package:managerapp/widgets/gradient_button.dart';
import 'package:managerapp/widgets/input_textfield.dart';
import 'package:managerapp/widgets/progress_bar.dart';
import 'package:managerapp/widgets/title_widge.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({super.key});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

Key key = const Key('dd');

class _NewOrderScreenState extends State<NewOrderScreen> {
  NewOrderController newOrderController = Get.put(NewOrderController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: GetBuilder<NewOrderController>(builder: (controller) {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: AppTheme.colorWhite,
              appBar: _appbar(),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(Constant.MEDIUM_PADDING),
                      padding: const EdgeInsets.all(Constant.LARGE_PADDING),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Constant.ROUNDED_CORNER),
                          color: AppTheme.colorWhite,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 2),
                                blurRadius: 3,
                                spreadRadius: 1,
                                color: AppTheme.colorGray.withOpacity(.5))
                          ]),
                      child: !newOrderController.isSubmitTaped
                          ? Form(
                              key: newOrderController.ssdkey,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: InputTitleRequire(
                                          title: 'Product ID:',
                                          require: false,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: Constant.SMALL_PADDING,
                                      ),
                                      Flexible(
                                        flex: 6,
                                        child: CoustomTextField(
                                            textEditingController:
                                                newOrderController.prdIdCtrl,
                                            keyboardType: TextInputType.number,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal:
                                                        Constant.SMALL_PADDING,
                                                    vertical: Constant
                                                        .MEDIUM_PADDING),
                                            suffixIcon: TextButton(
                                              child: CustomText(
                                                title: 'Help',
                                                colors: AppTheme.colorPrimary,
                                              ),
                                              onPressed: () async {
                                                Listpord result =
                                                    await Get.toNamed(
                                                        AppRoutes.SELECTPRODUCT,
                                                        arguments:
                                                            newOrderController
                                                                .catagoryList);
                                                if (result != null) {
                                                  newOrderController.prdIdCtrl
                                                      .text = result.pid!;
                                                  newOrderController
                                                      .getDistributor(
                                                          result.pid!);
                                                  newOrderController
                                                          .productName =
                                                      result.prd!;
                                                  newOrderController.update();
                                                }
                                              },
                                            ),
                                            fontSize: AppTheme.medium,
                                            labelText: 'Product ID',
                                            hintColor: AppTheme.colorGray,
                                            borderEnableColors:
                                                AppTheme.textfieldbordercolor,
                                            borderFocusColors:
                                                AppTheme.textfieldbordercolor,
                                            onTextValidator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please Enter Product ID';
                                              } else if (value.length != 5) {
                                                return 'Please Enter valid Product ID';
                                              } else {
                                                return null;
                                              }
                                            },
                                            onChanged: (value) {
                                              print("ok");
                                              if (value.length == 5) {
                                                newOrderController
                                                    .getDistributor(value);
                                              } else {
                                                newOrderController
                                                    .distributorlist
                                                    .clear();
                                                newOrderController
                                                    .dropDownValue = "";
                                                newOrderController.update();
                                              }
                                            }),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: Constant.SMALL_PADDING,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: InputTitleRequire(
                                          title: 'Quantity:',
                                          require: false,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: Constant.SMALL_PADDING,
                                      ),
                                      Flexible(
                                        flex: 6,
                                        child: CoustomTextField(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal:
                                                      Constant.SMALL_PADDING,
                                                  vertical:
                                                      Constant.MEDIUM_PADDING),
                                          keyboardType: TextInputType.number,
                                          fontWeight: FontWeight.w400,
                                          fontSize: AppTheme.small,
                                          labelText: 'Quantity',
                                          hintColor: AppTheme.colorGray,
                                          borderEnableColors:
                                              AppTheme.textfieldbordercolor,
                                          borderFocusColors:
                                              AppTheme.textfieldbordercolor,
                                          textEditingController:
                                              newOrderController.quantityCtrl,
                                          onTextValidator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please Enter Quantity';
                                            } else if (value == '0') {
                                              return 'Please Enter valid Quantity';
                                            } else {
                                              return null;
                                            }
                                          },
                                          // onChanged: (value) =>
                                          //     controller.updateList(value),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: Constant.SMALL_PADDING,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: InputTitleRequire(
                                          title: 'Scheme:',
                                          require: false,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: Constant.SMALL_PADDING,
                                      ),
                                      Flexible(
                                        flex: 6,
                                        child: CoustomTextField(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal:
                                                      Constant.SMALL_PADDING,
                                                  vertical:
                                                      Constant.MEDIUM_PADDING),
                                          suffixIcon: TextButton(
                                            child: CustomText(
                                              title: 'Help',
                                              colors: AppTheme.colorPrimary,
                                            ),
                                            onPressed: () async {
                                              var result = await Get.toNamed(
                                                  AppRoutes.SELECTSCHEME);
                                              if (result != null) {
                                                newOrderController
                                                    .schemeCtrl.text = result;
                                                newOrderController.update();
                                              }
                                            },
                                          ),
                                          fontWeight: FontWeight.w400,
                                          fontSize: AppTheme.small,
                                          labelText: 'Scheme',
                                          hintColor: AppTheme.colorGray,
                                          borderEnableColors:
                                              AppTheme.textfieldbordercolor,
                                          borderFocusColors:
                                              AppTheme.textfieldbordercolor,
                                          textEditingController:
                                              newOrderController.schemeCtrl,
                                          onTextValidator: (value) {},
                                          // onChanged: (value) =>
                                          //     controller.updateList(value),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: Constant.SMALL_PADDING,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: InputTitleRequire(
                                          title: 'Distributor:',
                                          require: false,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: Constant.SMALL_PADDING,
                                      ),
                                      Flexible(
                                        flex: 6,
                                        child: DropdownButtonHideUnderline(
                                          child: ButtonTheme(
                                            alignedDropdown: true,
                                            child: DropdownButtonFormField(
                                                value: newOrderController
                                                    .dropDownValue,
                                                isDense: true,
                                                isExpanded: true,
                                                hint: CustomText(
                                                  title: 'Select',
                                                  colors: AppTheme.colorPrimary,
                                                ),
                                                borderRadius: BorderRadius
                                                    .circular(Constant
                                                        .LIST_TILE_ROUNDED_CORNER),
                                                focusColor: AppTheme.colorBlack,
                                                decoration: InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: AppTheme
                                                              .textfieldbordercolor),
                                                      borderRadius: BorderRadius
                                                          .circular(Constant
                                                              .LIST_TILE_ROUNDED_CORNER),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: AppTheme
                                                              .textfieldbordercolor),
                                                      borderRadius: BorderRadius
                                                          .circular(Constant
                                                              .LIST_TILE_ROUNDED_CORNER),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: AppTheme
                                                              .textfieldbordercolor),
                                                      borderRadius: BorderRadius
                                                          .circular(Constant
                                                              .LIST_TILE_ROUNDED_CORNER),
                                                    ),
                                                    isDense: true,
                                                    focusColor: AppTheme
                                                        .colorBlack,
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                      vertical: Constant
                                                          .SMALL_PADDING,
                                                      //horizontal: Constant
                                                      //  .VERY_SMALL_PADDING
                                                    )),
                                                items: newOrderController
                                                    .distributorlist
                                                    .map<DropdownMenuItem>(
                                                        (item) {
                                                  return DropdownMenuItem(
                                                    value: item.did,
                                                    child: CustomText(
                                                      textAlign:
                                                          TextAlign.start,
                                                      title: item.dnm,
                                                      colors:
                                                          AppTheme.colorPrimary,
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (value) {
                                                  newOrderController
                                                      .dropDownValue = value;
                                                  newOrderController.update();
                                                }),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: Constant.LARGE_PADDING,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GradientButton(
                                          endColor: AppTheme.bgGradiontStart,
                                          startColor: AppTheme.bgGradiontend,
                                          height: Constant.BTN_HEIGHT,
                                          width: Constant.BTN_WIDTH,
                                          onTap: () async {
                                            bool ok = newOrderController
                                                .ssdkey.currentState!
                                                .validate();
                                            if (ok) {
                                              newOrderController.addOrder();
                                            }
                                          },
                                          child: CustomText(
                                            textAlign: TextAlign.start,
                                            title: Strings.add.toUpperCase(),
                                            fontSize: AppTheme.medium,
                                            colors: Colors.white,
                                            //fontWeight: FontWeight.w600,
                                          )),
                                      GradientButton(
                                          endColor: AppTheme.bgGradiontStart,
                                          startColor: AppTheme.bgGradiontend,
                                          height: Constant.BTN_HEIGHT,
                                          width: Constant.BTN_WIDTH,
                                          onTap: () async {
                                            if (newOrderController
                                                .orderList.isEmpty) {
                                              errorDialog(
                                                  "Plese add atleast 1 Product");
                                              return;
                                            }
                                            newOrderController.isSubmitTaped =
                                                true;
                                            newOrderController.getJsonPrdList();
                                            newOrderController.update();
                                          },
                                          child: CustomText(
                                            textAlign: TextAlign.start,
                                            title: Strings.submit.toUpperCase(),
                                            fontSize: AppTheme.medium,
                                            colors: Colors.white,
                                            //fontWeight: FontWeight.w600,
                                          )),
                                    ],
                                  ),
                                ],
                              ))
                          : Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: InputTitleRequire(
                                        title: 'Order Date:',
                                        require: false,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: Constant.SMALL_PADDING,
                                    ),
                                    Flexible(
                                      flex: 6,
                                      child: CoustomTextField(
                                        readOnly: true,
                                        labelText: newOrderController.dateFormat
                                            .format(
                                                newOrderController.orderDate),
                                        onTextValidator: (_) {},
                                        textEditingController:
                                            newOrderController.orderDateCtrl,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal:
                                                    Constant.SMALL_PADDING,
                                                vertical:
                                                    Constant.MEDIUM_PADDING),
                                        fontSize: AppTheme.medium,
                                        hintColor: AppTheme.colorGray,
                                        borderEnableColors:
                                            AppTheme.textfieldbordercolor,
                                        borderFocusColors:
                                            AppTheme.textfieldbordercolor,
                                        onTextFiledOnTap: () {
                                          selectDate(
                                              context,
                                              Strings.orderDate,
                                              newOrderController.orderDate,
                                              DateTime(
                                                  DateTime.now().year + 10));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: Constant.SMALL_PADDING,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: InputTitleRequire(
                                        title: 'Delivery Date:',
                                        require: false,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: Constant.SMALL_PADDING,
                                    ),
                                    Flexible(
                                      flex: 6,
                                      child: CoustomTextField(
                                        readOnly: true,

                                        labelText: newOrderController.dateFormat
                                            .format(newOrderController
                                                .deliveryDate),

                                        onTextValidator: (_) {},
                                        textEditingController:
                                            newOrderController.deliveryDateCtrl,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal:
                                                    Constant.SMALL_PADDING,
                                                vertical:
                                                    Constant.MEDIUM_PADDING),
                                        fontSize: AppTheme.medium,
                                        hintColor: AppTheme.colorGray,
                                        borderEnableColors:
                                            AppTheme.textfieldbordercolor,
                                        borderFocusColors:
                                            AppTheme.textfieldbordercolor,
                                        onTextFiledOnTap: () {
                                          selectDate(
                                              context,
                                              Strings.deliveryDate,
                                              newOrderController.deliveryDate,
                                              DateTime(
                                                  DateTime.now().year + 10));
                                        },
                                        // onChanged: (value) =>
                                        //     controller.updateList(value),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: Constant.SMALL_PADDING,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: InputTitleRequire(
                                        title: 'Remarks',
                                        require: false,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: Constant.SMALL_PADDING,
                                    ),
                                    Flexible(
                                      flex: 6,
                                      child: CoustomTextField(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal:
                                                    Constant.SMALL_PADDING,
                                                vertical:
                                                    Constant.MEDIUM_PADDING),

                                        fontSize: AppTheme.medium,
                                        labelText: 'Remarks',
                                        hintColor: AppTheme.colorGray,
                                        borderEnableColors:
                                            AppTheme.textfieldbordercolor,
                                        borderFocusColors:
                                            AppTheme.textfieldbordercolor,
                                        textEditingController:
                                            newOrderController.remarksCtrl,
                                        onTextValidator: (value) {},
                                        // onChanged: (value) =>
                                        //     controller.updateList(value),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: Constant.LARGE_PADDING,
                                ),
                                GradientButton(
                                    endColor: AppTheme.bgGradiontStart,
                                    startColor: AppTheme.bgGradiontend,
                                    height: Constant.BTN_HEIGHT,
                                    width: Constant.BTN_WIDTH,
                                    onTap: () async {
                                      await newOrderController.getJsonPrdList();
                                      if (newOrderController.type == 0) {
                                        newOrderController.submitNewOrder();
                                      } else if (newOrderController.type == 1) {
                                        newOrderController.editOrder();
                                      }
                                    },
                                    child: CustomText(
                                      textAlign: TextAlign.start,
                                      title: 'SEND',
                                      fontSize: AppTheme.medium,
                                      colors: Colors.white,
                                      //fontWeight: FontWeight.w600,
                                    )),
                              ],
                            ),
                    ),
                    const SizedBox(
                      height: Constant.LARGE_PADDING,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Constant.MEDIUM_PADDING),
                      child: StaggeredGridView.countBuilder(
                          // controller: inquiryListController.controller,
                          crossAxisCount: 1,
                          crossAxisSpacing: Constant.SMALL_PADDING,
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          mainAxisSpacing: Constant.SMALL_PADDING,
                          itemCount: newOrderController.orderList.length,
                          staggeredTileBuilder: (index) {
                            return const StaggeredTile.fit(1);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            Order item = newOrderController.orderList[index];
                            return Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppTheme.colorPrimary,
                                        borderRadius: BorderRadius.circular(
                                            Constant.ROUNDED_CORNER),
                                        boxShadow: [
                                          BoxShadow(
                                              offset: const Offset(0, 2),
                                              blurRadius: 8,
                                              spreadRadius: 1,
                                              color: AppTheme.colorGray
                                                  .withOpacity(.5))
                                        ]),
                                  ),
                                ),
                                SwipeActionCell(
                                    key: key,
                                    isDraggable: true,
                                    firstActionWillCoverAllSpaceOnDeleting:
                                        false,
                                    backgroundColor: AppTheme.colorTransparent,
                                    trailingActions: <SwipeAction>[
                                      SwipeAction(
                                        widthSpace: 30,
                                        forceAlignmentToBoundary: false,
                                        performsFirstActionWithFullSwipe: false,
                                        icon: SvgPicture.asset(
                                          deleteSvg,
                                          height: Constant.SVG_ICON_SIZE - 5,
                                          width: Constant.SVG_ICON_SIZE - 5,
                                          fit: BoxFit.fill,
                                          color: AppTheme.colorWhite,
                                        ),
                                        onTap:
                                            (CompletionHandler handler) async {
                                          newOrderController.orderList
                                              .remove(item);
                                          newOrderController.update();
                                        },
                                        backgroundRadius: 0,
                                        color: AppTheme.colorTransparent,
                                      ),
                                    ],
                                    child: OrderListItem(
                                      index: index,
                                      item: item,
                                    )),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            ProgressBar(isLoader: newOrderController.isLoading)
          ],
        );
      }),
    );
  }

  _appbar() {
    return DynamicAppBar(
      'New Order',
      '',
      AppTheme.colorWhite,
      false,
      () => Get.back(),
      [],
      fontColors: AppTheme.titleDark,
      fontWeight: FontWeight.w400, title2: '',
    );
  }

  Future<void> selectDate(
    BuildContext context,
    String identity,
    DateTime firstDate,
    DateTime lastDate,
  ) async {
    DateTime? selectedDate;
    if (identity == Strings.orderDate) {
      if (newOrderController.orderDate != null) {
        selectedDate = newOrderController.orderDate;
      } else {
        selectedDate = DateTime.now();
      }
    }

    if (identity == Strings.deliveryDate) {
      if (newOrderController.deliveryDate != null) {
        selectedDate = newOrderController.deliveryDate;
      } else {
        selectedDate = newOrderController.deliveryDate;
      }
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate!,
      firstDate: firstDate,
      lastDate: lastDate,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (BuildContext? context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppTheme.colorPrimary,
            colorScheme: ColorScheme.light(primary: AppTheme.colorPrimary),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      if (identity == Strings.orderDate) {
        newOrderController.orderDate = picked;
        newOrderController.orderDateCtrl.text =
            newOrderController.dateFormat.format(picked);
      }
      if (identity == Strings.deliveryDate) {
        newOrderController.deliveryDate = picked;
        newOrderController.deliveryDateCtrl.text =
            newOrderController.dateFormat.format(picked);
      }

      newOrderController.update();
    }
  }
}

class OrderListItem extends StatelessWidget {
  int index;
  Order item;

  OrderListItem({Key? key, required this.index, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: AppTheme.colorWhite,
          borderRadius:
              BorderRadius.all(Radius.circular(Constant.ROUNDED_CORNER))),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: 0,
            child: Container(
              height: 42,
              width: 2,
              decoration: BoxDecoration(
                  color: AppTheme.colorPrimary,
                  borderRadius: const BorderRadius.all(Radius.circular(2))),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Constant.SMALL_PADDING),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                itemRow('Product : ', '#${item.productId} ', item.productName),
                itemRow('Quantity : ', '', item.quantity),
                itemRow('Distributor : ', '', item.distributor)
              ],
            ),
          )
        ],
      ),
    );
  }

  itemRow(String title, String? data1, String? data2) {
    return Padding(
        padding: const EdgeInsets.all(Constant.VERY_SMALL_PADDING),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              textAlign: TextAlign.start,
              title: title,
              colors: AppTheme.titleDark,
            ),
            Flexible(
                flex: 5,
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: AppTheme.colorDisableGray),
                        children: [
                      TextSpan(
                          text: data1,
                          style: TextStyle(color: AppTheme.colorPrimary)),
                      TextSpan(text: data2)
                    ])))
          ],
        ));
  }
}
