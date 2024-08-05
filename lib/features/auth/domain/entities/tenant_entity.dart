import 'package:equatable/equatable.dart';

class TenantEntity extends Equatable {
  final bool success;
  final String message;
  final Data? data;
  final String token;

  const TenantEntity({
    required this.success,
    required this.message,
    required this.data,
    required this.token,
  });

  @override
  List<Object?> get props => [success, message, data, token];
}

class Data extends Equatable {
  final String flatType;
  final int flatNumber;
  final Rooms? rooms;
  final String id;
  final BookedTenant? bookedTenant;
  final String propertyId;
  final String name;

  const Data({
    required this.flatType,
    required this.flatNumber,
    required this.rooms,
    required this.id,
    required this.bookedTenant,
    required this.propertyId,
    required this.name,
  });

  @override
  List<Object?> get props =>
      [flatType, flatNumber, rooms, id, bookedTenant, propertyId, name];

  Map<String, dynamic> toJson() => {
        "flatType": flatType,
        "flatNumber": flatNumber,
        "rooms": rooms?.toJson(),
        "_id": id,
        "bookedTenant": bookedTenant?.toJson(),
        "propertyId": propertyId,
        "name": name,
      };
}

class BookedTenant extends Equatable {
  final String id;
  final String name;
  final String email;
  final String mobileNumber;
  final String password;
  final String address1;
  final String address2;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int v;
  final String aadhaarNumber;
  final String addressProof;
  final String altMobileNumber;
  final String identityProof;
  final DateTime? joiningDate;
  final DateTime? leavingDate;
  final int monthlyRent;
  final String profileImage;
  final String rentAgreement;
  final DateTime? rentPayDate;
  final int securityDeposite;

  const BookedTenant({
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
    required this.securityDeposite,
  });

  @override
  List<Object?> get props => [
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
        securityDeposite,
      ];

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "mobileNumber": mobileNumber,
        "password": password,
        "address1": address1,
        "address2": address2,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "aadhaarNumber": aadhaarNumber,
        "addressProof": addressProof,
        "altMobileNumber": altMobileNumber,
        "identityProof": identityProof,
        "joiningDate": joiningDate?.toIso8601String(),
        "leavingDate": leavingDate?.toIso8601String(),
        "monthlyRent": monthlyRent,
        "profileImage": profileImage,
        "rentAgreement": rentAgreement,
        "rentPayDate": rentPayDate?.toIso8601String(),
        "securityDeposite": securityDeposite,
      };
}

class Rooms extends Equatable {
  final int totalRooms;
  final int vacantRooms;
  final int occupiedRooms;

  const Rooms({
    required this.totalRooms,
    required this.vacantRooms,
    required this.occupiedRooms,
  });

  @override
  List<Object?> get props => [totalRooms, vacantRooms, occupiedRooms];

  Map<String, dynamic> toJson() => {
        "totalRooms": totalRooms,
        "vacantRooms": vacantRooms,
        "occupiedRooms": occupiedRooms,
      };
}
