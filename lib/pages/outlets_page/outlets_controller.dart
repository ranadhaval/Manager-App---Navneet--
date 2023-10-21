import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:managerapp/pages/login/Model/user_data.dart';
import 'package:managerapp/pages/outlets_page/Model/Provider/outlets_provider.dart';
import 'package:managerapp/pages/outlets_page/Model/Request/outlets_request.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/widgets/error_dialog.dart';
import 'Model/Response/outlets_response.dart';

class OutletsController extends GetxController {
  GetStorage storage = GetStorage();
  List<Listretailer> orgnlOutletList = [];
  List<Listretailer> outletList = [];
  String rtid = '';
  String rtname = '';
  String? selectedClassitemId;
  String? selectedListingTypeitemId;
  String? selectedShopTypeitemId;
  bool isFilterApplied = false;
  bool isLISTEmpty = false;
  String username = '';

  @override
  void onInit() async {
    await loadUserData();
    getArgumentsData();
    outletsApi(rtid);
    super.onInit();
  }

  loadUserData() async {
    UserData userData =
        UserData.fromJson(json.decode(await storage.read(Constant.USER_DATA)));
    username = userData.username;
    update();
  }

  getArgumentsData() {
    var data = Get.arguments;
    rtid = data['rtid'];
    rtname = data['routeName'];
    update();
  }

  void updateList(String value) {
    if (SearchTextController.text.isEmpty) {
      outletList = orgnlOutletList;

      update();
    } else {
      outletList = orgnlOutletList
          .where((element) =>
              element.shoptypename!.toLowerCase().contains(value.toLowerCase()))
          .toList();
      if (outletList.isEmpty) {
        isLISTEmpty = true;
      } else {
        isLISTEmpty = false;
      }
      update();
    }
  }

  TextEditingController SearchTextController = TextEditingController();

  void outletsApi(String rtid) {
    orgnlOutletList.clear();
    outletList.clear();
    OutletsRequestModel updateoutletRequest = OutletsRequestModel(
        req: Strings.outletsReqId, un: username, rtid: rtid);

    OutletsProvider(
      updateOutletRequestModel: updateoutletRequest,
      onSuccess: (ResponseModel response) {
        if (response.statusCode == 200) {
          OutletsResponseModel resultresponse =
              OutletsResponseModel.fromJson(jsonDecode(response.result));
          print(resultresponse.toJson());
          if (resultresponse.resp == "1") {
            outletList.addAll(resultresponse.listretailer!);

            orgnlOutletList.addAll(resultresponse.listretailer!);
          } else {
            errorDialog(resultresponse.msg!);
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

SnackbarController snackbar(String message, Color color, String baseMessage) {
  return Get.snackbar(
    padding: EdgeInsets.all(12),
    baseMessage,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: color,
    colorText: Colors.white,
    margin: const EdgeInsets.all(10),
  );
}
