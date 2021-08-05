class LoginModel {
  String username;
  String userpass;

  LoginModel(this.username, this.userpass);

  LoginModel.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        userpass = json['userpass'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'userpass': userpass,
      };

  @override
  String toString() {
    return 'LoginModel{username: $username, userpass: $userpass}';
  }
}

class RegisterModel {
  String username;
  String userpass;

  RegisterModel(this.username, this.userpass);

  RegisterModel.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        userpass = json['userpass'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'userpass': userpass,
      };

  @override
  String toString() {
    return 'RegisterModel{username: $username, userpass: $userpass}';
  }
}

class UserModel {
  int id;
  String userName;
  String userPass;

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userName = json['userName'],
        userPass = json['userPass'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'userName': userName,
        'userPass': userPass,
      };

  @override
  String toString() {
    return 'UserModel{id: $id, userName: $userName, userPass: $userPass}';
  }
}
