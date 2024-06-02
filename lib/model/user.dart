class User {
  final String email;
  final String nicename;
  final String displayName;

  User({
    required this.email,
    required this.nicename,
    required this.displayName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['user_email'] as String,
      nicename: json['user_nicename'] as String,
      displayName: json['user_display_name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_email': email,
      'user_nicename': nicename,
      'user_display_name': displayName,
    };
  }
}