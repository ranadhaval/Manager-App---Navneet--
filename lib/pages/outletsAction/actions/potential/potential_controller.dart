import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:managerapp/pages/login/Model/user_data.dart';
import 'package:managerapp/pages/outletsAction/actions/potential/potential_provider.dart';
import 'package:managerapp/pages/outletsAction/actions/potential/potential_request.dart';
import 'package:managerapp/pages/outletsAction/actions/potential/potential_response.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/widgets/error_dialog.dart';

class PotentialController extends GetxController {
  String username = "", outid = "";
  GetStorage storage = GetStorage();
  List<Listbatch> potentialBatchList = [];
  bool isLoading = false;
  @override
  void onInit() async {
    super.onInit();
    await loadUserData();
    await getArgumentsData();
    getPotentialList();
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

  getPotentialList() {
    isLoading = true;
    update();
    PotentialListRequest potentialListRequest = PotentialListRequest(
        req: Strings.getPotentialListReqId, un: username, outid: outid);
    PotentialProvider().potentialListProvider(
      potentialListRequest: potentialListRequest,
      onSuccess: (response) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.result);
          final res = PotentialListResponse.fromJson(data);
          if (res.resp == '1') {
            potentialBatchList.clear();
            potentialBatchList.addAll(res.listbatch!);
            isLoading = false;
            update();
          } else {
            errorDialog(res.msg!);
          }
        } else {
          errorDialog(response.message!);
        }
        isLoading = false;
        update();
      },
      onError: (response) {
        isLoading = false;
        update();
        errorDialog(response.message!);
      },
    );
    isLoading = false;
    update();
  }
}
