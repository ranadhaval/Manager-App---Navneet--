class SubordinateRequest {
  String? req;
  String? subid;
  String? un;
  String? dtfrm;
  String? dto;

  SubordinateRequest({this.req, this.subid, this.un, this.dtfrm, this.dto});

  SubordinateRequest.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    subid = json['subid'];
    un = json['un'];
    dtfrm = json['dtfrm'];
    dto = json['dto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['subid'] = this.subid;
    data['un'] = this.un;
    data['dtfrm'] = this.dtfrm;
    data['dto'] = this.dto;
    return data;
  }
}