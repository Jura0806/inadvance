
class OwnerLogin{

  late String login;
  late String password;

  OwnerLogin({required this.login, required this.password});

  OwnerLogin.formJson(Map<String, dynamic> json)
      :login = json["login"],
       password = json["password"];

  Map<String, dynamic> toJson() => {
    "login" :login,
    "password" : password,
  };
}