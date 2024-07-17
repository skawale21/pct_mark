// domain/entities/broker_login_entity.dart

import 'package:equatable/equatable.dart';

class BrokerLoginEntity extends Equatable {
  final bool success;
  final String message;
  final BrokerDataEntity data;
  final String token;

  const BrokerLoginEntity({
    required this.success,
    required this.message,
    required this.data,
    required this.token,
  });

  @override
  List<Object?> get props => [success, message, data, token];
}

class BrokerDataEntity extends Equatable {
  final String id;
  final String name;
  final String userName;
  final String email;
  final String mobileNumber;
  final String password;
  final String createdAt;
  final String updatedAt;
  final int otp;
  final int version;

  const BrokerDataEntity({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.mobileNumber,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.otp,
    required this.version,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        userName,
        email,
        mobileNumber,
        password,
        createdAt,
        updatedAt,
        otp,
        version
      ];
}
