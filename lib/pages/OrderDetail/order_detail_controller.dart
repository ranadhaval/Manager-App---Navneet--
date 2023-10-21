import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:managerapp/pages/OrderDetail/Model/Request/order_details_req.dart';
import 'package:managerapp/pages/OrderDetail/Model/Response/order_details_data.dart';
import 'package:managerapp/pages/OrderDetail/Provider/order_deatail_provider.dart';
import 'package:managerapp/pages/login/Model/user_data.dart';
import 'package:managerapp/webservices/response_model.dart';

import '../../util/constant.dart';

class OrderDetailController extends GetxController {
  @override
  void onInit() async {
    await loadUserData();
    orderDetailApi();
    super.onInit();
  }

  UserData? userData;

  String subTitle = '';
  loadUserData() async {
    userData =
        UserData.fromJson(json.decode(await storage.read(Constant.USER_DATA)));

    subTitle = data[1].toString();

    update();
  }

  bool isEmptyList = true;
  bool isLoded = true;
  OrderDetailsData? orderDetailsData;
  List<Listitem> orderDetailList = [];
  int totalQuantity = 0;
  num totalPrice = 0;

  GetStorage storage = GetStorage();
  final data = Get.arguments;

  void orderDetailApi() {
    isLoded = true;

    OrderDetailsReq orderDetailsReq = OrderDetailsReq(
        req: '67', un: userData!.username, oid: data[0].toString());

    OrderDetailProvider().getOrderDetail(
      orderDetailsReq: orderDetailsReq,
      onSuccess: (ResponseModel response) {
        if (response.statusCode == 200) {
          isLoded = false;

          print(response.result);

          var decodedResponse = response.result;

          orderDetailsData =
              OrderDetailsData.fromJson(jsonDecode(response.result));

          if (orderDetailsData != null &&
              orderDetailsData!.listitem!.isNotEmpty) {
            orderDetailList.addAll(orderDetailsData!.listitem!);
            orderDetailList.forEach((element) {
              if (element.amt != null &&
                  element.qty != null &&
                  element.amt!.isNotEmpty &&
                  element.qty!.isNotEmpty) {
                totalQuantity += int.parse(element.qty.toString());
                totalPrice += double.parse(element.amt.toString());
              }
            });
            isEmptyList = orderDetailList.isEmpty;
            update();
          } else {
            isEmptyList = orderDetailList.isEmpty;
            update();
          }

          update();
        } else {
          print("object");
        }
      },
    );
  }
}
