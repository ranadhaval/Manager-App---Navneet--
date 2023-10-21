import 'package:managerapp/webservices/base_response.dart';

class ProductListResponse extends BaseResponse {
  List<Listcat>? listcat;

  ProductListResponse({this.listcat, super.resp, super.msg});

  ProductListResponse.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['listcat'] != null) {
      listcat = <Listcat>[];
      json['listcat'].forEach((v) {
        listcat!.add(new Listcat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    if (this.listcat != null) {
      data['listcat'] = this.listcat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listcat {
  String? cid;
  String? cat;
  List<Listpord>? listpord;

  Listcat({this.cid, this.cat, this.listpord});

  Listcat.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    cat = json['cat'];
    if (json['listpord'] != null) {
      listpord = <Listpord>[];
      json['listpord'].forEach((v) {
        listpord!.add(new Listpord.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cid'] = this.cid;
    data['cat'] = this.cat;
    if (this.listpord != null) {
      data['listpord'] = this.listpord!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listpord {
  String? pid;
  String? prd;
  String? amt;
  String? mrp;
  String? div;
  String? kitflag;

  Listpord({this.pid, this.prd, this.amt, this.mrp, this.div, this.kitflag});

  Listpord.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    prd = json['prd'];
    amt = json['amt'];
    mrp = json['mrp'];
    div = json['div'];
    kitflag = json['kitflag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['prd'] = this.prd;
    data['amt'] = this.amt;
    data['mrp'] = this.mrp;
    data['div'] = this.div;
    data['kitflag'] = this.kitflag;
    return data;
  }
}

class SchemeListResponse extends BaseResponse {
  List<Listscheme>? listscheme;

  SchemeListResponse({this.listscheme, super.resp, super.msg});

  SchemeListResponse.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['listscheme'] != null) {
      listscheme = <Listscheme>[];
      json['listscheme'].forEach((v) {
        listscheme!.add(new Listscheme.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    if (this.listscheme != null) {
      data['listscheme'] = this.listscheme!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listscheme {
  String? scid;
  String? scn;

  Listscheme({this.scid, this.scn});

  Listscheme.fromJson(Map<String, dynamic> json) {
    scid = json['scid'];
    scn = json['scn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scid'] = this.scid;
    data['scn'] = this.scn;
    return data;
  }
}

class DistributorListResponse extends BaseResponse {
  List<Divlist>? divlist;

  DistributorListResponse({this.divlist, super.resp, super.msg});

  DistributorListResponse.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['divlist'] != null) {
      divlist = <Divlist>[];
      json['divlist'].forEach((v) {
        divlist!.add(new Divlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    if (this.divlist != null) {
      data['divlist'] = this.divlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Divlist {
  String? div;
  List<Distlist>? distlist;

  Divlist({this.div, this.distlist});

  Divlist.fromJson(Map<String, dynamic> json) {
    div = json['div'];
    if (json['distlist'] != null) {
      distlist = <Distlist>[];
      json['distlist'].forEach((v) {
        distlist!.add(new Distlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['div'] = this.div;
    if (this.distlist != null) {
      data['distlist'] = this.distlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Distlist {
  String? did;
  String? dnm;

  Distlist({this.did, this.dnm});

  Distlist.fromJson(Map<String, dynamic> json) {
    did = json['did'];
    dnm = json['dnm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['did'] = this.did;
    data['dnm'] = this.dnm;
    return data;
  }
}

class SubmitOrderResponse extends BaseResponse {
  String? oid;

  SubmitOrderResponse({this.oid, super.resp, super.msg});

  SubmitOrderResponse.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    oid = json['oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oid'] = this.oid;
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    return data;
  }
}
