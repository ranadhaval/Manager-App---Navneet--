import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:managerapp/pages/add_mcc_retailer.dart/Model/Request/form_data_req.dart';
import 'package:managerapp/pages/add_mcc_retailer.dart/Model/Response/form_data_res.dart';
import 'package:managerapp/pages/add_mcc_retailer.dart/Model/Response/image_upload_res.dart';
import 'package:managerapp/pages/add_mcc_retailer.dart/Model/image_detail/image_detail_model.dart';
import 'package:managerapp/pages/add_mcc_retailer.dart/Provider/add_mcc_retailer_provider.dart';
import 'package:managerapp/pages/login/Model/user_data.dart';
import 'package:managerapp/pages/outletsAction/outlet_action_response.dart';
import 'package:managerapp/routes/app_routes.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/extensions.dart';
import 'package:managerapp/util/strings.dart';
import 'package:http_parser/http_parser.dart' as parser;
import 'package:dio/dio.dart' as dia;
import 'package:managerapp/util/utils.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/widgets/error_dialog.dart';

class AddMccRetailerController extends GetxController {
  List<File> fileimageList = [];
  List<ImgDetail>? fileImgs = [];

  bool isLoading = false;
  UserData? userData;
  GetStorage storage = GetStorage();

  OutletDataResponse? outletData;
  String outid = Strings.emptyString;
  bool isImageAdded = false;
  TextEditingController mccDate = TextEditingController();
  TextEditingController numberOfPerson = TextEditingController();
  TextEditingController numberOfPersonPurchased = TextEditingController();
  TextEditingController productCode = TextEditingController();
  TextEditingController quantityPurchased = TextEditingController();
  TextEditingController remark = TextEditingController();

  void onInit() async {
    mccDate.text = DateFormat(Strings.dateFormate).format(DateTime.now());
    super.onInit();
    await getArgumentsData();
    await loadUserData();
  }

  loadUserData() async {
    userData =
        UserData.fromJson(json.decode(await storage.read(Constant.USER_DATA)));

    update();
  }

  getArgumentsData() async {
    var data = await Get.arguments;
    outid = data[Strings.outId];
    update();
  }

  ImageUploadRes? responseData;
  fileUpload(List<String>? images, String from) {
    isLoading = true;
    update();

    String imageFor = Strings.emptyString;
    if (from.equalsIgnoreCase(Strings.mccRetailer)) {
      imageFor = Strings.mccRetailer;
    }

    Map<String, dynamic> map = {};
    map[Strings.req] = Strings.reqId179;
    map[Strings.un] = userData!.username;
    map[Strings.imageFor] = imageFor;
    map[Strings.outId] = "152944";
    map[Strings.numberOfFiles] = images!.length;
    images.asMap().forEach((index, element) async {
      var imageIndex = "${Strings.image}$index";
      File f = File(element);
      String fileName = f.path.split('/').last;
      Uint8List bytes = await f.readAsBytes();
      ByteData byteData = ByteData.view(bytes.buffer);
      var result = await FlutterImageCompress.compressWithList(
          byteData.buffer.asUint8List(),
          quality: Constant.IMAGE_QUALITY);
      dia.MultipartFile multipartFile = dia.MultipartFile.fromBytes(result,
          filename: fileName,
          contentType: parser.MediaType(Strings.image, Strings.jpg));
      map[imageIndex] = multipartFile;
      if ((images.length - 1) == index) {
        dia.FormData formData = dia.FormData.fromMap(map);
        AddMccRetailerProvider().uploadImageFile(
          formData: formData,
          onSuccess: (ResponseModel response) {
            isLoading = false;
            update();
            if (response.statusCode == Constant.statusCode200) {
              if (response.result != null) {
                try {
                  responseData =
                      ImageUploadRes.fromJson(jsonDecode(response.result));
                  if (responseData!.resp != null &&
                      responseData!.resp!.isNotEmpty &&
                      responseData!.resp!.equalsIgnoreCase(Strings.one)) {
                    if (responseData!.listfile != null &&
                        responseData!.listfile!.isNotEmpty) {
                      List<Listfile> uploadedImageName = [];
                      if (responseData!.listfile != null &&
                          responseData!.listfile!.isNotEmpty) {
                        uploadedImageName.addAll(responseData!.listfile!);
                      }
                      if (from.equalsIgnoreCase(Strings.mccRetailer)) {
                        addMccDataPostApi();
                      }
                    }
                    update();
                  } else {
                    if (responseData!.msg!.isNotEmpty) {
                      Utils.showSnackbar(Strings.error, responseData!.msg,
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

  bool isLoding = true;
  FormDataRes? formDataRes;
  addMccDataPostApi() {
    FormDataReq formDataReq = FormDataReq(
        req: Strings.reqId181,
        un: userData!.username,
        mccdt: mccDate.text.toString(),
        outid: outid,
        noofpurchase: numberOfPersonPurchased.text,
        noofperson: numberOfPerson.text,
        imageFor: Strings.mccRetailer,
        listfile: responseData!.listfile,
        //random selection
        productofmcc: "hgh");

    AddMccRetailerProvider().addMccRetailerDetail(
      formDataReq: formDataReq,
      onSuccess: (ResponseModel response) {
        if (response.statusCode == Constant.statusCode200) {
          isLoading = false;

          formDataRes = FormDataRes.fromJson(jsonDecode(response.result));

          if (formDataRes!.resp == Strings.one && formDataRes!.mccid != null) {
            Get.back();
          } else {
            errorDialog(formDataRes!.msg!);
          }
        } else {
          errorDialog(response.message!);
        }
      },
      onError: (response) {
        errorDialog(response.message!);
      },
    );
  }

  final key = GlobalKey<FormState>();
}
