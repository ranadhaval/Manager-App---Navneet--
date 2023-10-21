import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:managerapp/routes/app_routes.dart';
import 'package:managerapp/util/constant.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashController extends GetxController {
  bool isLoading = false;
  bool isInternetNotAvailable = false;
  GetStorage getStorage = GetStorage();
  String appversion = '';

  @override
  void onInit() async {
    super.onInit();
    appversion = await getAppVersion();
    update();
  }

  getUserData() async {
    // String strUserData = "";
    // if (getStorage.hasData(Constant.USER_DATA)) {
    //   strUserData = await getStorage.read(Constant.USER_DATA);
    // }
    moveToLogin();
  }

  void moveToLogin() async {
    Get.offAllNamed(AppRoutes.LOGIN, arguments: appversion);
  }

  Future getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
