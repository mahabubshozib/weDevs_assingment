class LoginRequest {
  String username;
  String password;


  LoginRequest({
    required this.password,
    required this.username,
  });

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };
}