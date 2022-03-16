class SignIn {
  late String login;
  late String password;

  SignIn({required this.login, required this.password});

  SignIn.formJson(Map<String, dynamic> json)
      : login = json["login"],
        password = json["password"];

  Map<String, dynamic> toJson() => {
        "login": login,
        "password": password,
      };
}
