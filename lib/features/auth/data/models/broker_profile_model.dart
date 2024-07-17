import 'package:pct_mark/features/auth/data/models/user_model.dart';

class BrokerProfileModel extends BrokerProfile {
  BrokerProfileModel(
      {required super.id,
      required super.name,
      required super.userName,
      required super.email,
      required super.mobileNumber,
      required super.password,
      required super.createdAt,
      required super.updatedAt,
      required super.v,
      required super.otp,
      required super.token});

  factory BrokerProfileModel.fromJson(Map<String, dynamic> json) {
    return BrokerProfileModel(
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

  @override
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
