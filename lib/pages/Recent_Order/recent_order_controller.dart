import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:managerapp/pages/Recent_Order/Model/Request/recent_order_detail_req.dart';
import 'package:managerapp/pages/Recent_Order/Model/Response/recent_order_detail_data.dart';
import 'package:managerapp/pages/Recent_Order/Provider/recent_order_provider.dart';
import 'package:managerapp/pages/login/Model/user_data.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/webservices/response_model.dart';

class RecentOrderController extends GetxController {
  UserData? userData;
  TextEditingController firstDate = TextEditingController();
  TextEditingController secondDate = TextEditingController();
  DateTime date = DateTime.now();
  GetStorage storage = GetStorage();
  bool readOnly = false;
  bool isEmptyList = true;
  bool isLoded = true;
  List<RecentOrderData> responseList = [];
  List<Listorder>? responseList2 = [];
  final outid = Get.arguments[0];

  @override
  void onInit() async {
    super.onInit();
    await loadUserData();
  }

  loadUserData() async {
    userData =
        UserData.fromJson(json.decode(await storage.read(Constant.USER_DATA)));
    String todayDate = DateFormat('dd/MM/yyyy').format(date);
    firstDate.text =
        DateFormat('dd/MM/yyyy').format(DateTime(date.year, date.month, 1));
    secondDate.text = todayDate;
    update();
    subordinateRequestApi();
  }

  void subordinateRequestApi() {
    isLoded = true;
    responseList.clear();
    responseList2!.clear();
    RecentOrderReq recentOrderReq = RecentOrderReq(
      req: Strings.recentOrderReqId,
      un: userData!.username,
      subid: userData!.empcode,
      dtfrm: firstDate.text,
      outid: "$outid",
      dtto: secondDate.text,
    );
    update();
    RecentOrderDetailProvider().recentOrderDetailProvider(
        recentOrderReq: recentOrderReq,
        onSuccess: (ResponseModel response) {
          if (response.statusCode == 200) {
            RecentOrderData recentOrderData =
                RecentOrderData.fromJson(jsonDecode(response.result));
            isLoded = false;
            update();
            if (recentOrderData != null &&
                recentOrderData.listorder!.isNotEmpty) {
              readOnly = false;
              responseList.addAll({recentOrderData});
              responseList2!
                  .addAll(recentOrderData.listorder as Iterable<Listorder>);
              isEmptyList = responseList2!.isEmpty;
              update();
            } else {
              readOnly = false;
              isEmptyList = responseList2!.isEmpty;
              update();
              snackbar('We can\'t redirect', Colors.red);
            }
          } else {
            isLoded = false;
            readOnly = false;
            snackbar('We not get Any data', Colors.red);
          }
        });
    update();
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
