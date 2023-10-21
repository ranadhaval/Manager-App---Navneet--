class OrderDetailsData {
  String? resp;
  String? dto;
  String? dtdel;
  String? outid;
  String? msg;
  String? tamt;
  String? editFlagVisible;
  List<Listitem>? listitem;

  OrderDetailsData(
      {this.resp,
      this.dto,
      this.dtdel,
      this.outid,
      this.msg,
      this.tamt,
      this.editFlagVisible,
      this.listitem});

  OrderDetailsData.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    dto = json['dto'];
    dtdel = json['dtdel'];
    outid = json['outid'];
    msg = json['msg'];
    tamt = json['tamt'];
    editFlagVisible = json['EditFlag_Visible'];
    if (json['listitem'] != null) {
      listitem = <Listitem>[];
      json['listitem'].forEach((v) {
        listitem!.add(new Listitem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['dto'] = this.dto;
    data['dtdel'] = this.dtdel;
    data['outid'] = this.outid;
    data['msg'] = this.msg;
    data['tamt'] = this.tamt;
    data['EditFlag_Visible'] = this.editFlagVisible;
    if (this.listitem != null) {
      data['listitem'] = this.listitem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listitem {
  String? pid;
  String? prd;
  String? qty;
  String? scid;
  Null? scn;
  String? amt;
  String? did;
  String? dnm;

  Listitem(
      {this.pid,
      this.prd,
      this.qty,
      this.scid,
      this.scn,
      this.amt,
      this.did,
      this.dnm});

  Listitem.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    prd = json['prd'];
    qty = json['qty'];
    scid = json['scid'];
    scn = json['scn'];
    amt = json['amt'];
    did = json['did'];
    dnm = json['dnm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['prd'] = this.prd;
    data['qty'] = this.qty;
    data['scid'] = this.scid;
    data['scn'] = this.scn;
    data['amt'] = this.amt;
    data['did'] = this.did;
    data['dnm'] = this.dnm;
    return data;
  }
}