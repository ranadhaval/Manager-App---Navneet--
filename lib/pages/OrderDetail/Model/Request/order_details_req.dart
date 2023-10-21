class OrderDetailsReq {
  String? req;
  String? un;
  String? oid;

  OrderDetailsReq({this.req, this.un, this.oid});

  OrderDetailsReq.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    un = json['un'];
    oid = json['oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['un'] = this.un;
    data['oid'] = this.oid;
    return data;
  }
}