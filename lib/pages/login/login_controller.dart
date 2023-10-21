import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:managerapp/pages/login/Model/Request/login_request.dart';
import 'package:managerapp/pages/login/Model/Response/login_response.dart';
import 'package:managerapp/pages/login/Model/user_data.dart';
import 'package:managerapp/routes/app_routes.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/webservices/response_model.dart';
import 'package:managerapp/widgets/error_dialog.dart';
import 'Provider/login_provider.dart';

class LoginController extends GetxController {
  bool remeberMe = false, isLoading = false;

  String appVersion = '',
      deviceBrand = '',
      deviceModel = '',
      deviceUniqueID = '',
      deviceOsVersion = '',
      deviceOsType = '';

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  GetStorage storage = GetStorage();

  UserData? userData;

  final loginFormKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  void onInit() async {
    await getDeviceInfo();
    getArgumentData();
    await loadUserData();
    remember();
    super.onInit();
  }

  loadUserData() async {
    userData =
        UserData.fromJson(json.decode(await storage.read(Constant.USER_DATA)));
  }

  getArgumentData() {
    appVersion = Get.arguments;
    update();
  }

  getDeviceInfo() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo? info = await deviceInfo.androidInfo;
      deviceBrand = info.brand;
      deviceUniqueID = info.id;
      deviceModel = info.model;
      deviceOsType = 'Android';
      deviceOsVersion = info.version.release;
      update();
      return;
    }

    IosDeviceInfo? iosInfo = await deviceInfo.iosInfo;
    deviceUniqueID = iosInfo.identifierForVendor!;
    deviceModel = iosInfo.model!;
    deviceOsType = 'Ios';
    deviceOsVersion = iosInfo.systemVersion!;
    update();
  }

  remember() {
    if (userData != null && userData!.remeberMe) {
      usernameCtrl.text = userData!.username;
      passwordCtrl.text = userData!.password;
      remeberMe = userData!.remeberMe;
      update();
    }
  }

  void loginRequestApi() {
    isLoading = true;
    update();
    LoginRequestModel loginRequest = LoginRequestModel(
      req: Strings.loginReqId,
      un: usernameCtrl.text,
      pwd: passwordCtrl.text,
      ver: appVersion,
      deviceName: deviceModel,
      deviceOsType: deviceOsType,
      deviceOsVersion: deviceOsVersion,
      deviceUniqueID: deviceUniqueID,
      grkey: "A",
    );
    CheckLoginProvider().loginProvider(
      loginRequestModel: loginRequest,
      onSuccess: (ResponseModel response) {
        isLoading = false;
        update();
        if (response.statusCode == 200 && response.result != null) {
          final data = jsonDecode(response.result);
          LoginResponseModel loginRequestResponse =
              LoginResponseModel.fromJson(data);

          if (loginRequestResponse.resp == '1') {
            Get.offAllNamed(AppRoutes.DEMO, arguments: [loginRequestResponse]);
            userData = UserData(
                username: loginRequest.un!,
                password: loginRequest.pwd!,
                empcode: loginRequestResponse.empcode!,
                remeberMe: remeberMe);
            storage.write(Constant.USER_DATA, json.encode(userData));
          } else {
            errorDialog(loginRequestResponse.msg!);
          }
        } else {
          errorDialog(response.message!);
        }
        update();
      },
      onError: (response) {
        isLoading = false;
        update();
        errorDialog(response.message!);
        update();
      },
    );
  }

/* void apicall() {
    if (loginFormKey.currentState!.validate()) {
      circular(true);
      loginRequestApi();
    }
    update();
  }*/
}
