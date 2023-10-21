import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:managerapp/pages/login/Model/user_data.dart';
import 'package:managerapp/pages/outletsAction/actions/neworder/new_order_request.dart';
import 'package:managerapp/pages/outletsAction/actions/neworder/new_order_response.dart';
import 'package:managerapp/pages/outletsAction/actions/neworder/new_order_provider.dart';
import 'package:managerapp/pages/outletsAction/outlet_action_request.dart';

import 'package:managerapp/util/constant.dart';
import 'package:managerapp/util/strings.dart';
import 'package:managerapp/webservices/base_response.dart';
import 'package:managerapp/widgets/error_dialog.dart';

class NewOrderController extends GetxController {
  bool isLoading = false;
  List<Listcat> catagoryList = [];
  TextEditingController prdIdCtrl = TextEditingController();
  TextEditingController quantityCtrl = TextEditingController();
  TextEditingController schemeCtrl = TextEditingController();
  TextEditingController orderDateCtrl = TextEditingController();
  TextEditingController deliveryDateCtrl = TextEditingController();
  TextEditingController remarksCtrl = TextEditingController();
  DateFormat dateFormat = DateFormat(Constant.DATE_FORMAT);
  String userName = '';
  String outid = "";
  String password = "";
  GetStorage storage = GetStorage();
  List<Divlist> divlist = [];
  List<Distlist> distributorlist = [];
  String dropDownValue = "";
  List<Order> orderList = [];
  GlobalKey<FormState> ssdkey = GlobalKey<FormState>();
  String productName = '';
  bool isSubmitTaped = false;
  DateTime orderDate = DateTime.now();
  int type = 3;
  DateTime deliveryDate = DateTime.now().add(Duration(days: 1));
  List<Listprod> jsonPrdList = [];
  String orderId = "";
  List<Listpord> prdlist = [];

  @override
  void onInit() async {
    await getArgumentsData();
    await loadUserData();
    getProductList();
    getDistributorList();
    typeWiseTask();
    orderDateCtrl.text = dateFormat.format(orderDate);
    deliveryDateCtrl.text = dateFormat.format(deliveryDate);
    super.onInit();
  }

  loadUserData() async {
    UserData userData =
        UserData.fromJson(json.decode(await storage.read(Constant.USER_DATA)));
    userName = userData.username;
    password = userData.password;
    if (type == 1) {
      orderList.clear();
      SubmitEditOrderRequest data = await storage.read("${outid}order");
      List<Order> data2 = await storage.read("${outid}ordeList");
      orderList.addAll(data2);
      remarksCtrl.text = data.msg ?? "";
      orderDate = dateFormat.parse(data.dto!);
      deliveryDate = dateFormat.parse(data.dtdel!);
      orderId = await storage.read("${outid}ordeId");
    }
    update();
  }

  typeWiseTask() {
    if (type == 0) {
      orderDateCtrl.text = dateFormat.format(orderDate);
      deliveryDateCtrl.text = dateFormat.format(deliveryDate);
    } else if (type == 1) {
      orderDateCtrl.text = dateFormat.format(orderDate);
      deliveryDateCtrl.text = dateFormat.format(deliveryDate);
    }
  }

  getArgumentsData() async {
    var data = await Get.arguments;
    outid = data["outid"];
    type = data["type"];
    update();
  }

  getJsonPrdList() {
    jsonPrdList.clear();
    for (var element in orderList) {
      jsonPrdList.add(element.toPrdList());
    }
    update();
  }

