class DeleteImageReq {
  String? req;
  String? un;
  String? imageID;

  DeleteImageReq({this.req, this.un, this.imageID});

  DeleteImageReq.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    un = json['un'];
    imageID = json['ImageID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['un'] = this.un;
    data['ImageID'] = this.imageID;
    return data;
  }
}