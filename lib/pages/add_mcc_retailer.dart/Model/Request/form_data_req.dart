import 'package:managerapp/pages/add_mcc_retailer.dart/Model/Response/image_upload_res.dart';

class FormDataReq {
  String? req;
  String? un;
  String? mccdt;
  String? outid;
  String? noofperson;
  String? remark;
  String? noofpurchase;
  String? qtypurchase;
  String? productofmcc;
  String? imageFor;
  List<Listfile>? listfile;

  FormDataReq(
      {this.req,
      this.un,
      this.mccdt,
      this.outid,
      this.noofperson,
      this.remark,
      this.noofpurchase,
      this.qtypurchase,
      this.productofmcc,
      this.imageFor,
      this.listfile});

  FormDataReq.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    un = json['un'];
    mccdt = json['mccdt'];
    outid = json['outid'];
    noofperson = json['noofperson'];
    remark = json['remark'];
    noofpurchase = json['noofpurchase'];
    qtypurchase = json['qtypurchase'];
    productofmcc = json['productofmcc'];
    imageFor = json['Image_For'];
    if (json['listfile'] != null) {
      listfile = <Listfile>[];
      json['listfile'].forEach((v) {
        listfile!.add(new Listfile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['un'] = this.un;
    data['mccdt'] = this.mccdt;
    data['outid'] = this.outid;
    data['noofperson'] = this.noofperson;
    data['remark'] = this.remark;
    data['noofpurchase'] = this.noofpurchase;
    data['qtypurchase'] = this.qtypurchase;
    data['productofmcc'] = this.productofmcc;
    data['Image_For'] = this.imageFor;
    if (this.listfile != null) {
      data['listfile'] = this.listfile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listfilex {
  String? filename;

  Listfilex({this.filename});

  Listfilex.fromJson(Map<String, dynamic> json) {
    filename = json['filename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filename'] = this.filename;
    return data;
  }
}