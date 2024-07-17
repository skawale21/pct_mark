// data/models/flat_model.dart

import 'package:pct_mark/features/auth/domain/entities/booked_tenant_entity.dart';

class FlatModel extends Flat {
  FlatModel({
    required super.success,
    required super.message,
    required FlatDataModel super.data,
    required super.token,
  });

  factory FlatModel.fromJson(Map<String, dynamic> json) {
    return FlatModel(
      success: json['success'],
      message: json['message'],
      data: FlatDataModel.fromJson(json['data']),
      token: json['token'],
    );
  }
}

class FlatDataModel extends FlatData {
  FlatDataModel({
    required super.flatType,
    required super.flatNumber,
    required RoomsModel super.rooms,
    required super.id,
    required BookedTenentModel super.bookedTenent,
    required super.propertyId,
    required super.name,
  });

  factory FlatDataModel.fromJson(Map<String, dynamic> json) {
    return FlatDataModel(
      flatType: json['flatType'],
      flatNumber: json['flatNumber'],
      rooms: RoomsModel.fromJson(json['rooms']),
      id: json['_id'],
      bookedTenent: BookedTenentModel.fromJson(json['bookedTenent']),
      propertyId: json['propertyId'],
      name: json['name'],
    );
  }
}

class RoomsModel extends Rooms {
  RoomsModel({
    required super.roomNumber,
    required BedsModel super.beds,
    required super.id,
  });

  factory RoomsModel.fromJson(Map<String, dynamic> json) {
    return RoomsModel(
      roomNumber: json['roomNumber'],
      beds: BedsModel.fromJson(json['beds']),
      id: json['_id'],
    );
  }
}

class BedsModel extends Beds {
  BedsModel({
    required super.bedNumber,
    required super.status,
    required super.bookedTenentId,
    super.noticeTenentId,
    required super.id,
  });

  factory BedsModel.fromJson(Map<String, dynamic> json) {
    return BedsModel(
      bedNumber: json['bedNumber'],
      status: json['status'],
      bookedTenentId: json['bookedTenentId'],
      noticeTenentId: json['noticeTenentId'],
      id: json['_id'],
    );
  }
}

class BookedTenentModel extends BookedTenentEntity {
  const BookedTenentModel({
    required super.id,
    required super.name,
    required super.email,
    required super.mobileNumber,
    required super.password,
    required super.createdAt,
    required super.updatedAt,
    required super.profileImage,
    required super.identityProof,
    required super.addressProof,
    required super.rentAgreement,
    required super.leavingDate,
    required super.monthlyRent,
    required super.rentPayDate,
    required super.securityDeposite,
  });

  factory BookedTenentModel.fromJson(Map<String, dynamic> json) {
    return BookedTenentModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      mobileNumber: json['mobileNumber'],
      password: json['password'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      profileImage: json['profileImage'],
      identityProof: json['identityProof'],
      addressProof: json['addressProof'],
      rentAgreement: json['rentAgreement'],
      leavingDate: json['leavingDate'],
      monthlyRent: json['monthlyRent'],
      rentPayDate: json['rentPayDate'],
      securityDeposite: json['securityDeposite'],
    );
  }
}
