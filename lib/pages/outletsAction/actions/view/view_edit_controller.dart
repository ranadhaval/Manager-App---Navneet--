import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart' as dia;
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http_parser/http_parser.dart' as parser;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:managerapp/pages/add_mcc_retailer.dart/Model/Response/image_upload_res.dart';
import 'package:managerapp/pages/add_mcc_retailer.dart/Model/image_detail/image_detail_model.dart';
import 'package:managerapp/pages/filter/filter_provider.dart';
import 'package:managerapp/pages/filter/filter_request_model.dart';
import 'package:managerapp/pages/filter/filter_response_model.dart';
import 'package:managerapp/pages/login/Model/user_data.dart';
import 'package:managerapp/pages/outletsAction/actions/view/view_edit_request.dart';
import 'package:managerapp/pages/outletsAction/actions/view/view_edit_screen_provider.dart';
import 'package:managerapp/pages/outletsAction/actions/view/view_edit_screen_response.dart';
import 'package:managerapp/pages/outletsAction/outlet_action_response.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/extensions.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/util/utils.dart';
import 'package:managerapp/webservices/base_response.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/widgets/error_dialog.dart';

class ViewEditActionController extends GetxController {
  bool isLoading = true;
  String rtname = "";
  OutletDataResponse? outletData;
  TextEditingController outnameCtrl = TextEditingController();
  TextEditingController addres1Ctrl = TextEditingController();
  TextEditingController addres2Ctrl = TextEditingController();
  TextEditingController areaCtrl = TextEditingController();
  TextEditingController pincodeCtrl = TextEditingController();
  TextEditingController contactPersonCtrl = TextEditingController();
  TextEditingController whatsappCtrl = TextEditingController();
  TextEditingController mobile2Ctrl = TextEditingController();
  TextEditingController telephoneCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController birthDateCtrl = TextEditingController();
  TextEditingController mrgDatecodeCtrl = TextEditingController();
  bool readOnly = true;
  String regionDropdownValue = '';
  String districtDropdownValue = '';
  String cityDropdownValue = '';
  String classDropdownValue = '';
  String designationDropdownValue = '';
  String shopTypeDropdownValue = '';
  String listingTypeDropdownValue = '';
  String username = "";
  GetStorage storage = GetStorage();
  List<Listregion> regionList = [];
  List<Listdistrict> districtList = [];
  List<Listcity> cityList = [];
  List<Listretclass> classList = [];
  List<Listdata> listingTypeList = [];
  List<ListdataForShopType> shopTypeList = [];
  List<ListdataForDesignation> designationList = [];
  DateTime? birthDate;
  DateTime? mrgDate;
  DateFormat dateFormat = DateFormat(Constant.DATE_FORMAT);
  String longitude = "";
  String latitude = "";
  String outid = '';
  List<Lstimage>? shopImageList = [];
  List<ImgDetail>? shopImages = [];
  List<ImgDetail>? logoImages = [];
  
  List<ImgDetail>? visitingCardImages = [];
  List<Lstimage>? logoImageList = [];
  List<Lstimage>? visitinCardImageList = [];
  List<File> newShopImages = [];
  List<File> newlogoImages = [];
  List<File> newvisitingCardImages = [];
  bool isDeleteOrUpdateApiCalled = false;
  int imageTypeId = 0; //1 for shop,2 for visiting card, 3 for logo
  File sample = File('');
  bool isImageAdded = false;

  @override
  void onInit() async {
    super.onInit();
    await getArgumentsData();
    await preLoadFormData();
    await loadUserData();
    await getDesignationList();
    await getFilterClassData();
    await getFilterListingTypeData();
    await getFilterShopTypeData();
    await getRegionList();
  }

  getArgumentsData() async {
    var data = await Get.arguments;
    rtname = data['routeName'];
    outletData = data['response'];
    outid = data['outid'];
    update();
  }

  loadUserData() async {
    UserData userData =
        UserData.fromJson(json.decode(await storage.read(Constant.USER_DATA)));
    username = userData.username;
    update();
  }

