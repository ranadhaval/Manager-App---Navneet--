class DeleteImageResponse {
  String? resp;
  String? msg;

  DeleteImageResponse({this.resp, this.msg});

  DeleteImageResponse.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    return data;
  }
}