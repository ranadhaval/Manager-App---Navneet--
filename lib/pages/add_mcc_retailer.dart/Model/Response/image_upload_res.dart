import 'package:managerapp/webservices/base_response.dart';

class ImageUploadRes extends BaseResponse {
  List<Listfile>? listfile;

  ImageUploadRes({resp, msg, this.listfile});

  ImageUploadRes.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['listfile'] != null) {
      listfile = <Listfile>[];
      json['listfile'].forEach((v) {
        listfile!.add(new Listfile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    if (this.listfile != null) {
      data['listfile'] = this.listfile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listfile {
  String? filename;

  Listfile({this.filename});

  Listfile.fromJson(Map<String, dynamic> json) {
    filename = json['filename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filename'] = this.filename;
    return data;
  }
}
