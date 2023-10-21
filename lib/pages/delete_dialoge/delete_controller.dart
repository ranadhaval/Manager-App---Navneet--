import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:managerapp/pages/delete_dialoge/Model/Request/delete_image_req.dart';
import 'package:managerapp/pages/delete_dialoge/Model/Response/delete_image_response.dart';
import 'package:managerapp/pages/delete_dialoge/Provider/delete_provider.dart';
import 'package:managerapp/pages/login/Model/user_data.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/widgets/error_dialog.dart';

import '../../util/constant.dart';

class DeleteController extends GetxController {
  DateTime date = DateTime.now();
  UserData? userData;

  int card_id = 0;
  @override
  void onInit() async {
    await loadUserData();

 
    super.onInit();
  }

  String user_name = '';
  loadUserData() async {
    userData =
        UserData.fromJson(json.decode(await storage.read(Constant.USER_DATA)));
    user_name = userData!.username;
    print(user_name);
    update();
  }

  GetStorage storage = GetStorage();

  bool is_EmptyList = true;
  bool is_Loded = true;

  List<DeleteImageResponse> dataList = [];

  void getdelete({required String imageID}) {
    is_Loded = true;

    DeleteImageReq deleteImageReq =
        DeleteImageReq(req: "188", un: user_name, imageID: imageID);
    update();

    print("ffg");
    DeleteProvider().getDeleteProvider(
        deleteImageReq: deleteImageReq,
        onSuccess: (ResponseModel response) {
          if (response.statusCode == 200) {
            print(response.result);
            DeleteImageResponse mccRetailerData =
                DeleteImageResponse.fromJson(jsonDecode(response.result));
            is_Loded = false;
            update();
            if (mccRetailerData != null && mccRetailerData.resp == '1') {
              dataList.addAll({mccRetailerData});

              // listdate.addAll(mccRetailerData.lstdate[0]. as Iterable<Lstdate>);

              is_EmptyList = dataList.isEmpty;
              snackbar('Succesfully', mccRetailerData.msg!, Colors.green);

              print("VALUE LIST IS:- ${dataList.length}");

              update();
            } else {
              is_EmptyList = dataList.isEmpty;

              update();
              errorDialog(mccRetailerData.msg!);

              snackbar('Error', mccRetailerData.msg!, Colors.red);
            }
          } else {
            is_Loded = false;

            errorDialog(response.message!);
            snackbar(
              'Error',
              response.message!,
              Colors.red,
            );
          }
        },
        onError: (response) {
          errorDialog(response.message!);
        });

    update();

    print('${is_Loded}: is loaded');
    print('${is_EmptyList}: is Empty');
  }

  SnackbarController snackbar(String message, title, Color color) {
    return Get.snackbar(
      padding: EdgeInsets.all(12),
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
    );
  }
}
