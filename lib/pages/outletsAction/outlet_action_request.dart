class OutletDataRequest {
  String? req;
  String? outid;
  String? un;

  OutletDataRequest({this.req, this.outid, this.un});

  OutletDataRequest.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    outid = json['outid'];
    un = json['un'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['outid'] = this.outid;
    data['un'] = this.un;
    return data;
  }
}
