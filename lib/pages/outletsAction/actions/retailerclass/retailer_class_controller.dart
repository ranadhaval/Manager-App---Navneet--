import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:managerapp/pages/filter/filter_provider.dart';
import 'package:managerapp/pages/filter/filter_request_model.dart';
import 'package:managerapp/pages/filter/filter_response_model.dart';
import 'package:managerapp/pages/login/Model/user_data.dart';
import 'package:managerapp/pages/outletsAction/actions/retailerclass/retailer_class_provider.dart';
import 'package:managerapp/pages/outletsAction/actions/retailerclass/retailer_class_request.dart';
import 'package:managerapp/pages/outlets_page/outlets_controller.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/widgets/error_dialog.dart';

class RetailerClassController extends GetxController {
  List<Listretclass> classList = [];
  bool isLoading = true;
  GetStorage storage = GetStorage();
  String? selectedClassitemId;
  String username = "";
  String outid = "";

  @override
  void onInit() async {
    super.onInit();
    await loadUserData();
    getArgumentsData();
    getClassData();
  }

  getArgumentsData() {
    final data = Get.arguments;
    outid = data['outid'];
    selectedClassitemId = data['CLASS'];
    update();
  }

  loadUserData() async {
    UserData userData =
        UserData.fromJson(json.decode(await storage.read(Constant.USER_DATA)));
    username = userData.username;
    update();
  }

  getClassData() {
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
            isLoading = false;
            update();
          } else {
            errorDialog(res.msg!);
          }
        } else {
          errorDialog(response.message!);
        }
      },
      onError: (response) {
        errorDialog(response.message!);
      },
    );

    update();
  }

  updateRetailerClass() {
    isLoading = true;
    update();
    UpdateRetailerClassRequest updateRetailerClassRequest =
        UpdateRetailerClassRequest(
            req: Strings.updateRetailerClassReqId,
            un: username,
            outid: outid,
            retclass: selectedClassitemId);
    RetailerClassProvider().updateRetailerClassProvider(
      updateRetailerClassRequest: updateRetailerClassRequest,
      onSuccess: (response) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.result);
          final res = FilterClassResponse.fromJson(data);
          if (res.resp == '1') {
            isLoading = false;
            Get.back(result: true);
            update();
          } else {
            errorDialog(res.msg!);
          }
        } else {
          errorDialog(response.message!);
        }
      },
      onError: (response) {
        errorDialog(response.message!);
      },
    );
    isLoading = false;
    update();
  }
}