  getDistributorList() {
    isLoading = true;
    update();
    OutletDataRequest distributorListRequest = OutletDataRequest(
        req: Strings.distributorListReqId, un: userName, outid: outid);
    NewOrderProvider().destributorListProvider(
      distributorListRequest: distributorListRequest,
      onSuccess: (response) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.result);
          final res = DistributorListResponse.fromJson(data);
          if (res.resp == '1') {
            divlist.addAll(res.divlist!);
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

  getDistributor(String pid) async {
    String div = await getDiv(pid) ?? "35";
    distributorlist.clear();

    for (var element in divlist) {
      if (element.div == div) {
        distributorlist.addAll(element.distlist!);
        dropDownValue = distributorlist.first.did!;
        update();
        return;
      }
    }
  }

  Future<String>? getDiv(String pid) {
    for (var element in catagoryList) {
      for (var i in element.listpord!) {
        if (i.pid == pid) {
          productName = i.prd!;
          update();
          return Future(() => i.div!);
        }
        break;
      }
    }
  }

  submitNewOrder() {
    isLoading = true;
    update();
    SubmitEditOrderRequest submitEditOrderRequest = SubmitEditOrderRequest(
        req: Strings.submitOrderReqId,
        un: userName,
        outid: outid,
        pwd: password,
        dto: dateFormat.format(orderDate),
        dtdel: dateFormat.format(deliveryDate),
        msg: remarksCtrl.text,
        listprod: jsonPrdList);
    NewOrderProvider().submitOrderProvider(
      submitEditOrderRequest: submitEditOrderRequest,
      onSuccess: (response) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.result);
          final res = SubmitOrderResponse.fromJson(data);

          if (res.resp == '1') {
            isLoading = false;
            orderId = res.oid!;
            storage.write("${outid}order", submitEditOrderRequest);
            storage.write("${outid}ordeList", orderList);
            storage.write("${outid}ordeId", orderId);
            update();
            errorDialog("Your OrderId is : ${res.oid}", "success", true);
          } else if (res.resp == '2') {
            errorDialog(res.msg!);
          } else {
            errorDialog(
              res.msg!,
            );
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

  editOrder() {
    isLoading = true;
    update();
    SubmitEditOrderRequest submitEditOrderRequest = SubmitEditOrderRequest(
        req: Strings.editOrderReqId,
        un: userName,
        outid: outid,
        pwd: password,
        orderid: orderId,
        dto: dateFormat.format(orderDate),
        dtdel: dateFormat.format(deliveryDate),
        msg: remarksCtrl.text,
        listprod: jsonPrdList);
    NewOrderProvider().editOrderProvider(
      submitEditOrderRequest: submitEditOrderRequest,
      onSuccess: (response) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.result);
          final res = BaseResponse.fromJson(data);

          if (res.resp == '1') {
            isLoading = false;
            update();
            storage.write("${outid}order", submitEditOrderRequest);
            storage.write("${outid}ordeList", orderList);
            storage.write("${outid}ordeId", orderId);
            update();
            errorDialog("OrderEdited Successfully", "success", true);
          } else if (res.resp == '2') {
            errorDialog(res.msg!);
          } else {
            errorDialog(
              res.msg!,
            );
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

  addOrder() {
    orderList.add(Order(
      productId: prdIdCtrl.text,
      quantity: quantityCtrl.text,
      distributor: distributorlist
          .where((element) => element.did == dropDownValue)
          .first
          .dnm!,
      scheme: schemeCtrl.text,
      productName: productName,
      distributorId: distributorlist
          .where((element) => element.did == dropDownValue)
          .first
          .did!,
    ));
    prdIdCtrl.clear();
    quantityCtrl.clear();
    dropDownValue = "";
    schemeCtrl.clear();
    distributorlist.clear();
    update();
  }

  getProductList() {
    isLoading = true;
    update();
    ProductListRequest prdListRequest = ProductListRequest(
        req: Strings.productIdListReqId, un: userName, did: '');
    NewOrderProvider().productListProvider(
      productListRequest: prdListRequest,
      onSuccess: (response) async {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.result);
          final res = ProductListResponse.fromJson(data);
          if (res.resp == '1') {
            catagoryList.addAll(res.listcat!);
            isLoading = false;
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

class Order {
  String productId;
  String productName;
  String quantity;
  String? scheme;
  String distributor;
  String distributorId;

  Order(
      {required this.productId,
      required this.productName,
      required this.quantity,
      required this.distributor,
      required this.distributorId,
      this.scheme});

  Listprod toPrdList() {
    final Listprod data = Listprod();
    data.did = distributorId;
    data.pid = productId;
    data.qty = quantity;
    data.scid = scheme;
    return data;
  }
}
