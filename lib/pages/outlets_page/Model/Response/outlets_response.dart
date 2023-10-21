import 'package:managerapp/webservices/base_response.dart';

class OutletsResponseModel extends BaseResponse {
  List<Listretailer>? listretailer;

  OutletsResponseModel({super.resp, super.msg, this.listretailer});

  OutletsResponseModel.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['listretailer'] != null) {
      listretailer = <Listretailer>[];
      json['listretailer'].forEach((v) {
        listretailer!.add(new Listretailer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    if (this.listretailer != null) {
      data['listretailer'] = this.listretailer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listretailer {
  String? outindex;
  String? outid;
  String? out;
  String? customerLocationFlag;
  String? customerLocationApprovalFlag;
  String? retclasscode;
  String? retclassname;
  String? shoptypecode;
  String? shoptypename;
  String? listtypecode;
  String? listtypename;
  String? retailerCheckInFlag;
  String? retailerCheckOutFlag;

  Listretailer(
      {this.outindex,
      this.outid,
      this.out,
      this.customerLocationFlag,
      this.customerLocationApprovalFlag,
      this.retclasscode,
      this.retclassname,
      this.shoptypecode,
      this.shoptypename,
      this.listtypecode,
      this.listtypename,
      this.retailerCheckInFlag,
      this.retailerCheckOutFlag});

  Listretailer.fromJson(Map<String, dynamic> json) {
    outindex = json['outindex'];
    outid = json['outid'];
    out = json['out'];
    customerLocationFlag = json['Customer_Location_Flag'];
    customerLocationApprovalFlag = json['Customer_Location_Approval_Flag'];
    retclasscode = json['retclasscode'];
    retclassname = json['retclassname'];
    shoptypecode = json['shoptypecode'];
    shoptypename = json['shoptypename'];
    listtypecode = json['listtypecode'];
    listtypename = json['listtypename'];
    retailerCheckInFlag = json['Retailer_Check_In_Flag'];
    retailerCheckOutFlag = json['Retailer_Check_Out_Flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['outindex'] = this.outindex;
    data['outid'] = this.outid;
    data['out'] = this.out;
    data['Customer_Location_Flag'] = this.customerLocationFlag;
    data['Customer_Location_Approval_Flag'] = this.customerLocationApprovalFlag;
    data['retclasscode'] = this.retclasscode;
    data['retclassname'] = this.retclassname;
    data['shoptypecode'] = this.shoptypecode;
    data['shoptypename'] = this.shoptypename;
    data['listtypecode'] = this.listtypecode;
    data['listtypename'] = this.listtypename;
    data['Retailer_Check_In_Flag'] = this.retailerCheckInFlag;
    data['Retailer_Check_Out_Flag'] = this.retailerCheckOutFlag;
    return data;
  }
}
