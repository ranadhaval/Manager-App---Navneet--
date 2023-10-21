import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:managerapp/pages/add_mcc_retailer.dart/Model/image_detail/image_detail_model.dart';
import 'package:managerapp/pages/add_mcc_retailer.dart/add_mcc_retailer_controller.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/Permissions.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/resources.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/util/utils.dart';
import 'package:managerapp/widgets/Bottom_button.dart';
import 'package:managerapp/widgets/dynamic_appbar.dart';
import 'package:managerapp/widgets/file_selection_dialoge.dart';
import 'package:managerapp/widgets/input_textfield.dart';
import 'package:managerapp/widgets/progress_bar.dart';

class AddMccRetailer extends StatefulWidget {
  const AddMccRetailer({key});

  @override
  State<AddMccRetailer> createState() => _AddMccRetailerState();
}

class _AddMccRetailerState extends State<AddMccRetailer> {
  final TextEditingController mccDate = TextEditingController();
  final addMccRetailerController = Get.put(AddMccRetailerController());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: addMccRetailerController.key,
      child: GetBuilder(
          init: addMccRetailerController,
          builder: (contex) {
            return Scaffold(
                appBar: _appbar(),
                body: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: Constant.addMccBodyPadding,
                        right: Constant.addMccBodyPadding,
                        left: Constant.addMccBodyPadding),
                    child: SingleChildScrollView(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(
                                      Constant.basicInformationPadding),
                                  child: Text(
                                    Strings.basicInformation,
                                    style: TextStyle(
                                        color: AppTheme.colorPrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            Constant.basicInformationTextSize),
                                  ),
                                ),
                              ],
                            ),
                            formContent(
                              title: Strings.mccDate,
                              textInputType: TextInputType.number,
                              controller: addMccRetailerController.mccDate,
                              onTextFiledOnTap: () async {
                                addMccRetailerController.mccDate.text =
                                    DateFormat(Strings.dateFormate)
                                        .format(await Utils.getdate(context));
                                addMccRetailerController.update();
                              },
                              showCursor: false,
                              readOnly: true,
                            ),
                            formContent(
                              title: Strings.numberofPerson,
                              textInputType: TextInputType.number,
                              controller:
                                  addMccRetailerController.numberOfPerson,
                              showCursor: Constant.isTrue,
                              readOnly: Constant.isFalse,
                            ),
                            formContent(
                              title: Strings.numberofPersonPurchased,
                              textInputType: TextInputType.number,
                              controller: addMccRetailerController
                                  .numberOfPersonPurchased,
                              showCursor: Constant.isTrue,
                              readOnly: Constant.isFalse,
                            ),
                            formContent(
                              title: Strings.productCode,
                              textInputType: TextInputType.number,
                              controller: addMccRetailerController.productCode,
                              showCursor: Constant.isTrue,
                              readOnly: Constant.isFalse,
                            ),
                            formContent(
                              title: Strings.quantityPurchased,
                              textInputType: TextInputType.number,
                              controller:
                                  addMccRetailerController.quantityPurchased,
                              showCursor: Constant.isTrue,
                              readOnly: Constant.isFalse,
                            ),
                            formContent(
                              title: Strings.remark,
                              textInputType: TextInputType.text,
                              controller: addMccRetailerController.remark,
                              showCursor: Constant.isTrue,
                              readOnly: Constant.isFalse,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: Constant.uplaodTilePadding,
                                  left: Constant.uplaodTilePadding,
                                  bottom: Constant.uplaodTilePadding),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppTheme.uplaodTileColor,
                                    border: Border.all(
                                        color: AppTheme.uplaodTileBorderColor),
                                    borderRadius: BorderRadius.circular(
                                        Constant.uplaodTileBorderCorner)),
                                padding: const EdgeInsets.all(
                                    Constant.uplaodTileContentPadding),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    addMccRetailerController
                                            .fileimageList.isEmpty
                                        ? CircleAvatar(
                                            radius:
                                                Constant.defaultImageIconRadius,
                                            backgroundColor:
                                                AppTheme.colorWhite,
                                            child: SvgPicture.asset(
                                              imagelogo,
                                              width: Constant
                                                  .defaultImageIconWidth,
                                              height: Constant
                                                  .defaultImageIconHeight,
                                            ),
                                          )
                                        : Flexible(
                                            flex: Constant.THREE,
                                            child: Container(
                                              padding: const EdgeInsets
                                                      .symmetric(
                                                  horizontal: Constant
                                                      .circleImageCardPadding),
                                              height: Constant
                                                  .circleImageCardHeight,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                  color: AppTheme.colorWhite,
                                                  borderRadius: BorderRadius
                                                      .circular(Constant
                                                          .uplaodButtonCorner),
                                                  boxShadow: [
                                                    Constant.boxShadow(
                                                        AppTheme.colorBlack)
                                                  ]),
                                              child: ListView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                children: [
                                                  Constant.sizedBoxWidth10,
                                                  for (int i = Constant.zero;
                                                      i <=
                                                          addMccRetailerController
                                                              .fileImgs!.length;
                                                      i++)
                                                    InkWell(
                                                      onTap: () async {
                                                        addMccRetailerController
                                                            .update();
                                                        if (i ==
                                                            addMccRetailerController
                                                                .fileImgs!
                                                                .length) {
                                                          bool permission =
                                                              await PermissionService()
                                                                  .cameraAndStoragePermission();
                                                          if (permission) {
                                                            List<File>
                                                                selected =
                                                                // ignore: use_build_context_synchronously
                                                                await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (s) {
                                                                      return Diloagbox();
                                                                    });
                                                            // ignore: unnecessary_null_comparison
                                                            if (selected !=
                                                                    null &&
                                                                selected
                                                                    .isNotEmpty) {
                                                              addMccRetailerController
                                                                      .isImageAdded =
                                                                  true;

                                                              addMccRetailerController
                                                                  .fileImgs!
                                                                  .addAll(selected
                                                                      .map<ImgDetail>(
                                                                          (e) {
                                                                return ImgDetail(
                                                                    isFileLocal:
                                                                        true,
                                                                    file: e,
                                                                    filepath:
                                                                        e.path);
                                                              }));
                                                            }

                                                            addMccRetailerController
                                                                .update();
                                                          }
                                                        } else {}
                                                      },
                                                      child: i ==
                                                              addMccRetailerController
                                                                  .fileImgs!
                                                                  .length
                                                          ? Align(
                                                              widthFactor: Constant
                                                                  .circleImageWidthFactor,
                                                              child:
                                                                  CircleAvatar(
                                                                      backgroundColor:
                                                                          AppTheme
                                                                              .colorWhite,
                                                                      radius: Constant
                                                                          .circleImageRadius,
                                                                      child:
                                                                          CircleAvatar(
                                                                        radius:
                                                                            Constant.circleImageRadius2,
                                                                        backgroundColor:
                                                                            AppTheme.colorPrimary,
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .add,
                                                                          color:
                                                                              AppTheme.colorWhite,
                                                                        ),
                                                                      )))
                                                          : Align(
                                                              widthFactor: Constant
                                                                  .circleImageWidthFactor,
                                                              child:
                                                                  CircleAvatar(
                                                                backgroundColor:
                                                                    AppTheme
                                                                        .colorWhite,
                                                                radius: Constant
                                                                    .circleImageRadius,
                                                                child:
                                                                    CircleAvatar(
                                                                  radius: Constant
                                                                      .circleImageRadius2,
                                                                  backgroundImage: (addMccRetailerController
                                                                              .fileImgs![
                                                                                  i]
                                                                              .isFileLocal ??
                                                                          false)
                                                                      ? FileImage(addMccRetailerController.fileImgs![i].file
                                                                              as File)
                                                                          as ImageProvider
                                                                      : NetworkImage(addMccRetailerController
                                                                          .fileImgs![
                                                                              i]
                                                                          .imagepath!),
                                                                ),
                                                              )),
                                                    ),
                                                  Constant.sizedBoxWidth10
                                                ],
                                              ),
                                            ),
                                          ),
                                    Constant.sizedBoxWidth10,
                                    Flexible(
                                      flex: Constant.three,
                                      child: RichText(
                                        text: TextSpan(
                                            text: Strings.chooseImage,
                                            style: TextStyle(
                                                color: AppTheme.colorPrimary,
                                                fontSize: Constant
                                                    .imageUplaodTextSize),
                                            children: [
                                              TextSpan(
                                                  text: Strings.toUplaod,
                                                  style: TextStyle(
                                                      color:
                                                          AppTheme.colorBlack))
                                            ]),
                                      ),
                                    ),
                                    Constant.sizedBoxWidth20,
                                    addMccRetailerController
                                            .fileimageList.isEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              bool permission =
                                                  await PermissionService()
                                                      .cameraAndStoragePermission();
                                              if (permission) {
                                                List<File> selected =
                                                    // ignore: use_build_context_synchronously
                                                    await showDialog(
                                                        context: context,
                                                        builder: (s) {
                                                          return Diloagbox();
                                                        });

                                                // ignore: unnecessary_null_comparison
                                                if (selected != null &&
                                                    selected.isNotEmpty) {
                                                  addMccRetailerController
                                                      .isImageAdded = true;
                                                  addMccRetailerController
                                                      .fileImgs!
                                                      .addAll(selected
                                                          .map<ImgDetail>((e) {
                                                    return ImgDetail(
                                                        isFileLocal: true,
                                                        file: e,
                                                        filepath: e.path);
                                                  }));

                                                  addMccRetailerController
                                                      .fileimageList = selected;
                                                  addMccRetailerController
                                                      .update();
                                                }
                                              }
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  left: Constant
                                                      .uplaodButtonLeftPadding,
                                                  right: Constant
                                                      .uplaodButtonRightPadding,
                                                  top: Constant
                                                      .uplaodButtonTopPadding,
                                                  bottom: Constant
                                                      .uplaodButtonBottomPadding),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(Constant
                                                          .uplaodButtonBorderRadius),
                                                  gradient: LinearGradient(
                                                      colors: Constant
                                                          .uploadButtonColor)),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    arrowlogo,
                                                    width:
                                                        Constant.upArrowWidth,
                                                    height:
                                                        Constant.upArrowHeight,
                                                  ),
                                                  const SizedBox(
                                                    width: Constant.widthFour,
                                                  ),
                                                  const Text(
                                                    Strings.uplaod,
                                                    style: TextStyle(
                                                        color:
                                                            AppTheme.colorWhite,
                                                        fontSize: Constant
                                                            .uplaodButtonTextSize),
                                                  ),
                                                  const SizedBox(
                                                    width: Constant.widthTwo,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  ProgressBar(isLoader: addMccRetailerController.isLoading)
                ]),
                bottomSheet: InkWell(
                  onTap: () {
                    // print(addMccRetailerController.mccDate.toString());
                    List<String> imageList = [];
                    if (addMccRetailerController.isImageAdded) {
                      for (var element in addMccRetailerController.fileImgs!) {
                        if (element.isFileLocal == true &&
                            element.filepath != null &&
                            element.filepath!.isNotEmpty) {
                          imageList.add(element.filepath!);
                        }
                      }
                      // ignore: unnecessary_null_comparison
                      if (imageList != null && imageList.isNotEmpty) {
                        addMccRetailerController.fileUpload(
                            imageList, Strings.mccRetailer);
                      }
                    }
                  },
                  child: BottomButton(
                      leftPadding: Constant.bottomButtonLeftPadding,
                      rightPadding: Constant.bottomButtonRightPadding,
                      topPadding: Constant.bottomButtonTopPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            Strings.submit,
                            style: TextStyle(
                                color: AppTheme.colorWhite,
                                fontSize: Constant.bottomButtonTextSize),
                          ),
                        ],
                      )),
                ));
          }),
    );
  }

  Widget formContent(
      {required String title,
      required TextInputType textInputType,
      required TextEditingController controller,
      required bool readOnly,
      required bool showCursor,
      Function()? onTextFiledOnTap}) {
    return Padding(
      padding: const EdgeInsets.all(Constant.formConetntPadding),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width /
                Constant.formConetntTitleWidth,
            child: Text(
              '$title:',
              style: TextStyle(
                  color: AppTheme.titleDark,
                  fontWeight: FontWeight.w400,
                  fontSize: Constant.formConetntTextSize),
            ),
          ),
          Constant.sizedBoxWidth15,
          Expanded(
              child: InkWell(
            child: Container(
              padding: const EdgeInsets.only(
                  left: Constant.formConetntTextFieldLeftPadding),
              margin: const EdgeInsets.all(Constant.formConetntTextFieldMargin),
              child: CoustomTextField(
                textEditingController: controller,
                readOnly: readOnly,
                showCursor: showCursor,
                borderCorner: Constant.formConetntTextFieldCorner,
                fontSize: Constant.formConetntTextSize,
                textColor: AppTheme.colorBlack,
                keyboardType: textInputType,
                fontWeight: FontWeight.w400,
                contentPadding: const EdgeInsets.all(
                    Constant.formConetntTextFieldContentPadding),
                onTextValidator: (c) {
                  return null;
                },
                onTextFiledOnTap: onTextFiledOnTap,
                borderEnableColors: AppTheme.colorGrey,
                borderFocusColors: AppTheme.colorGray,
              ),
            ),
          )),
        ],
      ),
    );
  }

  _appbar() {
    return DynamicAppBar(
      '${Strings.add} ',
      Strings.emptyString,
      title2: Strings.mccRetailerText,
      AppTheme.colorWhite,
      false,
      () => Get.back(),
      const [],
      fontColors: AppTheme.titleDark,
      fontWeight: FontWeight.bold,
      fontColors2: AppTheme.colorPrimary,
    );
  }
}
