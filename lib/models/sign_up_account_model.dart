class SignUpAccount {
  late int role_id;
  late String full_name;
  late int phone;
  late String login;
  late String password;
  late String verify_password;

  SignUpAccount(
      {required this.full_name,
      required this.phone,
      required this.login,
      required this.password,
      required this.verify_password,
      required this.role_id});

  SignUpAccount.fromJson(Map<String, dynamic> json)
      : full_name = json["full_name"],
        phone = json["phone"],
        login = json["login"],
        password = json["password"],
        verify_password = json["verify_password"],
        role_id = json["role_id"];

  Map<String, dynamic> toJson() => {
        "full_name": full_name,
        "phone": phone,
        "login": login,
        "password": password,
        "verify_password": verify_password,
        "role_id": role_id,
      };
}
