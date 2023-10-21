import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:managerapp/pages/MccRetailer_Screen/Model/Request/mccretailer_req.dart';
import 'package:managerapp/pages/MccRetailer_Screen/Model/Response/mccretailer_data.dart';
import 'package:managerapp/pages/MccRetailer_Screen/Provider/mccretailer_provider.dart';
import 'package:managerapp/pages/outletsAction/outlet_action_response.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/widgets/error_dialog.dart';

import '../login/Model/user_data.dart';

class MccRetailerController extends GetxController {
  DateTime date = DateTime.now();
  UserData? userData;

  @override
  void onInit() async {
    await loadUserData();
    print("HEY CHO");
    getMccData();
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
  final outid = Get.arguments[0];

  bool is_EmptyList = true;
  bool is_Loded = true;

  List<MccRetailerData> dataList = [];
  List<Lstdate> listdate = [];
  List<Lstimage> listimage = [];
  getrefresh() {
    refresh();
    update();
  }

  void getMccData() {
    is_Loded = true;

    MccRetailerReq mccRetailerReq = MccRetailerReq(
      req: "182",
      un: user_name,
      outid: outid,
    );
    update();

    MccRetailerProvider().getMccRetailerDetail(
        mccRetailerReq: mccRetailerReq,
        onSuccess: (ResponseModel response) {
          if (response.statusCode == 200) {
            print(response.result);
            MccRetailerData mccRetailerData =
                MccRetailerData.fromJson(jsonDecode(response.result));
            is_Loded = false;
            update();
            if (mccRetailerData != null && mccRetailerData.resp == '1') {
              dataList.addAll({mccRetailerData});
              listdate.addAll(mccRetailerData.lstdate as Iterable<Lstdate>);
              listimage.addAll(
                  mccRetailerData.lstdate![0].lstimage as Iterable<Lstimage>);

              is_EmptyList = listdate.isEmpty;
              print("VALUE LIST IS:- ${dataList.length}");

              update();
            } else {
              is_EmptyList = listdate.isEmpty;

              update();
              errorDialog(mccRetailerData.msg!);

              snackbar(mccRetailerData.msg!, Colors.red);
            }
          } else {
            is_Loded = false;

            errorDialog(response.message!);
            snackbar(response.message!, Colors.red);
          }
        },
        onError: (response) {
          errorDialog(response.message!);
        });

    update();
    print('${listdate.length} -: list length');
    print('${is_Loded}: is loaded');
    print('${is_EmptyList}: is Empty');
  }

  SnackbarController snackbar(String message, Color color) {
    return Get.snackbar(
      padding: EdgeInsets.all(12),
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
    );
  }
}
