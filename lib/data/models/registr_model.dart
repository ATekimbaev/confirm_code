class RegitsrModel {
  String? email;
  String? username;
  String? password;
  String? passwordConfirm;

  RegitsrModel(
      {this.email, this.username, this.password, this.passwordConfirm});

  RegitsrModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    password = json['password'];
    passwordConfirm = json['password_confirm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    data['password_confirm'] = passwordConfirm;
    return data;
  }
}
