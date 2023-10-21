class UserData {
  String username;
  String password;
  bool remeberMe;
  String empcode;

  UserData(
      {required this.username,
      required this.password,
      required this.empcode,
      required this.remeberMe});

  UserData.fromJson(Map<String, dynamic> json)
      : username = json["username"],
        password = json["password"],
        empcode = json["empcode"],
        remeberMe = json["remeberMe"];

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'empcode': empcode,
        'remeberMe': remeberMe
      };
}
