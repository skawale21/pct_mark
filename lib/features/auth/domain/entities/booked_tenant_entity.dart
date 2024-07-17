// domain/entities/flat.dart

import 'package:equatable/equatable.dart';

class Flat {
  final bool success;
  final String message;
  final FlatData data;
  final String token;

  Flat({
    required this.success,
    required this.message,
    required this.data,
    required this.token,
  });
}

class FlatData {
  final String flatType;
  final int flatNumber;
  final Rooms rooms;
  final String id;
  final BookedTenentEntity bookedTenent;
  final String propertyId;
  final String name;

  FlatData({
    required this.flatType,
    required this.flatNumber,
    required this.rooms,
    required this.id,
    required this.bookedTenent,
    required this.propertyId,
    required this.name,
  });
}

class Rooms {
  final int roomNumber;
  final Beds beds;
  final String id;

  Rooms({
    required this.roomNumber,
    required this.beds,
    required this.id,
  });
}

class Beds {
  final int bedNumber;
  final String status;
  final String bookedTenentId;
  final String? noticeTenentId;
  final String id;

  Beds({
    required this.bedNumber,
    required this.status,
    required this.bookedTenentId,
    this.noticeTenentId,
    required this.id,
  });
}

class BookedTenentEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String mobileNumber;
  final String password;
  final String createdAt;
  final String updatedAt;
  final String profileImage;
  final String identityProof;
  final String addressProof;
  final String rentAgreement;
  final String leavingDate;
  final int monthlyRent;
  final String rentPayDate;
  final int securityDeposite;

  const BookedTenentEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.profileImage,
    required this.identityProof,
    required this.addressProof,
    required this.rentAgreement,
    required this.leavingDate,
    required this.monthlyRent,
    required this.rentPayDate,
    required this.securityDeposite,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        mobileNumber,
        profileImage,
        identityProof,
        addressProof,
        rentAgreement,
        leavingDate,
        monthlyRent,
        rentPayDate,
        securityDeposite,
      ];
}
