class SignUpRequestData {
  final String username;
  final String email;
  final String password;

  SignUpRequestData({
    required this.username,
    required this.email,
    required this.password,
  });


  factory SignUpRequestData.fromJson(Map<String, dynamic> json) {
    return SignUpRequestData(
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
