import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:managerapp/pages/Route/Model/Provider/route_provider.dart';
import 'package:managerapp/pages/Route/Model/Request/route_request.dart';
import 'package:managerapp/pages/Route/Model/Response/route_response.dart';
import 'package:managerapp/pages/login/Model/user_data.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/widgets/error_dialog.dart';

class RouteController extends GetxController {
  GetStorage storage = GetStorage();
  String? empcode;
  @override
  void onInit() async {
    await loadUserData();
    routeScreenApi();
    super.onInit();
  }

  loadUserData() async {
    UserData userData =
        UserData.fromJson(json.decode(await storage.read(Constant.USER_DATA)));
    empcode = userData.empcode;
    update();
  }

  List<RoutesResponseModel> responseList = [];
  List<Listroute>? listroute = [];
  void routeScreenApi() {
    RoutesRequestModel updateRoutesRequest =
        RoutesRequestModel(req: Strings.routesReqId, subid: empcode);

    RoutesProvider(
      updateRoutesRequestModel: updateRoutesRequest,
      onSuccess: (ResponseModel response) {
        if (response.statusCode == 200 && response.result != null) {
          RoutesResponseModel resultResponse =
              RoutesResponseModel.fromJson(jsonDecode(response.result));

          if (resultResponse.resp == "1") {
            responseList.addAll({resultResponse});
            print(resultResponse.toJson());
            listroute!.addAll(resultResponse.listroute as Iterable<Listroute>);
            update();
          } else {
            errorDialog(resultResponse.msg!);
          }
        } else {
          errorDialog(response.message!);
        }
        update();
      },
      onError: (response) {
        errorDialog(response.message!);
      },
    );
  }
}
