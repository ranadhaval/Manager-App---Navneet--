class RoutesRequestModel {
  String? req;
  String? subid;

  RoutesRequestModel({this.req, this.subid});

  RoutesRequestModel.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    subid = json['subid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['subid'] = this.subid;
    return data;
  }
}
