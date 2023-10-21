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

class SchemeController extends GetxController {
  bool isLoading = true;
  TextEditingController searchTextController = TextEditingController();
  String userName = '';
  GetStorage storage = GetStorage();
  List<Listscheme> schemeList = [];
  List<Listscheme> orgnlSchemeList = [];
  @override
  void onInit() async {
    await loadUserData();
    await getSchemeList();
    super.onInit();
  }

  loadUserData() async {
    UserData userData =
        UserData.fromJson(json.decode(await storage.read(Constant.USER_DATA)));
    userName = userData.username;
    update();
  }

  void updateList(String value) {
    if (searchTextController.text.isEmpty) {
      schemeList = orgnlSchemeList;

      update();
    } else {
      schemeList = orgnlSchemeList
          .where((element) =>
              element.scn!.toLowerCase().contains(value.toLowerCase()))
          .toList();

      update();
    }
  }

  getSchemeList() {
    SchemeListRequest schemeListRequest =
        SchemeListRequest(req: Strings.schemeIdListReqId, un: userName);
    NewOrderProvider().schemeListProvider(
      schemeListRequest: schemeListRequest,
      onSuccess: (response) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.result);
          final res = SchemeListResponse.fromJson(data);
          if (res.resp == '1') {
            orgnlSchemeList.addAll(res.listscheme!);
            schemeList.addAll(res.listscheme!);
            update();
          } else {
            errorDialog(res.msg!);
          }
        } else {
          errorDialog(response.message!);
        }
        update();
      },
      onError: (response) {
        errorDialog(response.message!);
        update();
      },
    );
  }
}
