class UpdateRetailerClassRequest {
  String? req;
  String? un;
  String? outid;
  String? retclass;

  UpdateRetailerClassRequest({this.req, this.un, this.outid, this.retclass});

  UpdateRetailerClassRequest.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    un = json['un'];
    outid = json['outid'];
    retclass = json['retclass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['un'] = this.un;
    data['outid'] = this.outid;
    data['retclass'] = this.retclass;
    return data;
  }
}