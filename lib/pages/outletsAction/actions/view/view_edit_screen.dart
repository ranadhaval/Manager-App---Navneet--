import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managerapp/pages/add_mcc_retailer.dart/Model/image_detail/image_detail_model.dart';
import 'package:managerapp/pages/outletsAction/actions/view/view_edit_controller.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/Permissions.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/widgets/Bottom_button.dart';
import 'package:managerapp/widgets/coustom_text.dart';
import 'package:managerapp/widgets/delete_dialoge.dart';
import 'package:managerapp/widgets/dynamic_appbar.dart';
import 'package:managerapp/widgets/file_selection_dialoge.dart';
import 'package:managerapp/widgets/gradient_button.dart';
import 'package:managerapp/widgets/input_textfield.dart';
import 'package:managerapp/widgets/progress_bar.dart';
import 'package:managerapp/widgets/title_widge.dart';

class ViewEditAction extends StatefulWidget {
  const ViewEditAction({super.key});

  @override
  State<ViewEditAction> createState() => _ViewEditActionState();
}

class _ViewEditActionState extends State<ViewEditAction>
    with WidgetsBindingObserver
    implements DeletAction {
  final viewEditActionController = Get.put(ViewEditActionController());
  //final uploadImageController = Get.put(UploadImageController());

  @override
  void deleteAction({String? id, File? file}) {
    viewEditActionController.isDeleteOrUpdateApiCalled = true;
    if (id != null) {
      if (viewEditActionController.imageTypeId == 1) {
        viewEditActionController.shopImages!
            .removeWhere((element) => element.imgId == id);
      } else if (viewEditActionController.imageTypeId == 2) {
        viewEditActionController.visitingCardImages!
            .removeWhere((element) => element.imgId == id);
      } else if (viewEditActionController.imageTypeId == 3) {
        viewEditActionController.logoImages!
            .removeWhere((element) => element.imgId == id);
      }
    }
    viewEditActionController.update();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: GetBuilder<ViewEditActionController>(builder: ((controller) {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: AppTheme.colorWhite,
              appBar: _appbar(),
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: Constant.MEDIUM_PADDING,
                        vertical: Constant.LARGE_PADDING),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Constant.MEDIUM_PADDING,
                              horizontal: Constant.VERY_SMALL_PADDING + 2,
                            ),
                            margin: const EdgeInsets.symmetric(
                              vertical: Constant.VERY_SMALL_PADDING,
                              horizontal: Constant.VERY_SMALL_PADDING - 2,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Constant.LIST_TILE_ROUNDED_CORNER),
                                color: AppTheme.colorWhite,
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 2),
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                      color: AppTheme.colorGray.withOpacity(.5))
                                ]),
                            child: CustomText(
                              textAlign: TextAlign.start,
                              title: viewEditActionController.rtname,
                              colors: AppTheme.colorPrimary,
                              fontWeight: FontWeight.w500,
                              fontSize: AppTheme.medium_1,
                            ),
                          ),
                          Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: Constant.MEDIUM_PADDING,
                                ),
                                CustomText(
                                  title: 'Retailer Detail',
                                  textAlign: TextAlign.start,
                                  colors: AppTheme.colorPrimary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppTheme.medium_1,
                                ),
                                formrowwithtextfield(
                                    "Outlet Name", true, (value) {}, (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Outlet Name';
                                  } else {
                                    return null;
                                  }
                                }, viewEditActionController.outnameCtrl,
                                    viewEditActionController.readOnly),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: Constant.VERY_SMALL_PADDING),
                                  child: GestureDetector(
                                    onTap: () {
                                      viewEditActionController.readOnly =
                                          !viewEditActionController.readOnly;
                                      viewEditActionController.update();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        checkBoxView(
                                            !viewEditActionController.readOnly),
                                        const SizedBox(
                                          width: Constant.SMALL_PADDING,
                                        ),
                                        CustomText(
                                          title: 'Change Outlet Name',
                                          colors: AppTheme.titleDark,
                                          fontSize: AppTheme.medium,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                formrowwithtextfield(
                                    "Address1", true, (value) {}, (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Address1';
                                  } else {
                                    return null;
                                  }
                                }, viewEditActionController.addres1Ctrl, false),
                                formrowwithtextfield(
                                    "Address2", true, (value) {}, (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Address2';
                                  } else {
                                    return null;
                                  }
                                }, viewEditActionController.addres2Ctrl, false),
                                formrowwithtextfield("Area", true, (value) {},
                                    (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Address2';
                                  } else {
                                    return null;
                                  }
                                }, viewEditActionController.areaCtrl, false),
                                formrowwithdropdown(
                                    'Region',
                                    false,
                                    viewEditActionController
                                        .regionDropdownValue,
                                    viewEditActionController.regionList
                                        .map<DropdownMenuItem>((item) {
                                      return DropdownMenuItem(
                                        value: item.regioncode,
                                        child: CustomText(
                                          textAlign: TextAlign.start,
                                          title: item.regionname,
                                          colors: AppTheme.colorPrimary,
                                        ),
                                      );
                                    }).toList(), (value) {
                                  viewEditActionController.regionDropdownValue =
                                      value;
                                  viewEditActionController.update();
                                  viewEditActionController
                                      .getDistrictList(true);
                                },
                                    viewEditActionController
                                        .regionDropdownValue),
                                formrowwithdropdown(
                                    'District',
                                    false,
                                    viewEditActionController
                                        .districtDropdownValue,
                                    viewEditActionController.districtList
                                        .map<DropdownMenuItem>((item) {
                                      return DropdownMenuItem(
                                        value: item.districtcode,
                                        child: CustomText(
                                          textAlign: TextAlign.start,
                                          title: item.districtname,
                                          colors: AppTheme.colorPrimary,
                                        ),
                                      );
                                    }).toList(), (value) {
                                  viewEditActionController
                                      .districtDropdownValue = value;
                                  viewEditActionController.update();
                                  viewEditActionController.getCityList(true);
                                },
                                    viewEditActionController
                                        .districtDropdownValue),
                                formrowwithdropdown(
                                    'City',
                                    false,
                                    viewEditActionController.cityDropdownValue,
                                    viewEditActionController.cityList
                                        .map<DropdownMenuItem>((item) {
                                      return DropdownMenuItem(
                                        value: item.citycode,
                                        child: CustomText(
                                          textAlign: TextAlign.start,
                                          title: item.cityname,
                                          colors: AppTheme.colorPrimary,
                                        ),
                                      );
                                    }).toList(), (value) {
                                  viewEditActionController.cityDropdownValue =
                                      value;
                                  viewEditActionController.update();
                                }, viewEditActionController.cityDropdownValue),
                                formrowwithtextfield(
                                    "Pin Code", true, (value) {}, (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Address2';
                                  } else {
                                    return null;
                                  }
                                }, viewEditActionController.pincodeCtrl, false),
                                formrowwithdropdown(
                                    'Shop Type',
                                    true,
                                    viewEditActionController
                                        .shopTypeDropdownValue,
                                    viewEditActionController.shopTypeList
                                        .map<DropdownMenuItem>((item) {
                                      return DropdownMenuItem(
                                        value: item.shopTypeCode,
                                        child: CustomText(
                                          textAlign: TextAlign.start,
                                          title: item.shopType,
                                          colors: AppTheme.colorPrimary,
                                        ),
                                      );
                                    }).toList(), (value) {
                                  viewEditActionController
                                      .shopTypeDropdownValue = value;
                                  viewEditActionController.update();
                                },
                                    viewEditActionController
                                        .shopTypeDropdownValue),
                                formrowwithdropdown(
                                    'Listing Type',
                                    true,
                                    viewEditActionController
                                        .listingTypeDropdownValue,
                                    viewEditActionController.listingTypeList
                                        .map<DropdownMenuItem>((item) {
                                      return DropdownMenuItem(
                                        value: item.listingTypeCode,
                                        child: CustomText(
                                          textAlign: TextAlign.start,
                                          title: item.listingType,
                                          colors: AppTheme.colorPrimary,
                                        ),
                                      );
                                    }).toList(), (value) {
                                  viewEditActionController
                                      .listingTypeDropdownValue = value;
                                  viewEditActionController.update();
                                },
                                    viewEditActionController
                                        .listingTypeDropdownValue),
                                formrowwithdropdown(
                                    'Retailer Class',
                                    true,
                                    viewEditActionController.classDropdownValue,
                                    viewEditActionController.classList
                                        .map<DropdownMenuItem>((item) {
                                      return DropdownMenuItem(
                                        value: item.retailerclassid,
                                        child: CustomText(
                                          textAlign: TextAlign.start,
                                          title: item.retailerclassname,
                                          colors: AppTheme.colorPrimary,
                                        ),
                                      );
                                    }).toList(), (value) {
                                  viewEditActionController.classDropdownValue =
                                      value;
                                  viewEditActionController.update();
                                }, viewEditActionController.classDropdownValue),
                                const SizedBox(
                                  height: Constant.LARGE_PADDING,
                                ),
                                CustomText(
                                  title: 'Contact Detail',
                                  textAlign: TextAlign.start,
                                  colors: AppTheme.colorPrimary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppTheme.medium_1,
                                ),
                                formrowwithtextfield(
                                    "Contact Person", true, (value) {},
                                    (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Contact Person';
                                  } else {
                                    return null;
                                  }
                                }, viewEditActionController.contactPersonCtrl,
                                    false),
                                formrowwithdropdown(
                                    'Contact Person Designation',
                                    true,
                                    viewEditActionController
                                        .designationDropdownValue,
                                    viewEditActionController.designationList
                                        .map<DropdownMenuItem>((item) {
                                      return DropdownMenuItem(
                                        value: item.contactDesigCode,
                                        child: CustomText(
                                          textAlign: TextAlign.start,
                                          title: item.contactDesig,
                                          colors: AppTheme.colorPrimary,
                                        ),
                                      );
                                    }).toList(), (value) {
                                  viewEditActionController
                                      .designationDropdownValue = value;
                                  viewEditActionController.update();
                                },
                                    viewEditActionController
                                        .designationDropdownValue),
                                formrowwithtextfield(
                                    "Mobile 1/WhatsApp", true, (value) {},
                                    (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter WhatsApp No.';
                                  } else {
                                    return null;
                                  }
                                }, viewEditActionController.whatsappCtrl,
                                    false),
                                formrowwithtextfield(
                                    "Mobile 2", false, (value) {}, (value) {
                                  return null;
                                }, viewEditActionController.mobile2Ctrl, false),
                                formrowwithtextfield(
                                    "Telephone", false, (value) {}, (value) {
                                  return null;
                                }, viewEditActionController.telephoneCtrl,
                                    false),
                                formrowwithtextfield(
                                    "Contact Email", false, (value) {},
                                    (value) {
                                  return null;
                                }, viewEditActionController.emailCtrl, false),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: Constant.VERY_SMALL_PADDING),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: InputTitleRequire(
                                          title: 'Birth Date:',
                                          require: false,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: Constant.SMALL_PADDING,
                                      ),
                                      Flexible(
                                        flex: 5,
                                        child: CoustomTextField(
                                          readOnly: true,
                                          labelText: 'DD/MM/YYYY',
                                          onTextValidator: (value) {
                                            return null;
                                          },
                                          textEditingController:
                                              viewEditActionController
                                                  .birthDateCtrl,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal:
                                                      Constant.SMALL_PADDING,
                                                  vertical:
                                                      Constant.MEDIUM_PADDING),
                                          fontWeight: FontWeight.w400,
                                          fontSize: AppTheme.medium,
                                          hintColor: AppTheme.colorGray,
                                          borderEnableColors:
                                              AppTheme.textfieldbordercolor,
                                          borderFocusColors:
                                              AppTheme.textfieldbordercolor,
                                          onTextFiledOnTap: () {
                                            selectDate(
                                                context,
                                                Strings.birthDate,
                                                DateTime(
                                                    DateTime.now().year - 100),
                                                DateTime.now());
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: Constant.VERY_SMALL_PADDING),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: InputTitleRequire(
                                          title: 'Marriage Date:',
                                          require: false,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: Constant.SMALL_PADDING,
                                      ),
                                      Flexible(
                                        flex: 5,
                                        child: CoustomTextField(
                                          readOnly: true,
                                          labelText: 'DD/MM/YYYY',
                                          onTextValidator: (value) {
                                            return null;
                                          },
                                          textEditingController:
                                              viewEditActionController
                                                  .mrgDatecodeCtrl,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal:
                                                      Constant.SMALL_PADDING,
                                                  vertical:
                                                      Constant.MEDIUM_PADDING),
                                          fontWeight: FontWeight.w400,
                                          fontSize: AppTheme.medium,
                                          hintColor: AppTheme.colorGray,
                                          borderEnableColors:
                                              AppTheme.textfieldbordercolor,
                                          borderFocusColors:
                                              AppTheme.textfieldbordercolor,
                                          onTextFiledOnTap: () {
                                            selectDate(
                                                context,
                                                Strings.mrgDate,
                                                DateTime(
                                                    DateTime.now().year - 100),
                                                DateTime.now());
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: Constant.LARGE_PADDING,
                                ),
                                CustomText(
                                  title: 'Location Detail',
                                  textAlign: TextAlign.start,
                                  colors: AppTheme.colorPrimary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppTheme.medium_1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: Constant.VERY_SMALL_PADDING),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              title:
                                                  'Latitude:${viewEditActionController.latitude}',
                                              textAlign: TextAlign.start,
                                              colors: AppTheme.titleDark,
                                              fontSize: AppTheme.medium,
                                            ),
                                            CustomText(
                                              title:
                                                  'Longitude:${viewEditActionController.longitude}',
                                              textAlign: TextAlign.start,
                                              colors: AppTheme.titleDark,
                                              fontSize: AppTheme.medium,
                                            ),
                                          ],
                                        ),
                                        GradientButton(
                                            endColor: AppTheme.bgGradiontStart,
                                            startColor: AppTheme.bgGradiontend,
                                            height: Constant.BTN_HEIGHT - 10,
                                            width: Constant.BTN_WIDTH,
                                            onTap: () async {},
                                            topPadding: Constant.SMALL_PADDING,
                                            child: CustomText(
                                              textAlign: TextAlign.start,
                                              title: 'Update Location',
                                              fontSize: AppTheme.small,
                                              colors: Colors.white,
                                              //fontWeight: FontWeight.w600,
                                            )),
                                      ]),
                                ),
                                const SizedBox(
                                  height: Constant.LARGE_PADDING,
                                ),
                                CustomText(
                                  title: 'Shop Images',
                                  textAlign: TextAlign.start,
                                  colors: AppTheme.colorPrimary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppTheme.medium_1,
                                ),
                                imageView(
                                    viewEditActionController.shopImages, 1),
                                const SizedBox(
                                  height: Constant.LARGE_PADDING,
                                ),
                                CustomText(
                                  title: 'Visiting Card Images',
                                  textAlign: TextAlign.start,
                                  colors: AppTheme.colorPrimary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppTheme.medium_1,
                                ),
                                imageView(
                                    viewEditActionController.visitingCardImages,
                                    2),
                                const SizedBox(
                                  height: Constant.LARGE_PADDING,
                                ),
                                CustomText(
                                  title: 'Retailer Logo Images',
                                  textAlign: TextAlign.start,
                                  colors: AppTheme.colorPrimary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppTheme.medium_1,
                                ),
                                imageView(
                                    viewEditActionController.logoImages, 3),
                                const SizedBox(
                                  height: Constant.BTM_BTN_PADDING,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BottomCardButton(
                      height: 60,
                      title: Strings.submit,
                      onTap: () {
                        validateForm();
                      }),
                ],
              ),
            ),
            ProgressBar(isLoader: viewEditActionController.isLoading),
          ],
        );
      })),
    );
  }

  imageView(List<ImgDetail>? imageList, int id) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 2),
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 3,
                  spreadRadius: 1,
                  color: AppTheme.colorGray.withOpacity(.5))
            ]),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            for (int i = 0; i <= imageList!.length; i++)
              InkWell(
                onTap: () async {
                  viewEditActionController.imageTypeId = id;
                  viewEditActionController.update();
                  if (i == imageList.length) {
                    bool permission =
                        await PermissionService().cameraAndStoragePermission();
                    if (permission) {
                      List<File> selected = await showDialog(
                          context: context,
                          builder: (s) {
                            return Diloagbox();
                          });
                      if (selected != null && selected.isNotEmpty) {
                        viewEditActionController.isImageAdded = true;
                        if (viewEditActionController.imageTypeId == 1) {
                          viewEditActionController.shopImages!
                              .addAll(selected.map<ImgDetail>((e) {
                            return ImgDetail(
                                isFileLocal: true, file: e, filepath: e.path);
                          }));
                        } else if (viewEditActionController.imageTypeId == 2) {
                          viewEditActionController.visitingCardImages!
                              .addAll(selected.map<ImgDetail>((e) {
                            return ImgDetail(
                                isFileLocal: true, file: e, filepath: e.path);
                          }));
                        } else if (viewEditActionController.imageTypeId == 3) {
                          viewEditActionController.logoImages!
                              .addAll(selected.map<ImgDetail>((e) {
                            return ImgDetail(
                                isFileLocal: true, file: e, filepath: e.path);
                          }));
                        }
                      }

                      viewEditActionController.update();
                    }
                  } else {
                    dialogebox(imageList, i);
                  }
                },
                child: i == imageList.length
                    ? Align(
                        widthFactor: 0.5,
                        child: CircleAvatar(
                            backgroundColor: AppTheme.colorWhite,
                            radius: 22,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: AppTheme.colorPrimary,
                              child: const Icon(
                                Icons.add,
                                color: AppTheme.colorWhite,
                              ),
                            )))
                    : Align(
                        widthFactor: 0.5,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 22,
                          child: CircleAvatar(
                            backgroundImage: (imageList[i].isFileLocal ?? false)
                                ? FileImage(imageList[i].file as File)
                                    as ImageProvider
                                : NetworkImage(imageList[i].imagepath!),
                          ),
                        )),
              ),
          ],
        ),
      ),
    );
  }

  Future dialogebox(List<ImgDetail> list, int index) async {
    await showDialog(
      context: context,
      builder: (context) {
        return DeleteDialog(
          isDetailImage: true,
          // lstimage: [],
          simpleImageList: [],
          detailImageList: list,
          deleteController: deleteController,
          deletAction: this,
          index: index,
        );
      },
    );
  }

  Future<void> selectDate(
    BuildContext context,
    String identity,
    DateTime firstDate,
    DateTime lastDate,
  ) async {
    DateTime? selectedDate;
    if (identity == Strings.birthDate) {
      if (viewEditActionController.birthDate != null) {
        selectedDate = viewEditActionController.birthDate;
      } else {
        selectedDate = DateTime.now();
      }
    }

    if (identity == Strings.mrgDate) {
      if (viewEditActionController.mrgDate != null) {
        selectedDate = viewEditActionController.mrgDate;
      } else {
        selectedDate = DateTime.now();
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
      if (identity == Strings.birthDate) {
        viewEditActionController.birthDate = picked;
        viewEditActionController.birthDateCtrl.text =
            viewEditActionController.dateFormat.format(picked);
      }
      if (identity == Strings.mrgDate) {
        viewEditActionController.mrgDate = picked;
        viewEditActionController.mrgDatecodeCtrl.text =
            viewEditActionController.dateFormat.format(picked);
      }

      viewEditActionController.update();
    }
  }

  formrowwithtextfield(
      String title,
      bool required,
      Function(String)? onChanged,
      String? Function(String?)? onTextValidator,
      TextEditingController ctrl,
      bool readOnly) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Constant.VERY_SMALL_PADDING),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: InputTitleRequire(
              title: "$title:",
              require: required,
            ),
          ),
          const SizedBox(
            width: Constant.SMALL_PADDING,
          ),
          Flexible(
            flex: 5,
            child: CoustomTextField(
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: Constant.SMALL_PADDING,
                  vertical: Constant.MEDIUM_PADDING),
              fontWeight: FontWeight.w400,
              fontSize: AppTheme.medium,
              labelText: title,
              hintColor: AppTheme.colorGray,
              borderEnableColors: AppTheme.textfieldbordercolor,
              borderFocusColors: AppTheme.textfieldbordercolor,
              textEditingController: ctrl,
              readOnly: readOnly,
              onTextValidator: onTextValidator,
              onChanged: onChanged,
            ),
          )
        ],
      ),
    );
  }

  formrowwithdropdown(
    String title,
    bool required,
    String dropDownValue,
    List<DropdownMenuItem>? items,
    void Function(dynamic)? onChanged,
    Object? value,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Constant.VERY_SMALL_PADDING),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: InputTitleRequire(
              title: "$title:",
              require: required,
            ),
          ),
          const SizedBox(
            width: Constant.SMALL_PADDING,
          ),
          Flexible(
            flex: 5,
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButtonFormField(
                    value: value,
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
                          borderSide:
                              BorderSide(color: AppTheme.textfieldbordercolor),
                          borderRadius: BorderRadius.circular(
                              Constant.LIST_TILE_ROUNDED_CORNER),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppTheme.textfieldbordercolor),
                          borderRadius: BorderRadius.circular(
                              Constant.LIST_TILE_ROUNDED_CORNER),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppTheme.textfieldbordercolor),
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
                    items: items,
                    onChanged: onChanged),
              ),
            ),
          ),
        ],
      ),
    );
  }

  checkBoxView(bool selected) {
    return Container(
      height: 20,
      width: 20,
      //margin: const EdgeInsets.only(left: Constant.SMALL_PADDING),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.colorPrimary),
        borderRadius: BorderRadius.circular(20),
      ),
      child: selected
          ? Icon(
              Icons.done,
              color: AppTheme.colorPrimary,
              size: 15,
            )
          : null,
    );
  }

  _appbar() {
    return DynamicAppBar(
      'View / Edit',
      '',
      AppTheme.colorWhite,
      false,
      () =>
          Get.back(result: viewEditActionController.isDeleteOrUpdateApiCalled),
      const [],
      fontColors: AppTheme.titleDark,
      fontWeight: FontWeight.w400,
      title2: ' Outlet Detail',
    );
  }

  validateForm() {
    List<String> localImageShop = [];
    List<String> localImageVisit = [];
    List<String> localImageLogo = [];
    if (viewEditActionController.isImageAdded) {
      print(viewEditActionController.addres2Ctrl);
      viewEditActionController.shopImages!.forEach((element) {
        if (element.isFileLocal == true &&
            element.filepath != null &&
            element.filepath!.isNotEmpty) {
          localImageShop.add(element.filepath!);
        }
      });
      if (localImageShop != null && localImageShop.isNotEmpty) {
        viewEditActionController.fileUpload(localImageShop, "SHOP");
      }

      viewEditActionController.logoImages!.forEach((element) {
        if (element.isFileLocal == true &&
            element.filepath != null &&
            element.filepath!.isNotEmpty) {
          localImageLogo.add(element.filepath!);
        }
      });
      if (localImageLogo != null && localImageLogo.isNotEmpty) {
        viewEditActionController.fileUpload(localImageLogo, "Retailer_Logo");
      }
      viewEditActionController.visitingCardImages!.forEach((element) {
        if (element.isFileLocal == true &&
            element.filepath != null &&
            element.filepath!.isNotEmpty) {
          localImageVisit.add(element.filepath!);
        }
      });
      if (localImageVisit != null && localImageVisit.isNotEmpty) {
        viewEditActionController.fileUpload(localImageVisit, "VISITCARD");
      }
    }
    viewEditActionController.submitData();
  }
}
