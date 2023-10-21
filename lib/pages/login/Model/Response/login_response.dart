import 'package:managerapp/webservices/base_response.dart';

class LoginResponseModel extends BaseResponse {
  String? msgdate;
  String? tinterval;
  String? empcode;
  String? empname;
  String? upgradeApp;
  String? forceUpgradeApp;
  String? desig;
  List<Listmenuhide>? listmenuhide;

  LoginResponseModel(
      {super.resp,
      this.msgdate,
      super.msg,
      this.tinterval,
      this.empcode,
      this.empname,
      this.upgradeApp,
      this.forceUpgradeApp,
      this.desig,
      this.listmenuhide});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msgdate = json['msgdate'];
    msg = json['msg'];
    tinterval = json['tinterval'];
    empcode = json['empcode'];
    empname = json['empname'];
    upgradeApp = json['UpgradeApp'];
    forceUpgradeApp = json['Force_UpgradeApp'];
    desig = json['Desig'];
    if (json['listmenuhide'] != null) {
      listmenuhide = <Listmenuhide>[];
      json['listmenuhide'].forEach((v) {
        listmenuhide!.add(new Listmenuhide.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msgdate'] = this.msgdate;
    data['msg'] = this.msg;
    data['tinterval'] = this.tinterval;
    data['empcode'] = this.empcode;
    data['empname'] = this.empname;
    data['UpgradeApp'] = this.upgradeApp;
    data['Force_UpgradeApp'] = this.forceUpgradeApp;
    data['Desig'] = this.desig;
    if (this.listmenuhide != null) {
      data['listmenuhide'] = this.listmenuhide!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listmenuhide {
  String? menucode;
  String? menuname;
  String? menuFlag;
  String? menuIndex;

  Listmenuhide({this.menucode, this.menuname, this.menuFlag, this.menuIndex});

  Listmenuhide.fromJson(Map<String, dynamic> json) {
    menucode = json['menucode'];
    menuname = json['menuname'];
    menuFlag = json['menu_flag'];
    menuIndex = json['menu_index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menucode'] = this.menucode;
    data['menuname'] = this.menuname;
    data['menu_flag'] = this.menuFlag;
    data['menu_index'] = this.menuIndex;
    return data;
  }
}
