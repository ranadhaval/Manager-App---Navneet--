import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:managerapp/pages/Subordinate/Model/Request/SubordinateRequest.dart';
import 'package:managerapp/pages/login/Model/user_data.dart';
import 'package:managerapp/pages/subordinate/model/response/SubordinateResponse.dart';
import 'package:managerapp/pages/subordinate/provider/sub_ordinate_provider.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/extensions.dart';
import 'package:managerapp/webservices/response_model.dart';

class SubOrdinateController extends GetxController {
  bool isLoading = Constant.isTrue;

  GetStorage storage = GetStorage();
  UserData? userData;

  List<SubordinateDetail> subOrdinateList = [];

  DateTime date = DateTime.now();
  TextEditingController fromDate = TextEditingController();
  TextEditingController toDate = TextEditingController();
  SubordinateResponse? subordinateResponse;

  @override
  void onInit() async {
    super.onInit();
    String todayDate = DateFormat('dd/MM/yyyy').format(date);
    fromDate.text = todayDate;
    toDate.text = todayDate;
    loadUserData();
  }

  loadUserData() async {
    userData =
        UserData.fromJson(json.decode(await storage.read(Constant.USER_DATA)));
    update();
    subordinateRequestApi();
  }

  void subordinateRequestApi() {
    SubordinateRequest subordinateRequest = SubordinateRequest(
      req: "68",
      un: userData!.username,
      subid: userData!.empcode,
      dtfrm: fromDate.text,
      dto: toDate.text,
    );
    isLoading = true;
    subOrdinateList.clear();
    update();
    SubordinateProvider().getSubOrdinateList(
      subordinateRequest: subordinateRequest,
      onSuccess: (ResponseModel response) {
        isLoading = false;
        update();
        if (response.statusCode == 200) {
          subordinateResponse =
              SubordinateResponse.fromJson(jsonDecode(response.result));
          if (subordinateResponse != null &&
              subordinateResponse!.resp != null &&
              subordinateResponse!.resp!.equalsIgnoreCase("1")) {
            if (subordinateResponse!.listorder != null &&
                subordinateResponse!.listorder!.isNotEmpty) {
              subOrdinateList.addAll(subordinateResponse!.listorder!);
            }
          } else {
            if (subordinateResponse != null &&
                subordinateResponse!.msg != null &&
                subordinateResponse!.msg!.isNotEmpty) {
              snackBar(subordinateResponse!.msg!, Colors.red);
            }
          }
        } else {
          if (response.message != null && response.message!.isNotEmpty) {
            snackBar(response.message!, Colors.red);
          }
        }
        update();
      },
      onError: (response) {
        isLoading = false;
        update();
        snackBar(response.message!, Colors.red);
      },
    );
  }

  SnackbarController snackBar(String message, Color color) {
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
