import 'package:equatable/equatable.dart';

class TenantEntity extends Equatable {
  final bool success;
  final String message;
  final TenantDataEntity data;
  final String token;

  const TenantEntity({
    required this.success,
    required this.message,
    required this.data,
    required this.token,
  });

  @override
  List<Object> get props => [success, message, data, token];
}

class TenantDataEntity extends Equatable {
  final String flatType;
  final int flatNumber;
  final TenantRoomsEntity rooms;
  final String id;
  final String name;
  final String propertyId;

  const TenantDataEntity({
    required this.flatType,
    required this.flatNumber,
    required this.rooms,
    required this.id,
    required this.name,
    required this.propertyId,
  });

  @override
  List<Object> get props => [flatType, flatNumber, rooms, id, name, propertyId];
}

class TenantRoomsEntity extends Equatable {
  final int roomNumber;
  final TenantBedsEntity beds;
  final String id;

  const TenantRoomsEntity({
    required this.roomNumber,
    required this.beds,
    required this.id,
  });

  @override
  List<Object> get props => [roomNumber, beds, id];
}

class TenantBedsEntity extends Equatable {
  final int bedNumber;
  final String status;
  final String bookedTenantId;
  final String? noticeTenantId;
  final String id;

  const TenantBedsEntity({
    required this.bedNumber,
    required this.status,
    required this.bookedTenantId,
    this.noticeTenantId,
    required this.id,
  });

  @override
  List<Object> get props =>
      [bedNumber, status, bookedTenantId, noticeTenantId ?? '', id];
}

class BookedTenantEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String mobileNumber;
  final String password;
  final String address1;
  final String address2;
  final String createdAt;
  final String updatedAt;
  final int v;
  final String aadhaarNumber;
  final String addressProof;
  final String altMobileNumber;
  final String identityProof;
  final String joiningDate;
  final String leavingDate;
  final int monthlyRent;
  final String profileImage;
  final String rentAgreement;
  final String rentPayDate;
  final int securityDeposit;

  const BookedTenantEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.password,
    required this.address1,
    required this.address2,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.aadhaarNumber,
    required this.addressProof,
    required this.altMobileNumber,
    required this.identityProof,
    required this.joiningDate,
    required this.leavingDate,
    required this.monthlyRent,
    required this.profileImage,
    required this.rentAgreement,
    required this.rentPayDate,
    required this.securityDeposit,
  });

  @override
  List<Object> get props => [
        id,
        name,
        email,
        mobileNumber,
        password,
        address1,
        address2,
        createdAt,
        updatedAt,
        v,
        aadhaarNumber,
        addressProof,
        altMobileNumber,
        identityProof,
        joiningDate,
        leavingDate,
        monthlyRent,
        profileImage,
        rentAgreement,
        rentPayDate,
        securityDeposit,
      ];
}
