import 'package:managerapp/webservices/base_response.dart';

class RoutesResponseModel extends BaseResponse {
  List<Listroute>? listroute;

  RoutesResponseModel({super.resp, this.listroute, super.msg});

  RoutesResponseModel.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['listroute'] != null) {
      listroute = <Listroute>[];
      json['listroute'].forEach((v) {
        listroute!.add(new Listroute.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    if (this.listroute != null) {
      data['listroute'] = this.listroute!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listroute {
  String? rtid;
  String? rt;

  Listroute({this.rtid, this.rt});

  Listroute.fromJson(Map<String, dynamic> json) {
    rtid = json['rtid'];
    rt = json['rt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rtid'] = this.rtid;
    data['rt'] = this.rt;
    return data;
  }
}
