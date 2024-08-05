import 'package:pct_mark/features/auth/domain/entities/tenant_entity.dart';

class TenantModel extends TenantEntity {
  const TenantModel({
    required super.success,
    required super.message,
    required super.data,
    required super.token,
  });

  factory TenantModel.fromJson(Map<String, dynamic> json) {
    return TenantModel(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] == null ? null : DataModel.fromJson(json["data"]),
      token: json["token"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "token": token,
      };
}

class DataModel extends Data {
  const DataModel({
    required super.flatType,
    required super.flatNumber,
    required super.rooms,
    required super.id,
    required super.bookedTenant,
    required super.propertyId,
    required super.name,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      flatType: json["flatType"] ?? "",
      flatNumber: json["flatNumber"] ?? 0,
      rooms: json["rooms"] == null ? null : RoomsModel.fromJson(json["rooms"]),
      id: json["_id"] ?? "",
      bookedTenant: json["bookedTenant"] == null
          ? null
          : BookedTenantModel.fromJson(json["bookedTenant"]),
      propertyId: json["propertyId"] ?? "",
      name: json["name"] ?? "",
    );
  }

  @override
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

class BookedTenantModel extends BookedTenant {
  const BookedTenantModel({
    required super.id,
    required super.name,
    required super.email,
    required super.mobileNumber,
    required super.password,
    required super.address1,
    required super.address2,
    required super.createdAt,
    required super.updatedAt,
    required super.v,
    required super.aadhaarNumber,
    required super.addressProof,
    required super.altMobileNumber,
    required super.identityProof,
    required super.joiningDate,
    required super.leavingDate,
    required super.monthlyRent,
    required super.profileImage,
    required super.rentAgreement,
    required super.rentPayDate,
    required super.securityDeposite,
  });

  factory BookedTenantModel.fromJson(Map<String, dynamic> json) {
    return BookedTenantModel(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      mobileNumber: json["mobileNumber"] ?? "",
      password: json["password"] ?? "",
      address1: json["address1"] ?? "",
      address2: json["address2"] ?? "",
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"] ?? 0,
      aadhaarNumber: json["aadhaarNumber"] ?? "",
      addressProof: json["addressProof"] ?? "",
      altMobileNumber: json["altMobileNumber"] ?? "",
      identityProof: json["identityProof"] ?? "",
      joiningDate: DateTime.tryParse(json["joiningDate"] ?? ""),
      leavingDate: DateTime.tryParse(json["leavingDate"] ?? ""),
      monthlyRent: json["monthlyRent"] ?? 0,
      profileImage: json["profileImage"] ?? "",
      rentAgreement: json["rentAgreement"] ?? "",
      rentPayDate: DateTime.tryParse(json["rentPayDate"] ?? ""),
      securityDeposite: json["securityDeposite"] ?? 0,
    );
  }

  @override
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

class RoomsModel extends Rooms {
  const RoomsModel({
    required super.totalRooms,
    required super.vacantRooms,
    required super.occupiedRooms,
  });

  factory RoomsModel.fromJson(Map<String, dynamic> json) {
    return RoomsModel(
      totalRooms: json["totalRooms"] ?? 0,
      vacantRooms: json["vacantRooms"] ?? 0,
      occupiedRooms: json["occupiedRooms"] ?? 0,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "totalRooms": totalRooms,
        "vacantRooms": vacantRooms,
        "occupiedRooms": occupiedRooms,
      };
}
