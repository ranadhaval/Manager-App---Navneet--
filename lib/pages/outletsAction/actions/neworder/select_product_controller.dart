import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:managerapp/pages/login/Model/user_data.dart';
import 'package:managerapp/pages/outletsAction/actions/neworder/new_order_request.dart';
import 'package:managerapp/pages/outletsAction/actions/neworder/new_order_response.dart';
import 'package:managerapp/pages/outletsAction/actions/neworder/new_order_provider.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/widgets/error_dialog.dart';

class SelectProductController extends GetxController {
  bool isLoading = true;
  TextEditingController searchTextController = TextEditingController();
  String userName = '';
  GetStorage storage = GetStorage();
  List<Listpord> productList = [];
  List<Listcat> catagoryList = [];
  List<Listcat> orgnlcatagoryList = [];
  @override
  void onInit() async {
    await loadUserData();
    await getArgumentsData();
    print(catagoryList.length);
    super.onInit();
  }

  getArgumentsData() async {
    var data = await Get.arguments;
    orgnlcatagoryList.addAll(data);
    catagoryList.addAll(data);
    update();
  }

  loadUserData() async {
    UserData userData =
        UserData.fromJson(json.decode(await storage.read(Constant.USER_DATA)));
    userName = userData.username;
    update();
  }

  void updateList(String value) {
    if (searchTextController.text.isEmpty) {
      catagoryList = orgnlcatagoryList;

      update();
    } else {
      catagoryList = orgnlcatagoryList
          .where((element) =>
              element.cat!.toLowerCase().contains(value.toLowerCase()))
          .toList();

      update();
    }
  }
}