  preLoadFormData() {
    shopImageList = outletData!.lstimageShop;
    shopImages!.addAll(shopImageList!.map<ImgDetail>((e) {
      return ImgDetail(
          imagename: e.filename,
          imgId: e.fileid,
          isFileLocal: false,
          imagepath: e.filePathName);
    }));
    logoImageList = outletData!.lstimageLogo;
    logoImages!.addAll(logoImageList!.map<ImgDetail>((e) {
      return ImgDetail(
          imagename: e.filename,
          imgId: e.fileid,
          isFileLocal: false,
          imagepath: e.filePathName);
    }));
    visitinCardImageList = outletData!.lstimageVisitCard;
    visitingCardImages!.addAll(visitinCardImageList!.map<ImgDetail>((e) {
      return ImgDetail(
          imagename: e.filename,
          imgId: e.fileid,
          isFileLocal: false,
          imagepath: e.filePathName);
    }));
    outnameCtrl.text = outletData!.out!;
    addres1Ctrl.text = outletData!.add1!;
    addres2Ctrl.text = outletData!.add2!;
    areaCtrl.text = outletData!.add3!;
    contactPersonCtrl.text = outletData!.cp!;
    whatsappCtrl.text = outletData!.cno!;
    mobile2Ctrl.text = outletData!.cno2 ?? "";
    telephoneCtrl.text = outletData!.landline ?? "";
    emailCtrl.text = outletData!.cemail ?? "";
    regionDropdownValue = outletData!.regioncode!;
    districtDropdownValue = outletData!.districtcode!;
    cityDropdownValue = outletData!.citycode!;
    pincodeCtrl.text = outletData!.pin!;
    classDropdownValue = outletData!.retclasscode!;
    listingTypeDropdownValue = outletData!.listtypecode!;
    shopTypeDropdownValue = outletData!.shoptypecode!;
    designationDropdownValue = outletData!.contactDesigCode!;
    birthDateCtrl.text = outletData!.cbirthdate ?? "";
    mrgDatecodeCtrl.text = outletData!.cmarriagedate ?? "";
    longitude = outletData!.longitude!;
    latitude = outletData!.latitude!;
    update();
  }

