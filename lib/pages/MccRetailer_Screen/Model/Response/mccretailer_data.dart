import 'package:managerapp/pages/outletsAction/outlet_action_response.dart';

class MccRetailerData {
  String? resp;
  String? msg;
  List<Lstdate>? lstdate;

  MccRetailerData({this.resp, this.msg, this.lstdate});

  MccRetailerData.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['lstdate'] != null) {
      lstdate = <Lstdate>[];
      json['lstdate'].forEach((v) {
        lstdate!.add(new Lstdate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    if (this.lstdate != null) {
      data['lstdate'] = this.lstdate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lstdate {
  String? mccid;
  String? mccdate;
  String? noofperson;
  String? noofpurchase;
  String? qtypurchase;
  String? productofmcc;
  String? remark;
  List<Lstimage>? lstimage;

  Lstdate(
      {this.mccid,
      this.mccdate,
      this.noofperson,
      this.noofpurchase,
      this.qtypurchase,
      this.productofmcc,
      this.remark,
      this.lstimage});

  Lstdate.fromJson(Map<String, dynamic> json) {
    mccid = json['mccid'];
    mccdate = json['mccdate'];
    noofperson = json['noofperson'];
    noofpurchase = json['noofpurchase'];
    qtypurchase = json['qtypurchase'];
    productofmcc = json['productofmcc'];
    remark = json['remark'];
    if (json['lstimage'] != null) {
      lstimage = <Lstimage>[];
      json['lstimage'].forEach((v) {
        lstimage!.add(new Lstimage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mccid'] = this.mccid;
    data['mccdate'] = this.mccdate;
    data['noofperson'] = this.noofperson;
    data['noofpurchase'] = this.noofpurchase;
    data['qtypurchase'] = this.qtypurchase;
    data['productofmcc'] = this.productofmcc;
    data['remark'] = this.remark;
    if (this.lstimage != null) {
      data['lstimage'] = this.lstimage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
