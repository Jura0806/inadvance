class OwnerSignIn {
  late String login;
  late String password;

  OwnerSignIn({required this.login, required this.password});

  OwnerSignIn.formJson(Map<String, dynamic> json)
      : login = json["login"],
        password = json["password"];

  Map<String, dynamic> toJson() => {
        "login": login,
        "password": password,
      };
}
