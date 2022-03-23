class SignIn {
  late String login;
  late String password;
  String? token;
  String? id;

  SignIn({required this.login, required this.password, this.token, this.id});

  SignIn.formJson(Map<dynamic, dynamic> json)
      : login = json["login"],
        password = json["password"],
        token = json["token"],
        id = json["id"];

  Map<dynamic, dynamic> toJson() => {
        "login": login,
        "password": password,
        "token": token,
        "id": id,
      };
}
