import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:managerapp/pages/login/Model/user_data.dart';
import 'package:managerapp/pages/outlets_page/outlets_controller.dart';
import 'package:managerapp/pages/filter/filter_provider.dart';
import 'package:managerapp/pages/filter/filter_request_model.dart';
import 'package:managerapp/pages/filter/filter_response_model.dart';
import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/strings.dart';

class FilterController extends GetxController {
  List<Listretclass> classList = [];
  List<Listdata> listingTypeList = [];
  List<ListdataForShopType> shopTypeList = [];
  GetStorage storage = GetStorage();
  String? selectedClassitemId;
  String? selectedListingTypeitemId;
  String? selectedShopTypeitemId;
  final GlobalKey<FormFieldState> listingTypekey = GlobalKey();
  final GlobalKey<FormFieldState> classkey = GlobalKey();
  final GlobalKey<FormFieldState> shopTypekey = GlobalKey();
  bool isLoading = true;
  String username = "";

  @override
  void onInit() async {
    await loadUserData();
    getArgumentsData();
    getFilterClassData();
    getFilterListingTypeData();
    getFilterShopTypeData();
    super.onInit();
  }

  getArgumentsData() {
    final data = Get.arguments;

    selectedClassitemId = data['CLASS'];
    selectedShopTypeitemId = data['SHOPTYPE'];
    selectedListingTypeitemId = data['LISTINGTYPE'];
    update();
    print(selectedShopTypeitemId);
  }

  loadUserData() async {
    UserData userData =
        UserData.fromJson(json.decode(await storage.read(Constant.USER_DATA)));
    username = userData.username;
    update();
  }

  getFilterClassData() {
    BasicRequest classRequest =
        BasicRequest(req: Strings.filterClassReqId, un: username);
    FilterProvider().filterClassProvider(
      filterRequestModel: classRequest,
      onSuccess: (response) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.result);
          final res = FilterClassResponse.fromJson(data);
          if (res.resp == '1') {
            classList = res.listretclass!;
            update();
          } else {
            snackbar(res.msg!, Colors.red, "Error");
          }
        } else {
          snackbar("Data Notz Found", Colors.red, "Error");
        }
      },
      onError: (response) {
        snackbar("Data Notz Found", Colors.red, "Error");
      },
    );
  }

  getFilterListingTypeData() {
    BasicRequest listingTypeRequest =
        BasicRequest(req: Strings.filterListingTypeReqId, un: username);
    FilterProvider().filterListingTypeProvider(
        filterRequestModel: listingTypeRequest,
        onSuccess: (response) {
          if (response.statusCode == 200) {
            final data = jsonDecode(response.result);
            final res = FilterListingTypeResponse.fromJson(data);

            if (res.resp == '1') {
              listingTypeList = res.listdata!;
              update();
            } else {
              snackbar(res.msg!, Colors.red, "Error");
            }
          } else {
            snackbar("Data Notz Found", Colors.red, "Error");
          }
        });
  }

  getFilterShopTypeData() {
    BasicRequest listingTypeRequest =
        BasicRequest(req: Strings.filterShopTypeReqId, un: username);
    FilterProvider().filterShopTypeProvider(
        filterRequestModel: listingTypeRequest,
        onSuccess: (response) {
          if (response.statusCode == 200) {
            final data = jsonDecode(response.result);
            final res = FilterShopTypeResponse.fromJson(data);
            if (res.resp == '1') {
              shopTypeList = res.listdata!;
              isLoading = false;
              update();
            } else {
              snackbar(res.msg!, Colors.red, "Error");
            }
          } else {
            snackbar("Data Notz Found", Colors.red, "Error");
          }
        });
  }
}
