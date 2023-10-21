import 'package:managerapp/webservices/base_response.dart';

class FilterClassResponse extends BaseResponse {
  List<Listretclass>? listretclass;

  FilterClassResponse({this.listretclass, super.resp, super.msg});

  FilterClassResponse.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['listretclass'] != null) {
      listretclass = <Listretclass>[];
      json['listretclass'].forEach((v) {
        listretclass!.add(new Listretclass.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    if (this.listretclass != null) {
      data['listretclass'] = this.listretclass!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listretclass {
  String? retailerclassid;
  String? retailerclassname;

  Listretclass({this.retailerclassid, this.retailerclassname});

  Listretclass.fromJson(Map<String, dynamic> json) {
    retailerclassid = json['retailerclassid'];
    retailerclassname = json['retailerclassname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['retailerclassid'] = this.retailerclassid;
    data['retailerclassname'] = this.retailerclassname;
    return data;
  }
}

class FilterListingTypeResponse extends BaseResponse {
  List<Listdata>? listdata;

  FilterListingTypeResponse({this.listdata, super.resp, super.msg});

  FilterListingTypeResponse.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['listdata'] != null) {
      listdata = <Listdata>[];
      json['listdata'].forEach((v) {
        listdata!.add(new Listdata.fromJson(v));
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

class Listdata {
  String? listingTypeCode;
  String? listingType;

  Listdata({this.listingTypeCode, this.listingType});

  Listdata.fromJson(Map<String, dynamic> json) {
    listingTypeCode = json['listing_type_code'];
    listingType = json['listing_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['listing_type_code'] = this.listingTypeCode;
    data['listing_type'] = this.listingType;
    return data;
  }
}

class FilterShopTypeResponse extends BaseResponse {
  List<ListdataForShopType>? listdata;

  FilterShopTypeResponse({this.listdata, super.resp, super.msg});

  FilterShopTypeResponse.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    if (json['listdata'] != null) {
      listdata = <ListdataForShopType>[];
      json['listdata'].forEach((v) {
        listdata!.add(new ListdataForShopType.fromJson(v));
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

class ListdataForShopType {
  String? shopTypeCode;
  String? shopType;

  ListdataForShopType({this.shopTypeCode, this.shopType});

  ListdataForShopType.fromJson(Map<String, dynamic> json) {
    shopTypeCode = json['shop_type_code'];
    shopType = json['shop_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_type_code'] = this.shopTypeCode;
    data['shop_type'] = this.shopType;
    return data;
  }
}
