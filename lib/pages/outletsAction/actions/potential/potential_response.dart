import 'package:managerapp/webservices/base_response.dart';

class PotentialListResponse extends BaseResponse {
  List<Listbatch>? listbatch;

  PotentialListResponse({resp, msg, this.listbatch});

  PotentialListResponse.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['listbatch'] != null) {
      listbatch = <Listbatch>[];
      json['listbatch'].forEach((v) {
        listbatch!.add(new Listbatch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    if (this.listbatch != null) {
      data['listbatch'] = this.listbatch!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listbatch {
  String? pdate;
  String? batchid;
  String? headertxt;
  List<Listpoten>? listpoten;

  Listbatch({this.pdate, this.batchid, this.headertxt, this.listpoten});

  Listbatch.fromJson(Map<String, dynamic> json) {
    pdate = json['pdate'];
    batchid = json['batchid'];
    headertxt = json['headertxt'];
    if (json['listpoten'] != null) {
      listpoten = <Listpoten>[];
      json['listpoten'].forEach((v) {
        listpoten!.add(new Listpoten.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pdate'] = this.pdate;
    data['batchid'] = this.batchid;
    data['headertxt'] = this.headertxt;
    if (this.listpoten != null) {
      data['listpoten'] = this.listpoten!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listpoten {
  String? potentialTypeCode;
  String? potentialType;
  String? amount;

  Listpoten({this.potentialTypeCode, this.potentialType, this.amount});

  Listpoten.fromJson(Map<String, dynamic> json) {
    potentialTypeCode = json['potential_type_code'];
    potentialType = json['potential_type'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['potential_type_code'] = this.potentialTypeCode;
    data['potential_type'] = this.potentialType;
    data['amount'] = this.amount;
    return data;
  }
}

class PotentialTypeResponse extends BaseResponse {
  List<Listdata>? listdata;

  PotentialTypeResponse({resp, msg, this.listdata});

  PotentialTypeResponse.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['listdata'] != null) {
      listdata = <Listdata>[];
      json['listdata'].forEach((v) {
        listdata!.add(new Listdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    if (this.listdata != null) {
      data['listdata'] = this.listdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listdata {
  String? potentialTypeCode;
  String? potentialType;

  Listdata({this.potentialTypeCode, this.potentialType});

  Listdata.fromJson(Map<String, dynamic> json) {
    potentialTypeCode = json['potential_type_code'];
    potentialType = json['potential_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['potential_type_code'] = this.potentialTypeCode;
    data['potential_type'] = this.potentialType;
    return data;
  }
}
