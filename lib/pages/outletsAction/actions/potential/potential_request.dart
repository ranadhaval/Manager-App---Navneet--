class PotentialListRequest {
  String? req;
  String? un;
  String? outid;

  PotentialListRequest({this.req, this.un, this.outid});

  PotentialListRequest.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    un = json['un'];
    outid = json['outid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['un'] = this.un;
    data['outid'] = this.outid;
    return data;
  }
}

class PotentialTypeRequest {
  String? req;
  String? un;

  PotentialTypeRequest({this.req, this.un});

  PotentialTypeRequest.fromJson(Map<String, dynamic> json) {
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

class AddPotentialRequest {
  String? req;
  String? un;
  String? outid;
  List<Listpotential>? listpotential;

  AddPotentialRequest({this.req, this.un, this.outid, this.listpotential});

  AddPotentialRequest.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    un = json['un'];
    outid = json['outid'];
    if (json['listpotential'] != null) {
      listpotential = <Listpotential>[];
      json['listpotential'].forEach((v) {
        listpotential!.add(new Listpotential.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['un'] = this.un;
    data['outid'] = this.outid;
    if (this.listpotential != null) {
      data['listpotential'] =
          this.listpotential!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listpotential {
  String? potentialTypeCode;
  String? amount;

  Listpotential({this.potentialTypeCode, this.amount});

  Listpotential.fromJson(Map<String, dynamic> json) {
    potentialTypeCode = json['potential_type_code'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['potential_type_code'] = this.potentialTypeCode;
    data['amount'] = this.amount;
    return data;
  }
}
