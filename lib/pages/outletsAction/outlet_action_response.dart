import 'package:managerapp/webservices/base_response.dart';

class OutletDataResponse extends BaseResponse {
  String? out;
  String? add1;
  String? cp;
  String? cno;
  String? cno2;
  String? landline;
  String? add2;
  String? add3;
  String? citycode;
  String? city;
  String? districtcode;
  String? district;
  String? regioncode;
  String? region;
  String? pin;
  String? cemail;
  String? latitude;
  String? longitude;
  String? cbirthdate;
  String? cmarriagedate;
  String? locationhide;
  String? contactDesigCode;
  String? retclasscode;
  String? retclassname;
  String? shoptypecode;
  String? shoptypename;
  String? listtypecode;
  String? listtypename;
  String? waNumber;
  List<Lstimage>? lstimageShop;
  List<Lstimage>? lstimageVisitCard;
  List<Lstimage>? lstimageLogo;

  OutletDataResponse(
      {super.resp,
      super.msg,
      this.out,
      this.add1,
      this.cp,
      this.cno,
      this.cno2,
      this.landline,
      this.add2,
      this.add3,
      this.citycode,
      this.city,
      this.districtcode,
      this.district,
      this.regioncode,
      this.region,
      this.pin,
      this.cemail,
      this.latitude,
      this.longitude,
      this.cbirthdate,
      this.cmarriagedate,
      this.locationhide,
      this.contactDesigCode,
      this.retclasscode,
      this.retclassname,
      this.shoptypecode,
      this.shoptypename,
      this.listtypecode,
      this.listtypename,
      this.waNumber,
      this.lstimageShop,
      this.lstimageVisitCard,
      this.lstimageLogo});

  OutletDataResponse.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
    out = json['out'];
    add1 = json['add1'];
    cp = json['cp'];
    cno = json['cno'];
    cno2 = json['cno2'];
    landline = json['landline'];
    add2 = json['add2'];
    add3 = json['add3'];
    citycode = json['citycode'];
    city = json['city'];
    districtcode = json['districtcode'];
    district = json['district'];
    regioncode = json['regioncode'];
    region = json['region'];
    pin = json['pin'];
    cemail = json['cemail'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    cbirthdate = json['cbirthdate'];
    cmarriagedate = json['cmarriagedate'];
    locationhide = json['locationhide'];
    contactDesigCode = json['Contact_desig_code'];
    retclasscode = json['retclasscode'];
    retclassname = json['retclassname'];
    shoptypecode = json['shoptypecode'];
    shoptypename = json['shoptypename'];
    listtypecode = json['listtypecode'];
    listtypename = json['listtypename'];
    waNumber = json['wa_number'];
    if (json['lstimage_Shop'] != null) {
      lstimageShop = <Lstimage>[];
      json['lstimage_Shop'].forEach((v) {
        lstimageShop!.add(new Lstimage.fromJson(v));
      });
    }
    if (json['lstimage_VisitCard'] != null) {
      lstimageVisitCard = <Lstimage>[];
      json['lstimage_VisitCard'].forEach((v) {
        lstimageVisitCard!.add(new Lstimage.fromJson(v));
      });
    }
    if (json['lstimage_Logo'] != null) {
      lstimageLogo = <Lstimage>[];
      json['lstimage_Logo'].forEach((v) {
        lstimageLogo!.add(new Lstimage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    data['out'] = this.out;
    data['add1'] = this.add1;
    data['cp'] = this.cp;
    data['cno'] = this.cno;
    data['cno2'] = this.cno2;
    data['landline'] = this.landline;
    data['add2'] = this.add2;
    data['add3'] = this.add3;
    data['citycode'] = this.citycode;
    data['city'] = this.city;
    data['districtcode'] = this.districtcode;
    data['district'] = this.district;
    data['regioncode'] = this.regioncode;
    data['region'] = this.region;
    data['pin'] = this.pin;
    data['cemail'] = this.cemail;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['cbirthdate'] = this.cbirthdate;
    data['cmarriagedate'] = this.cmarriagedate;
    data['locationhide'] = this.locationhide;
    data['Contact_desig_code'] = this.contactDesigCode;
    data['retclasscode'] = this.retclasscode;
    data['retclassname'] = this.retclassname;
    data['shoptypecode'] = this.shoptypecode;
    data['shoptypename'] = this.shoptypename;
    data['listtypecode'] = this.listtypecode;
    data['listtypename'] = this.listtypename;
    data['wa_number'] = this.waNumber;
    if (this.lstimageShop != null) {
      data['lstimage_Shop'] =
          this.lstimageShop!.map((v) => v.toJson()).toList();
    }
    if (this.lstimageVisitCard != null) {
      data['lstimage_VisitCard'] =
          this.lstimageVisitCard!.map((v) => v.toJson()).toList();
    }
    if (this.lstimageLogo != null) {
      data['lstimage_Logo'] =
          this.lstimageLogo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lstimage {
  String? fileid;
  String? filename;
  String? filepath;
  String? fileurl;
  String? fileTitle;
  String? filePathName;

  Lstimage(
      {this.fileid,
      this.filename,
      this.filepath,
      this.fileurl,
      this.fileTitle,
      this.filePathName});

  Lstimage.fromJson(Map<String, dynamic> json) {
    fileid = json['Fileid'];
    filename = json['filename'];
    filepath = json['filepath'];
    fileurl = json['fileurl'];
    fileTitle = json['FileTitle'];
    filePathName = json['FilePathName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Fileid'] = this.fileid;
    data['filename'] = this.filename;
    data['filepath'] = this.filepath;
    data['fileurl'] = this.fileurl;
    data['FileTitle'] = this.fileTitle;
    data['FilePathName'] = this.filePathName;
    return data;
  }
}
