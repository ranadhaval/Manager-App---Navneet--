import 'package:managerapp/webservices/base_response.dart';

class RegionResponseModel extends BaseResponse {
  List<Listregion>? listregion;

  RegionResponseModel({this.listregion, super.msg, super.resp});

  RegionResponseModel.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['listregion'] != null) {
      listregion = <Listregion>[];
      json['listregion'].forEach((v) {
        listregion!.add(new Listregion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    if (this.listregion != null) {
      data['listregion'] = this.listregion!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listregion {
  String? regioncode;
  String? regionname;

  Listregion({this.regioncode, this.regionname});

  Listregion.fromJson(Map<String, dynamic> json) {
    regioncode = json['regioncode'];
    regionname = json['regionname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regioncode'] = this.regioncode;
    data['regionname'] = this.regionname;
    return data;
  }
}

class DistrictResponseModel extends BaseResponse {
  List<Listdistrict>? listdistrict;

  DistrictResponseModel({this.listdistrict, super.msg, super.resp});

  DistrictResponseModel.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['listdistrict'] != null) {
      listdistrict = <Listdistrict>[];
      json['listdistrict'].forEach((v) {
        listdistrict!.add(new Listdistrict.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    if (this.listdistrict != null) {
      data['listdistrict'] = this.listdistrict!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listdistrict {
  String? districtcode;
  String? districtname;

  Listdistrict({this.districtcode, this.districtname});

  Listdistrict.fromJson(Map<String, dynamic> json) {
    districtcode = json['districtcode'];
    districtname = json['districtname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['districtcode'] = this.districtcode;
    data['districtname'] = this.districtname;
    return data;
  }
}

class CityResponseModel extends BaseResponse {
  List<Listcity>? listcity;

  CityResponseModel({this.listcity, super.msg, super.resp});

  CityResponseModel.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['listcity'] != null) {
      listcity = <Listcity>[];
      json['listcity'].forEach((v) {
        listcity!.add(new Listcity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    if (this.listcity != null) {
      data['listcity'] = this.listcity!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listcity {
  String? citycode;
  String? cityname;

  Listcity({this.citycode, this.cityname});

  Listcity.fromJson(Map<String, dynamic> json) {
    citycode = json['citycode'];
    cityname = json['cityname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['citycode'] = this.citycode;
    data['cityname'] = this.cityname;
    return data;
  }
}

class DesignationResponseModel extends BaseResponse {
  List<ListdataForDesignation>? listdata;

  DesignationResponseModel({this.listdata, super.msg, super.resp});

  DesignationResponseModel.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['listdata'] != null) {
      listdata = <ListdataForDesignation>[];
      json['listdata'].forEach((v) {
        listdata!.add(new ListdataForDesignation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    if (this.listdata != null) {
      data['listdata'] = this.listdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListdataForDesignation {
  String? contactDesigCode;
  String? contactDesig;

  ListdataForDesignation({this.contactDesigCode, this.contactDesig});

  ListdataForDesignation.fromJson(Map<String, dynamic> json) {
    contactDesigCode = json['Contact_desig_code'];
    contactDesig = json['Contact_desig'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Contact_desig_code'] = this.contactDesigCode;
    data['Contact_desig'] = this.contactDesig;
    return data;
  }
}
