class LoginModel {
  String username = '';
  String password = '';
  bool fromLecturerLoginPage = false;

  LoginModel({required this.username, required this.password, required this.fromLecturerLoginPage});

  LoginModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    fromLecturerLoginPage = json['fromLecturerLoginPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['fromLecturerLoginPage'] = fromLecturerLoginPage;
    return data;
  }
}
