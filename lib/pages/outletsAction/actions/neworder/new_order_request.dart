class ProductListRequest {
  String? req;
  String? un;
  String? did;

  ProductListRequest({this.req, this.un, this.did});

  ProductListRequest.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    un = json['un'];
    did = json['did'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['un'] = this.un;
    data['did'] = this.did;
    return data;
  }
}

class SchemeListRequest {
  String? req;
  String? un;

  SchemeListRequest({this.req, this.un});

  SchemeListRequest.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    un = json['un'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['un'] = this.un;
    return data;
  }
}

class SubmitEditOrderRequest {
  String? req;
  String? un;
  String? outid;
  String? pwd;
  String? dto;
  String? dtdel;
  String? msg;
  String? orderid;
  List<Listprod>? listprod;

  SubmitEditOrderRequest(
      {this.req,
      this.un,
      this.outid,
      this.pwd,
      this.dto,
      this.dtdel,
      this.msg,
      this.orderid,
      this.listprod});

  SubmitEditOrderRequest.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    orderid = json['orderid'];
    un = json['un'];
    outid = json['outid'];
    pwd = json['pwd'];
    dto = json['dto'];
    dtdel = json['dtdel'];
    msg = json['msg'];
    if (json['listprod'] != null) {
      listprod = <Listprod>[];
      json['listprod'].forEach((v) {
        listprod!.add(new Listprod.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['un'] = this.un;
    data['outid'] = this.outid;
    data['pwd'] = this.pwd;
    data['dto'] = this.dto;
    data['dtdel'] = this.dtdel;
    data['msg'] = this.msg;
    data['orderid'] = this.orderid;
    if (this.listprod != null) {
      data['listprod'] = this.listprod!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listprod {
  String? pid;
  String? qty;
  String? did;
  String? scid;

  Listprod({this.pid, this.qty, this.did, this.scid});

  Listprod.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    qty = json['qty'];
    did = json['did'];
    scid = json['scid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['qty'] = this.qty;
    data['did'] = this.did;
    data['scid'] = this.scid;
    return data;
  }
}
