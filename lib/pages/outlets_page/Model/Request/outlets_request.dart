class OutletsRequestModel {
  String? req;
  String? un;
  String? rtid;

  OutletsRequestModel({this.req, this.un, this.rtid});

  OutletsRequestModel.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    un = json['un'];
    rtid = json['rtid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['un'] = this.un;
    data['rtid'] = this.rtid;
    return data;
  }
}
