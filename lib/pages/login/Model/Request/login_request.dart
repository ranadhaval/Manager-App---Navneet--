class LoginRequestModel {
  String? req;
  String? un;
  String? pwd;
  String? ver;
  String? deviceUniqueID;
  String? grkey;
  String? deviceOsVersion;
  String? deviceName;
  String? deviceOsType;

  LoginRequestModel(
      {this.req,
      this.un,
      this.pwd,
      this.ver,
      this.deviceUniqueID,
      this.grkey,
      this.deviceOsVersion,
      this.deviceName,
      this.deviceOsType});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    req = json['req'];
    un = json['un'];
    pwd = json['pwd'];
    ver = json['ver'];
    deviceUniqueID = json['Device_UniqueID'];
    grkey = json['grkey'];
    deviceOsVersion = json['Device_OsVersion'];
    deviceName = json['Device_Name'];
    deviceOsType = json['Device_OsType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['req'] = this.req;
    data['un'] = this.un;
    data['pwd'] = this.pwd;
    data['ver'] = this.ver;
    data['Device_UniqueID'] = this.deviceUniqueID;
    data['grkey'] = this.grkey;
    data['Device_OsVersion'] = this.deviceOsVersion;
    data['Device_Name'] = this.deviceName;
    data['Device_OsType'] = this.deviceOsType;
    return data;
  }
}
