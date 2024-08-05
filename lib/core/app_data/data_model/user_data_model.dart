class UserData {
  final String userType;
  final String token;
  final bool rememberMe;

  UserData({
    required this.userType,
    required this.token,
    required this.rememberMe,
  });

  Map<String, dynamic> toJson() {
    return {
      'userType': userType,
      'token': token,
      'rememberMe': rememberMe,
    };
  }

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userType: json['userType'],
      token: json['token'],
      rememberMe: json['rememberMe'],
    );
  }
}
