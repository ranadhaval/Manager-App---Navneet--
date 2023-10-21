import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:managerapp/pages/login/Model/user_data.dart';
import 'package:managerapp/util/constant.dart';

class HomeController extends GetxController {

  UserData? userData;
  GetStorage storage = GetStorage();
  bool is_open = false;
  bool tapped = false;
  int index = 1;

  @override
  void onInit() {
    loadUserData();
    super.onInit();
  }

  loadUserData() async {
    userData =
        UserData.fromJson(json.decode(await storage.read(Constant.USER_DATA)));
    update();
  }
}
