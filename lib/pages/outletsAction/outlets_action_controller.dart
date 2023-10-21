import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:managerapp/pages/login/Model/user_data.dart';
import 'package:managerapp/pages/outletsAction/outlet_action_provider.dart';
import 'package:managerapp/pages/outletsAction/outlet_action_request.dart';
import 'package:managerapp/pages/outletsAction/outlet_action_response.dart';
import 'package:managerapp/routes/app_routes.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/resources.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/webservices/base_response.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/widgets/error_dialog.dart';

class OutletsActionController extends GetxController {
  String title = '';
  String outid = "";
  String username = "";
  String rtname = "";
  GetStorage storage = GetStorage();
  bool isLoading = true;
  OutletDataResponse? outletData;
  @override
  void onInit() async {
    await loadUserData();
    await getArgumentsData();
    getOutletData();
    super.onInit();
  }

  getOutletData() {
    isLoading = true;
    update();
    OutletDataRequest outletDataRequest = OutletDataRequest(
        req: Strings.getOutletDataReqId, outid: outid, un: username);

    OutletsActionProvider(
      outletDataRequest: outletDataRequest,
      onSuccess: (ResponseModel response) {
        if (response.statusCode == 200) {
          OutletDataResponse resultresponse =
              OutletDataResponse.fromJson(jsonDecode(response.result));
          print(resultresponse.toJson());
          if (resultresponse.resp == "1") {
            outletData = resultresponse;
            isLoading = false;
            if (outletData == null) {
              errorDialog(Strings.somethingWrong);
            }
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

  isUserCheckedInApi() {
    OutletDataRequest outletDataRequest = OutletDataRequest(
        req: Strings.isCheckedReqId, outid: outid, un: username);
    IsCheckedInProvider(
      outletDataRequest: outletDataRequest,
      onSuccess: (ResponseModel response) {
        if (response.statusCode == 200) {
          BaseResponse resultresponse =
              BaseResponse.fromJson(jsonDecode(response.result));
          print(resultresponse.toJson());
          if (resultresponse.resp == "1") {
            Get.toNamed(AppRoutes.NEWORDER,
                arguments: {"outid": outid, "type": 0});
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

  loadUserData() async {
    UserData userData =
        UserData.fromJson(json.decode(await storage.read(Constant.USER_DATA)));
    username = userData.username;
    update();
  }

  getArgumentsData() async {
    var data = await Get.arguments;
    title = data['out'];
    outid = data['outid'];
    rtname = data['routeName'];
    print(outid);
    update();
  }

  List<ActionCard> actionlist1 = [
    ActionCard(name: 'Retailer Check In', iconPath: checkInSvg, id: 1),
    ActionCard(name: 'Retailer Check out', iconPath: checkInOutSvg, id: 2),
    ActionCard(name: 'New Order', iconPath: newOrderSvg, id: 3),
    ActionCard(name: 'Recent Order', iconPath: chronometerSvg, id: 4),
  ];
  List<ActionCard> actionlist2 = [
    ActionCard(name: 'MCC', iconPath: mccSvg, id: 5),
    ActionCard(name: 'Display', iconPath: monitorSvg, id: 6),
    ActionCard(name: 'View / Edit', iconPath: editingSvg, id: 7),
    ActionCard(name: 'View on Map', iconPath: location2Svg, id: 8),
  ];
  List<ActionCard> actionlist3 = [
    ActionCard(name: 'Remove Retailer', iconPath: removeRetailerSvg, id: 9),
    ActionCard(name: 'Retailer Class', iconPath: retailerClassSvg, id: 10),
    ActionCard(name: 'Contact Retailer', iconPath: contactcardSvg, id: 11),
    ActionCard(name: 'Potential', iconPath: potentialSvg, id: 12),
  ];
  List<ActionCard> actionlist4 = [
    ActionCard(name: 'Shop Image', iconPath: shopSvg, id: 13),
    ActionCard(name: 'Visit Card Image', iconPath: businesscardSvg, id: 14),
    ActionCard(name: 'Retailer Logo Image', iconPath: shopSvg, id: 15),
    ActionCard(name: 'Update Location', iconPath: updateLocationSvg, id: 16),
  ];
}

class ActionCard {
  String name;
  int id;
  String iconPath;

  ActionCard({required this.name, required this.iconPath, required this.id});
}
