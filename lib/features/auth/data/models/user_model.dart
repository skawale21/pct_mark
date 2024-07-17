class BrokerProfile {
  final String id;
  final String name;
  final String userName;
  final String email;
  final String mobileNumber;
  final String password;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final int otp;
  final String token;

  BrokerProfile({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.mobileNumber,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.otp,
    required this.token,
  });

  factory BrokerProfile.fromJson(Map<String, dynamic> json) {
    return BrokerProfile(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      userName: json['userName'] ?? '',
      email: json['email'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      password: json['password'] ?? '',
      createdAt:
          DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime(1970, 1, 1),
      updatedAt:
          DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime(1970, 1, 1),
      v: json['__v'] ?? 0,
      otp: json['otp'] ?? 0,
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'userName': userName,
      'email': email,
      'mobileNumber': mobileNumber,
      'password': password,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
      'otp': otp,
      'token': token,
    };
  }
}
