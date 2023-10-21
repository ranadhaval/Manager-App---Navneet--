import 'package:managerapp/webservices/base_response.dart';

class SubordinateResponse extends BaseResponse {
  List<SubordinateDetail>? listorder;

  SubordinateResponse({resp, msg, this.listorder});

  SubordinateResponse.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['listorder'] != null) {
      listorder = <SubordinateDetail>[];
      json['listorder'].forEach((v) {
        listorder!.add(new SubordinateDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    if (this.listorder != null) {
      data['listorder'] = this.listorder!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubordinateDetail {
  String? oid;
  String? amt;
  String? out;

  SubordinateDetail({this.oid, this.amt, this.out});

  SubordinateDetail.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    amt = json['amt'];
    out = json['out'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oid'] = this.oid;
    data['amt'] = this.amt;
    data['out'] = this.out;
    return data;
  }
}