  getRegionList() {
    //isLoading = true;
    update();
    BasicRequest regionListRequest =
        BasicRequest(req: Strings.regionListReqId, un: username);
    ViewEditProvider().viewEditProvider(
      regionRequest: regionListRequest,
      onSuccess: (response) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.result);
          final res = RegionResponseModel.fromJson(data);
          print(res.toJson());
          if (res.resp == '1') {
            regionList = res.listregion!;
            if (regionDropdownValue == "") {
              regionDropdownValue = regionList.first.regioncode!;
            }
            update();
            getDistrictList(false);
          } else {
            errorDialog(res.msg!);
          }
        } else {
          errorDialog(response.message!);
        }
        //isLoading = false;
        update();
      },
      onError: (response) {
        // isLoading = false;
        update();
        errorDialog(response.message!);
      },
    );
    //isLoading = false;
    update();
  }

  getDistrictList(bool changefromScreen) {
    DistrictRequest districtListRequest = DistrictRequest(
        req: Strings.districtListReqId,
        un: username,
        region: regionDropdownValue);
    ViewEditProvider().districtListProvider(
      districtRequest: districtListRequest,
      onSuccess: (response) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.result);
          final res = DistrictResponseModel.fromJson(data);

          if (res.resp == '1') {
            districtList = res.listdistrict!;
            if (districtDropdownValue == "" || changefromScreen) {
              districtDropdownValue = districtList.first.districtcode!;
            }
            update();
            getCityList(changefromScreen);
          } else {
            errorDialog(res.msg!);
          }
        } else {
          errorDialog(response.message!);
        }
        // isLoading = false;
        update();
      },
      onError: (response) {
        // isLoading = false;
        update();
        errorDialog(response.message!);
      },
    );
    // isLoading = false;
    update();
  }

  getCityList(bool changefromScreen) {
    CityRequest cityListRequest = CityRequest(
        req: Strings.cityListReqId,
        un: username,
        district: districtDropdownValue);
    ViewEditProvider().cityListProvider(
      cityRequest: cityListRequest,
      onSuccess: (response) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.result);
          final res = CityResponseModel.fromJson(data);
          if (res.resp == '1') {
            cityList = res.listcity!;
            if (cityDropdownValue == "" || changefromScreen) {
              cityDropdownValue = cityList.first.citycode!;
            }
            update();
          } else {
            errorDialog(res.msg!);
          }
        } else {
          errorDialog(response.message!);
        }
        //isLoading = false;
        update();
      },
      onError: (response) {
        //isLoading = false;
        update();
        errorDialog(response.message!);
      },
    );
    isLoading = false;
    update();
  }

  getFilterClassData() {
    // isLoading = true;
    update();
    BasicRequest classRequest =
        BasicRequest(req: Strings.filterClassReqId, un: username);
    FilterProvider().filterClassProvider(
      filterRequestModel: classRequest,
      onSuccess: (response) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.result);
          final res = FilterClassResponse.fromJson(data);
          if (res.resp == '1') {
            classList = res.listretclass!;
            update();
          } else {
            errorDialog(res.msg!);
          }
        } else {
          errorDialog(response.message!);
        }
        // isLoading = false;
        update();
      },
      onError: (response) {
        // isLoading = false;
        update();
        errorDialog(response.message!);
      },
    );
    //isLoading = false;
    update();
  }

  getFilterListingTypeData() {
    // isLoading = true;
    update();
    BasicRequest listingTypeRequest =
        BasicRequest(req: Strings.filterListingTypeReqId, un: username);
    FilterProvider().filterListingTypeProvider(
      filterRequestModel: listingTypeRequest,
      onSuccess: (response) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.result);
          final res = FilterListingTypeResponse.fromJson(data);

          if (res.resp == '1') {
            listingTypeList = res.listdata!;
            update();
          } else {
            errorDialog(res.msg!);
          }
        } else {
          errorDialog(response.message!);
        }
        //isLoading = false;
        update();
      },
      onError: (response) {
        // isLoading = false;
        update();
        errorDialog(response.message!);
      },
    );
    //isLoading = false;
    update();
  }

  getFilterShopTypeData() {
    //isLoading = true;
    update();
    BasicRequest listingTypeRequest =
        BasicRequest(req: Strings.filterShopTypeReqId, un: username);
    FilterProvider().filterShopTypeProvider(
      filterRequestModel: listingTypeRequest,
      onSuccess: (response) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.result);
          final res = FilterShopTypeResponse.fromJson(data);
          if (res.resp == '1') {
            shopTypeList = res.listdata!;
            // isLoading = false;
            update();
          } else {
            errorDialog(res.msg!);
          }
        } else {
          errorDialog(response.message!);
        }
        // isLoading = false;
        update();
      },
      onError: (response) {
        // isLoading = false;
        update();
        errorDialog(response.message!);
      },
    );
    // isLoading = false;
    update();
  }

  getDesignationList() {
    // isLoading = true;
    update();
    BasicRequest designationListRequest = BasicRequest(
      req: Strings.designationListReqId,
      un: username,
    );
    ViewEditProvider().designationListProvider(
      designationRequest: designationListRequest,
      onSuccess: (response) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.result);
          final res = DesignationResponseModel.fromJson(data);
          if (res.resp == '1') {
            designationList = res.listdata!;
            if (designationDropdownValue == "") {
              designationDropdownValue =
                  designationList.first.contactDesigCode!;
            }
            update();
          } else {
            errorDialog(res.msg!);
          }
        } else {
          errorDialog(response.message!);
        }
        // isLoading = false;
        update();
      },
      onError: (response) {
        //  isLoading = false;
        update();
        errorDialog(response.message!);
      },
    );
    // isLoading = false;
    update();
  }

  fileUpload(List<String>? images, String from) {
    isLoading = true;
    update();

    String imageFor = "";
    if (from.equalsIgnoreCase("SHOP")) {
      imageFor = "SHOP";
    }
    if (from.equalsIgnoreCase("VISITCARD")) {
      imageFor = "VISITCARD";
    }
    if (from.equalsIgnoreCase("Retailer_Logo")) {
      imageFor = "Retailer_Logo";
    }

    Map<String, dynamic> map = {};
    map["req"] = Strings.UploadImageReqId;
    map["un"] = username;
    map["image_for"] = imageFor;
    map["outid"] = outid;
    map["numberOfFiles"] = images!.length;
    images.asMap().forEach((index, element) async {
      var imageIndex = "image$index";
      File f = File(element);
      String fileName = f.path.split('/').last;
      Uint8List bytes = await f.readAsBytes(); //f.readAsBytesSync();
      ByteData byteData = ByteData.view(bytes.buffer);
      var result = await FlutterImageCompress.compressWithList(
          byteData.buffer.asUint8List(),
          quality: Constant.IMAGE_QUALITY);
      dia.MultipartFile multipartFile = dia.MultipartFile.fromBytes(result,
          filename: fileName, contentType: parser.MediaType("image", "jpg"));
      map[imageIndex] = multipartFile;
      print("imagename : $imageIndex");
      if ((images.length - 1) == index) {
        dia.FormData formData = dia.FormData.fromMap(map);
        ViewEditProvider().uploadImageFile(
          formData: formData,
          onSuccess: (ResponseModel response) {
            isLoading = false;
            update();
            if (response.statusCode == 200) {
              if (response.result != null) {
                try {
                  ImageUploadRes responseData =
                      ImageUploadRes.fromJson(jsonDecode(response.result));
                  if (responseData.resp != null &&
                      responseData.resp!.isNotEmpty &&
                      responseData.resp!.equalsIgnoreCase("1")) {
                    if (responseData.listfile != null &&
                        responseData.listfile!.isNotEmpty) {
                      List<Listfile> uploadedImageName = [];
                      if (responseData.listfile != null &&
                          responseData.listfile!.isNotEmpty) {
                        uploadedImageName.addAll(responseData.listfile!);
                      }
                      if (from.equalsIgnoreCase("Retailer_Logo") ||
                          from.equalsIgnoreCase("VISITCARD") ||
                          from.equalsIgnoreCase("SHOP")) {
                        addOrderFiles(uploadedImageName, from);
                      }
                    }
                    update();
                  } else {
                    if (responseData.msg!.isNotEmpty) {
                      Utils.showSnackbar(Strings.error, responseData.msg,
                          AppTheme.colorWhite, AppTheme.colorRed);
                    }
                  }
                } on Exception catch (e) {
                  print(e.toString());
                }
              }
            } else {
              if (response.message!.isNotEmpty) {
                Utils.showSnackbar(Strings.error, response.message!.isNotEmpty,
                    AppTheme.colorWhite, AppTheme.colorRed);
              }
            }
            update();
          },
          onError: (ResponseModel error) {
            errorDialog(error.message!);
          },
        );
      }
    });
  }




  addOrderFiles(List<Listfile>? fileImg, String from) {
    isLoading = true;
    update();

    UploadRetailerImageReq uploadRetailerImageReq = UploadRetailerImageReq(
        un: username,
        outid: outid,
        req: Strings.retailerUploadImageReqId,
        imageFor: from,
        listfile: fileImg);

    ViewEditProvider().uploadImageProvider(
      uploadRetailerImageReq: uploadRetailerImageReq,
      onSuccess: (ResponseModel responseModel) {
        isLoading = false;
        update();
        if (responseModel.statusCode == 200) {
          if (responseModel.result != null) {
            try {
              BaseResponse responseData =
                  BaseResponse.fromJson(jsonDecode(responseModel.result));
              if (responseData != null &&
                  responseData.resp != null &&
                  responseData.resp!.isNotEmpty &&
                  responseData.resp!.equalsIgnoreCase("1")) {
                // errorDialog(responseData.msg!, "success", false);
              }
            } on Exception catch (e) {
              print(e.toString());
            }
          }
        } else {
          if (responseModel.message!.isNotEmpty) {
            Utils.showSnackbar(Strings.error, responseModel.message!.isNotEmpty,
                AppTheme.colorWhite, AppTheme.colorRed);
          }
        }
        update();
      },
      onError: (ResponseModel error) {
        errorDialog(error.message!);
      },
    );
  }

  submitData() {
    isLoading = true;
    update();

    UpdateOutletDataRequest updateOutletDataRequest = UpdateOutletDataRequest(
      req: Strings.editOutletDetailReqId,
      un: username,
      outid: outid,
      out: outnameCtrl.text,
      add1: addres1Ctrl.text,
      add2: addres2Ctrl.text,
      cp: contactPersonCtrl.text,
      cno: whatsappCtrl.text,
      cno2: mobile2Ctrl.text,
      cemail: emailCtrl.text,
      cbirthdate: birthDateCtrl.text,
      cmarriagedate: mrgDatecodeCtrl.text,
      contactDesigCode: designationDropdownValue,
      pincode: pincodeCtrl.text,
      landline: telephoneCtrl.text,
      editOutnameFlag: outnameCtrl.text == outletData!.out! ? 'N' : "Y",
      changeout: outnameCtrl.text,
      city: cityDropdownValue,
      add1EditFlag: addres1Ctrl.text == outletData!.add1! ? 'N' : "Y",
      add2EditFlag: addres2Ctrl.text == outletData!.add2! ? 'N' : "Y",
      add3EditFlag: areaCtrl.text == outletData!.add3! ? "N" : "Y",
      waNumberEditFlag: "N",
      cpEditFlag: contactPersonCtrl.text == outletData!.cp! ? 'N' : "Y",
      cnoEditFlag: whatsappCtrl.text == outletData!.cno! ? 'N' : "Y",
      cno2EditFlag: mobile2Ctrl.text == outletData!.cno2 ? "N" : "Y",
      cemailEditFlag: emailCtrl.text == outletData!.cemail ? "N" : "Y",
      cbirthdateEditFlag:
          birthDateCtrl.text == outletData!.cbirthdate ? "N" : "Y",
      cmarriagedateEditFlag:
          mrgDatecodeCtrl.text == outletData!.cmarriagedate ? "N" : "Y",
      contactDesigCodeEditFlag:
          designationDropdownValue == outletData!.contactDesigCode ? "N" : "Y",
      pincodeEditFlag: pincodeCtrl.text == outletData!.pin ? "N" : "Y",
      landlineEditFlag: telephoneCtrl.text == outletData!.landline ? "N" : "Y",
      cityEditFlag: cityDropdownValue == outletData!.citycode ? "N" : "Y",
      shoptypeEditFlag:
          shopTypeDropdownValue == outletData!.shoptypecode ? "N" : "Y",
      listingtypeEditFlag:
          listingTypeDropdownValue == outletData!.listtypecode ? "N" : "Y",
      retailerclass: classDropdownValue,
      retailerclassEditFlag:
          classDropdownValue == outletData!.retclasscode ? "N" : "Y",
      listingTypeCode: listingTypeDropdownValue,
      shopTypeCode: shopTypeDropdownValue,
      latitude: "",
      longitude: "",
      rtid: "",
      add3: areaCtrl.text,
    );

    ViewEditProvider().submitDataProvider(
      updateOutletDataRequest: updateOutletDataRequest,
      onSuccess: (ResponseModel responseModel) {
        isLoading = false;
        update();
        if (responseModel.statusCode == 200) {
          if (responseModel.result != null) {
            try {
              BaseResponse responseData =
                  BaseResponse.fromJson(jsonDecode(responseModel.result));
              if (responseData != null &&
                  responseData.resp != null &&
                  responseData.resp!.isNotEmpty &&
                  responseData.resp!.equalsIgnoreCase("1")) {
                errorDialog(responseData.msg!, "success", true);
              }
            } on Exception catch (e) {
              print(e.toString());
            }
          }
        } else {
          if (responseModel.message!.isNotEmpty) {
            Utils.showSnackbar(Strings.error, responseModel.message!.isNotEmpty,
                AppTheme.colorWhite, AppTheme.colorRed);
          }
        }
        update();
      },
      onError: (ResponseModel error) {
        errorDialog(error.message!);
      },
    );
  }
}
