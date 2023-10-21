class MccRetailerReq {
  String? req;
  String? un;
  String? outid;

  MccRetailerReq({this.req, this.un, this.outid});

  MccRetailerReq.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    un = json['un'];
    outid = json['outid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['un'] = this.un;
    data['outid'] = this.outid;
    return data;
  }
}
