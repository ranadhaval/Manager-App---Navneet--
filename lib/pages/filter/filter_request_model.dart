class BasicRequest {
  String? req;
  String? un;

  BasicRequest({this.req, this.un});

  BasicRequest.fromJson(Map<String, dynamic> json) {
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
