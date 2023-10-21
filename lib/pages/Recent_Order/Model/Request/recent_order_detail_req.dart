class RecentOrderReq {
  String? req;
  String? subid;
  String? outid;
  String? un;
  String? dtfrm;
  String? dtto;

  RecentOrderReq(
      {this.req, this.subid, this.outid, this.un, this.dtfrm, this.dtto});

  RecentOrderReq.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    subid = json['subid'];
    outid = json['outid'];
    un = json['un'];
    dtfrm = json['dtfrm'];
    dtto = json['dtto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['subid'] = this.subid;
    data['outid'] = this.outid;
    data['un'] = this.un;
    data['dtfrm'] = this.dtfrm;
    data['dtto'] = this.dtto;
    return data;
  }
}