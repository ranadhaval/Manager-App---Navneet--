import 'package:managerapp/webservices/base_response.dart';

class FormDataRes extends BaseResponse {
  String? mccid;

  FormDataRes({this.mccid});

  FormDataRes.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    mccid = json['mccid'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    data['mccid'] = this.mccid;
    return data;
  }
}
