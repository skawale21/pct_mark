import 'package:pct_mark/features/auth/domain/entities/tenant_entity.dart';

class TenantModel extends TenantEntity {
  const TenantModel({
    required super.success,
    required super.message,
    required TenantDataModel super.data,
    required super.token,
  });

  factory TenantModel.fromJson(Map<String, dynamic> json) {
    return TenantModel(
      success: json['success'],
      message: json['message'],
      data: TenantDataModel.fromJson(json['data']),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': (data as TenantDataModel).toJson(),
      'token': token,
    };
  }
}

class TenantDataModel extends TenantDataEntity {
  const TenantDataModel({
    required super.flatType,
    required super.flatNumber,
    required TenantRoomsModel super.rooms,
    required super.id,
    required super.name,
    required super.propertyId,
  });

  factory TenantDataModel.fromJson(Map<String, dynamic> json) {
    return TenantDataModel(
      flatType: json['flatType'],
      flatNumber: json['flatNumber'],
      rooms: TenantRoomsModel.fromJson(json['rooms']),
      id: json['_id'],
      name: json['name'],
      propertyId: json['propertyId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'flatType': flatType,
      'flatNumber': flatNumber,
      'rooms': (rooms as TenantRoomsModel).toJson(),
      '_id': id,
      'name': name,
      'propertyId': propertyId,
    };
  }
}

class TenantRoomsModel extends TenantRoomsEntity {
  const TenantRoomsModel({
    required super.roomNumber,
    required TenantBedsModel super.beds,
    required super.id,
  });

  factory TenantRoomsModel.fromJson(Map<String, dynamic> json) {
    return TenantRoomsModel(
      roomNumber: json['roomNumber'],
      beds: TenantBedsModel.fromJson(json['beds']),
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roomNumber': roomNumber,
      'beds': (beds as TenantBedsModel).toJson(),
      '_id': id,
    };
  }
}

class TenantBedsModel extends TenantBedsEntity {
  const TenantBedsModel({
    required super.bedNumber,
    required super.status,
    required super.bookedTenantId,
    super.noticeTenantId,
    required super.id,
  });

  factory TenantBedsModel.fromJson(Map<String, dynamic> json) {
    return TenantBedsModel(
      bedNumber: json['bedNumber'],
      status: json['status'],
      bookedTenantId: json['bookedTenentId'],
      noticeTenantId: json['noticeTenantId'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bedNumber': bedNumber,
      'status': status,
      'bookedTenentId': bookedTenantId,
      'noticeTenantId': noticeTenantId,
      '_id': id,
    };
  }
}

class BookedTenantModel extends BookedTenantEntity {
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
    required super.securityDeposit,
  });

  factory BookedTenantModel.fromJson(Map<String, dynamic> json) {
    return BookedTenantModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      mobileNumber: json['mobileNumber'],
      password: json['password'],
      address1: json['address1'],
      address2: json['address2'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
      aadhaarNumber: json['aadhaarNumber'],
      addressProof: json['addressProof'],
      altMobileNumber: json['altMobileNumber'],
      identityProof: json['identityProof'],
      joiningDate: json['joiningDate'],
      leavingDate: json['leavingDate'],
      monthlyRent: json['monthlyRent'],
      profileImage: json['profileImage'],
      rentAgreement: json['rentAgreement'],
      rentPayDate: json['rentPayDate'],
      securityDeposit: json['securityDeposite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'mobileNumber': mobileNumber,
      'password': password,
      'address1': address1,
      'address2': address2,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
      'aadhaarNumber': aadhaarNumber,
      'addressProof': addressProof,
      'altMobileNumber': altMobileNumber,
      'identityProof': identityProof,
      'joiningDate': joiningDate,
      'leavingDate': leavingDate,
      'monthlyRent': monthlyRent,
      'profileImage': profileImage,
      'rentAgreement': rentAgreement,
      'rentPayDate': rentPayDate,
      'securityDeposite': securityDeposit,
    };
  }
}
