class RecentOrderData {
  String? resp;
  String? msg;
  List<Listorder>? listorder;

  RecentOrderData({this.resp, this.msg, this.listorder});

  RecentOrderData.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['listorder'] != null) {
      listorder = <Listorder>[];
      json['listorder'].forEach((v) {
        listorder!.add(new Listorder.fromJson(v));
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

class Listorder {
  String? oid;
  String? amt;
  String? qty;
  String? dto;

  Listorder({this.oid, this.amt, this.qty, this.dto});

  Listorder.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    amt = json['amt'];
    qty = json['qty'];
    dto = json['dto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oid'] = this.oid;
    data['amt'] = this.amt;
    data['qty'] = this.qty;
    data['dto'] = this.dto;
    return data;
  }
}
