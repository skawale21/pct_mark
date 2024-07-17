// data/models/broker_login_model.dart

import 'package:pct_mark/features/auth/domain/entities/broker_login_entity.dart';

class BrokerLoginModel extends BrokerLoginEntity {
  const BrokerLoginModel({
    required super.success,
    required super.message,
    required BrokerDataModel super.data,
    required super.token,
  });

  factory BrokerLoginModel.fromJson(Map<String, dynamic> json) {
    return BrokerLoginModel(
      success: json['success'],
      message: json['message'],
      data: BrokerDataModel.fromJson(json['data']),
      token: json['token'],
    );
  }
}

class BrokerDataModel extends BrokerDataEntity {
  const BrokerDataModel({
    required super.id,
    required super.name,
    required super.userName,
    required super.email,
    required super.mobileNumber,
    required super.password,
    required super.createdAt,
    required super.updatedAt,
    required super.otp,
    required super.version,
  });

  factory BrokerDataModel.fromJson(Map<String, dynamic> json) {
    return BrokerDataModel(
      id: json['_id'],
      name: json['name'],
      userName: json['userName'],
      email: json['email'],
      mobileNumber: json['mobileNumber'],
      password: json['password'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      otp: json['otp'],
      version: json['__v'],
    );
  }
}
