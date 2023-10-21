import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:managerapp/pages/login/Model/user_data.dart';
import 'package:managerapp/pages/outletsAction/actions/potential/potential_provider.dart';
import 'package:managerapp/pages/outletsAction/actions/potential/potential_request.dart';
import 'package:managerapp/pages/outletsAction/actions/potential/potential_response.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/webservices/base_response.dart';
import 'package:managerapp/widgets/error_dialog.dart';

class AddPotentialController extends GetxController {
  String username = "", outid = "";
  GetStorage storage = GetStorage();
  bool isLoading = true;
  List<Listdata> potentialTypeList = [];
  List<Ctrl> ctrlList = [];
  bool isAnyFieldChanged = false;
  List<Listpotential> newPotentialList = [];
  @override
  void onInit() async {
    super.onInit();
    await loadUserData();
    await getArgumentsData();
    getPotentialType();
  }

  loadUserData() async {
    UserData userData =
        UserData.fromJson(json.decode(await storage.read(Constant.USER_DATA)));
    username = userData.username;
    update();
  }

  getArgumentsData() async {
    var data = await Get.arguments;
    outid = data['outid'];
    update();
  }

  getPotentialType() {
    isLoading = true;
    update();
    print(isLoading);
    PotentialTypeRequest potentialTypeRequest =
        PotentialTypeRequest(req: Strings.getPotentialTypeReqId, un: username);
    PotentialProvider().potentialTypeProvider(
      potentialTypeRequest: potentialTypeRequest,
      onSuccess: (response) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.result);
          final res = PotentialTypeResponse.fromJson(data);
          if (res.resp == '1') {
            potentialTypeList.clear();
            potentialTypeList.addAll(res.listdata!);
            potentialTypeList.forEach((element) {
              TextEditingController textEditingController =
                  TextEditingController();
              ctrlList.add(Ctrl(
                  id: element.potentialTypeCode!, ctrl: textEditingController));
            });
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
        update();
        errorDialog(response.message!);
      },
    );

    update();
  }

  addPotential() {
    ctrlList.forEach((element) {
      if (element.ctrl.text != null && element.ctrl.text.isNotEmpty) {
        isAnyFieldChanged = true;
        newPotentialList.add(Listpotential(
            potentialTypeCode: element.id, amount: element.ctrl.text));
      }
    });
    update();

    if (newPotentialList.isNotEmpty && isAnyFieldChanged) {
      isLoading = true;
      update();
      AddPotentialRequest addPotentialRequest = AddPotentialRequest(
          req: Strings.addPotentialReqId,
          un: username,
          outid: outid,
          listpotential: newPotentialList);
      PotentialProvider().addpotentialProvider(
        addPotentialRequest: addPotentialRequest,
        onSuccess: (response) {
          if (response.statusCode == 200) {
            final data = jsonDecode(response.result);
            final res = BaseResponse.fromJson(data);
            if (res.resp == '1') {
              errorDialog(res.msg!, "success", true);
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
    } else {
      errorDialog("Please add atleast 1 Type to Submit");
    }
  }
}

class Ctrl {
  String id;
  TextEditingController ctrl;

  Ctrl({required this.id, required this.ctrl});
}
