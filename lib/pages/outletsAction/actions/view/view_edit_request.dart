import 'package:managerapp/pages/add_mcc_retailer.dart/Model/Response/image_upload_res.dart';

class DistrictRequest {
  String? req;
  String? un;
  String? region;

  DistrictRequest({this.req, this.un, this.region});

  DistrictRequest.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    un = json['un'];
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['un'] = this.un;
    data['region'] = this.region;
    return data;
  }
}

class CityRequest {
  String? req;
  String? un;
  String? district;

  CityRequest({this.req, this.un, this.district});

  CityRequest.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    un = json['un'];
    district = json['district'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['un'] = this.un;
    data['district'] = this.district;
    return data;
  }
}

class UploadRetailerImageReq {
  String? req;
  String? un;
  String? outid;
  String? imageFor;
  List<Listfile>? listfile;

  UploadRetailerImageReq(
      {this.req, this.un, this.outid, this.imageFor, this.listfile});

  UploadRetailerImageReq.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    un = json['un'];
    outid = json['outid'];
    imageFor = json['Image_For'];
    if (json['listfile'] != null) {
      listfile = <Listfile>[];
      json['listfile'].forEach((v) {
        listfile!.add(new Listfile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['un'] = this.un;
    data['outid'] = this.outid;
    data['Image_For'] = this.imageFor;
    if (this.listfile != null) {
      data['listfile'] = this.listfile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UpdateOutletDataRequest {
  String? un;
  String? add1;
  String? add2;
  String? add3;
  String? pincode;
  String? cp;
  String? cno;
  String? cno2;
  String? waNumber;
  String? landline;
  String? cemail;
  String? cbirthdate;
  String? cmarriagedate;
  String? out;
  String? city;
  String? shopTypeCode;
  String? listingTypeCode;
  String? req;
  String? outid;
  String? changeout;
  String? retailerclass;
  String? editOutnameFlag;
  String? add1EditFlag;
  String? add2EditFlag;
  String? add3EditFlag;
  String? pincodeEditFlag;
  String? cpEditFlag;
  String? cnoEditFlag;
  String? cno2EditFlag;
  String? waNumberEditFlag;
  String? landlineEditFlag;
  String? cemailEditFlag;
  String? cbirthdateEditFlag;
  String? cmarriagedateEditFlag;
  String? cityEditFlag;
  String? retailerclassEditFlag;
  String? listingtypeEditFlag;
  String? shoptypeEditFlag;
  String? contactDesigCode;
  String? contactDesigCodeEditFlag;
  String? latitude;
  String? rtid;
  String? longitude;
  List<Listfile>? lstimageShop;
  List<Listfile>? lstimageVisitcard;
  List<Listfile>? lstimageRetailerLogo;

  UpdateOutletDataRequest(
      {this.un,
      this.add1,
      this.add2,
      this.add3,
      this.pincode,
      this.cp,
      this.cno,
      this.cno2,
      this.waNumber,
      this.landline,
      this.cemail,
      this.cbirthdate,
      this.cmarriagedate,
      this.out,
      this.city,
      this.shopTypeCode,
      this.listingTypeCode,
      this.req,
      this.outid,
      this.changeout,
      this.retailerclass,
      this.editOutnameFlag,
      this.add1EditFlag,
      this.add2EditFlag,
      this.add3EditFlag,
      this.pincodeEditFlag,
      this.cpEditFlag,
      this.cnoEditFlag,
      this.cno2EditFlag,
      this.waNumberEditFlag,
      this.landlineEditFlag,
      this.cemailEditFlag,
      this.cbirthdateEditFlag,
      this.cmarriagedateEditFlag,
      this.cityEditFlag,
      this.retailerclassEditFlag,
      this.listingtypeEditFlag,
      this.shoptypeEditFlag,
      this.contactDesigCode,
      this.contactDesigCodeEditFlag,
      this.latitude,
      this.rtid,
      this.longitude,
      this.lstimageShop,
      this.lstimageVisitcard,
      this.lstimageRetailerLogo});

  UpdateOutletDataRequest.fromJson(Map<String, dynamic> json) {
    un = json['un'];
    add1 = json['add1'];
    add2 = json['add2'];
    add3 = json['add3'];
    pincode = json['pincode'];
    cp = json['cp'];
    cno = json['cno'];
    cno2 = json['cno2'];
    waNumber = json['wa_number'];
    landline = json['landline'];
    cemail = json['cemail'];
    cbirthdate = json['cbirthdate'];
    cmarriagedate = json['cmarriagedate'];
    out = json['out'];
    city = json['city'];
    shopTypeCode = json['shop_type_code'];
    listingTypeCode = json['listing_type_code'];
    req = json['req'];
    outid = json['outid'];
    changeout = json['changeout'];
    retailerclass = json['retailerclass'];
    editOutnameFlag = json['edit_outname_flag'];
    add1EditFlag = json['add1_edit_flag'];
    add2EditFlag = json['add2_edit_flag'];
    add3EditFlag = json['add3_edit_flag'];
    pincodeEditFlag = json['pincode_edit_flag'];
    cpEditFlag = json['cp_edit_flag'];
    cnoEditFlag = json['cno_edit_flag'];
    cno2EditFlag = json['cno2_edit_flag'];
    waNumberEditFlag = json['wa_number_edit_flag'];
    landlineEditFlag = json['landline_edit_flag'];
    cemailEditFlag = json['cemail_edit_flag'];
    cbirthdateEditFlag = json['cbirthdate_edit_flag'];
    cmarriagedateEditFlag = json['cmarriagedate_edit_flag'];
    cityEditFlag = json['city_edit_flag'];
    retailerclassEditFlag = json['retailerclass_edit_flag'];
    listingtypeEditFlag = json['listingtype_edit_flag'];
    shoptypeEditFlag = json['shoptype_edit_flag'];
    contactDesigCode = json['Contact_desig_code'];
    contactDesigCodeEditFlag = json['Contact_desig_code_edit_flag'];
    latitude = json['latitude'];
    rtid = json['rtid'];
    longitude = json['longitude'];
    if (json['lstimage_shop'] != null) {
      lstimageShop = <Listfile>[];
      json['lstimage_shop'].forEach((v) {
        lstimageShop!.add(new Listfile.fromJson(v));
      });
    }
    if (json['lstimage_visitcard'] != null) {
      lstimageVisitcard = <Listfile>[];
      json['lstimage_visitcard'].forEach((v) {
        lstimageVisitcard!.add(new Listfile.fromJson(v));
      });
    }
    if (json['lstimage_RetailerLogo'] != null) {
      lstimageRetailerLogo = <Listfile>[];
      json['lstimage_RetailerLogo'].forEach((v) {
        lstimageRetailerLogo!.add(new Listfile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['un'] = this.un;
    data['add1'] = this.add1;
    data['add2'] = this.add2;
    data['add3'] = this.add3;
    data['pincode'] = this.pincode;
    data['cp'] = this.cp;
    data['cno'] = this.cno;
    data['cno2'] = this.cno2;
    data['wa_number'] = this.waNumber;
    data['landline'] = this.landline;
    data['cemail'] = this.cemail;
    data['cbirthdate'] = this.cbirthdate;
    data['cmarriagedate'] = this.cmarriagedate;
    data['out'] = this.out;
    data['city'] = this.city;
    data['shop_type_code'] = this.shopTypeCode;
    data['listing_type_code'] = this.listingTypeCode;
    data['req'] = this.req;
    data['outid'] = this.outid;
    data['changeout'] = this.changeout;
    data['retailerclass'] = this.retailerclass;
    data['edit_outname_flag'] = this.editOutnameFlag;
    data['add1_edit_flag'] = this.add1EditFlag;
    data['add2_edit_flag'] = this.add2EditFlag;
    data['add3_edit_flag'] = this.add3EditFlag;
    data['pincode_edit_flag'] = this.pincodeEditFlag;
    data['cp_edit_flag'] = this.cpEditFlag;
    data['cno_edit_flag'] = this.cnoEditFlag;
    data['cno2_edit_flag'] = this.cno2EditFlag;
    data['wa_number_edit_flag'] = this.waNumberEditFlag;
    data['landline_edit_flag'] = this.landlineEditFlag;
    data['cemail_edit_flag'] = this.cemailEditFlag;
    data['cbirthdate_edit_flag'] = this.cbirthdateEditFlag;
    data['cmarriagedate_edit_flag'] = this.cmarriagedateEditFlag;
    data['city_edit_flag'] = this.cityEditFlag;
    data['retailerclass_edit_flag'] = this.retailerclassEditFlag;
    data['listingtype_edit_flag'] = this.listingtypeEditFlag;
    data['shoptype_edit_flag'] = this.shoptypeEditFlag;
    data['Contact_desig_code'] = this.contactDesigCode;
    data['Contact_desig_code_edit_flag'] = this.contactDesigCodeEditFlag;
    data['latitude'] = this.latitude;
    data['rtid'] = this.rtid;
    data['longitude'] = this.longitude;
    if (this.lstimageShop != null) {
      data['lstimage_shop'] =
          this.lstimageShop!.map((v) => v.toJson()).toList();
    }
    if (this.lstimageVisitcard != null) {
      data['lstimage_visitcard'] =
          this.lstimageVisitcard!.map((v) => v.toJson()).toList();
    }
    if (this.lstimageRetailerLogo != null) {
      data['lstimage_RetailerLogo'] =
          this.lstimageRetailerLogo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
