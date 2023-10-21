import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dia;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http_parser/http_parser.dart' as parser;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:managerapp/pages/add_mcc_retailer.dart/Model/Response/image_upload_res.dart';
import 'package:managerapp/pages/add_mcc_retailer.dart/Model/image_detail/image_detail_model.dart';
import 'package:managerapp/pages/login/Model/user_data.dart';
import 'package:managerapp/pages/outletsAction/actions/view/view_edit_request.dart';
import 'package:managerapp/pages/outletsAction/actions/view/view_edit_screen_provider.dart';
import 'package:managerapp/pages/outletsAction/outlet_action_response.dart';
import 'package:managerapp/theme/app_theme.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/extensions.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/util/utils.dart';
import 'package:managerapp/webservices/base_response.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/widgets/error_dialog.dart';

class ImagesController extends GetxController {
  bool isLoading = false;
  String username = "", outid = "";
  List<ImgDetail>? images = [];
  List<Lstimage>? imageList = [];
  String from = "";
  GetStorage storage = GetStorage();
  bool isImageAdded = false;

  @override
  void onInit() async {
    super.onInit();
    await loadUserData();
    await getArgumentsData();
  }

  loadUserData() async {
    UserData userData =
        UserData.fromJson(json.decode(await storage.read(Constant.USER_DATA)));
    username = userData.username;
    update();
  }

  getArgumentsData() async {
    var data = await Get.arguments;
    from = data['type'];
    outid = data['outid'];
    imageList = data['images'];
    update();
    images!.addAll(imageList!.map<ImgDetail>((e) {
      return ImgDetail(
          imagename: e.filename,
          imgId: e.fileid,
          isFileLocal: false,
          imagepath: e.filePathName);
    }));

    update();
  }

  fileUpload(List<String>? images) {
    isLoading = true;
    update();

    Map<String, dynamic> map = {};
    map["req"] = Strings.UploadImageReqId;
    map["un"] = username;
    map["image_for"] = from;
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
                        addOrderFiles(uploadedImageName);
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

  addOrderFiles(List<Listfile>? fileImg) {
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
                Get.back(result: true);
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
