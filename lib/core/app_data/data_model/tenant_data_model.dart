import 'package:equatable/equatable.dart';

class TenantData extends Equatable {
  const TenantData({
    required this.success,
    required this.message,
    required this.data,
    required this.token,
  });

  final bool success;
  final String message;
  final Data? data;
  final String token;

  TenantData copyWith({
    bool? success,
    String? message,
    Data? data,
    String? token,
  }) {
    return TenantData(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
      token: token ?? this.token,
    );
  }

  factory TenantData.fromJson(Map<String, dynamic> json) {
    return TenantData(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      token: json["token"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "token": token,
      };

  @override
  String toString() {
    return "$success, $message, $data, $token, ";
  }

  @override
  List<Object?> get props => [
        success,
        message,
        data,
        token,
      ];
}

class Data extends Equatable {
  const Data({
    required this.flatType,
    required this.flatNumber,
    required this.rooms,
    required this.id,
    required this.bookedTenent,
    required this.propertyId,
    required this.name,
  });

  final String flatType;
  final int flatNumber;
  final Rooms? rooms;
  final String id;
  final BookedTenent? bookedTenent;
  final String propertyId;
  final String name;

  Data copyWith({
    String? flatType,
    int? flatNumber,
    Rooms? rooms,
    String? id,
    BookedTenent? bookedTenent,
    String? propertyId,
    String? name,
  }) {
    return Data(
      flatType: flatType ?? this.flatType,
      flatNumber: flatNumber ?? this.flatNumber,
      rooms: rooms ?? this.rooms,
      id: id ?? this.id,
      bookedTenent: bookedTenent ?? this.bookedTenent,
      propertyId: propertyId ?? this.propertyId,
      name: name ?? this.name,
    );
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      flatType: json["flatType"] ?? "",
      flatNumber: json["flatNumber"] ?? 0,
      rooms: json["rooms"] == null ? null : Rooms.fromJson(json["rooms"]),
      id: json["_id"] ?? "",
      bookedTenent: json["bookedTenent"] == null
          ? null
          : BookedTenent.fromJson(json["bookedTenent"]),
      propertyId: json["propertyId"] ?? "",
      name: json["name"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "flatType": flatType,
        "flatNumber": flatNumber,
        "rooms": rooms?.toJson(),
        "_id": id,
        "bookedTenent": bookedTenent?.toJson(),
        "propertyId": propertyId,
        "name": name,
      };

  @override
  String toString() {
    return "$flatType, $flatNumber, $rooms, $id, $bookedTenent, $propertyId, $name, ";
  }

  @override
  List<Object?> get props => [
        flatType,
        flatNumber,
        rooms,
        id,
        bookedTenent,
        propertyId,
        name,
      ];
}

class BookedTenent extends Equatable {
  const BookedTenent({
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

  BookedTenent copyWith({
    String? id,
    String? name,
    String? email,
    String? mobileNumber,
    String? password,
    String? address1,
    String? address2,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    String? aadhaarNumber,
    String? addressProof,
    String? altMobileNumber,
    String? identityProof,
    DateTime? joiningDate,
    DateTime? leavingDate,
    int? monthlyRent,
    String? profileImage,
    String? rentAgreement,
    DateTime? rentPayDate,
    int? securityDeposite,
  }) {
    return BookedTenent(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      password: password ?? this.password,
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
      aadhaarNumber: aadhaarNumber ?? this.aadhaarNumber,
      addressProof: addressProof ?? this.addressProof,
      altMobileNumber: altMobileNumber ?? this.altMobileNumber,
      identityProof: identityProof ?? this.identityProof,
      joiningDate: joiningDate ?? this.joiningDate,
      leavingDate: leavingDate ?? this.leavingDate,
      monthlyRent: monthlyRent ?? this.monthlyRent,
      profileImage: profileImage ?? this.profileImage,
      rentAgreement: rentAgreement ?? this.rentAgreement,
      rentPayDate: rentPayDate ?? this.rentPayDate,
      securityDeposite: securityDeposite ?? this.securityDeposite,
    );
  }

  factory BookedTenent.fromJson(Map<String, dynamic> json) {
    return BookedTenent(
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

  @override
  String toString() {
    return "$id, $name, $email, $mobileNumber, $password, $address1, $address2, $createdAt, $updatedAt, $v, $aadhaarNumber, $addressProof, $altMobileNumber, $identityProof, $joiningDate, $leavingDate, $monthlyRent, $profileImage, $rentAgreement, $rentPayDate, $securityDeposite, ";
  }

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
}

class Rooms extends Equatable {
  const Rooms({
    required this.roomNumber,
    required this.beds,
    required this.id,
  });

  final int roomNumber;
  final Beds? beds;
  final String id;

  Rooms copyWith({
    int? roomNumber,
    Beds? beds,
    String? id,
  }) {
    return Rooms(
      roomNumber: roomNumber ?? this.roomNumber,
      beds: beds ?? this.beds,
      id: id ?? this.id,
    );
  }

  factory Rooms.fromJson(Map<String, dynamic> json) {
    return Rooms(
      roomNumber: json["roomNumber"] ?? 0,
      beds: json["beds"] == null ? null : Beds.fromJson(json["beds"]),
      id: json["_id"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "roomNumber": roomNumber,
        "beds": beds?.toJson(),
        "_id": id,
      };

  @override
  String toString() {
    return "$roomNumber, $beds, $id, ";
  }

  @override
  List<Object?> get props => [
        roomNumber,
        beds,
        id,
      ];
}

class Beds extends Equatable {
  const Beds({
    required this.bedNumber,
    required this.status,
    required this.bookedTenentId,
    required this.noticeTenentId,
    required this.id,
  });

  final int bedNumber;
  final String status;
  final String bookedTenentId;
  final dynamic noticeTenentId;
  final String id;

  Beds copyWith({
    int? bedNumber,
    String? status,
    String? bookedTenentId,
    dynamic noticeTenentId,
    String? id,
  }) {
    return Beds(
      bedNumber: bedNumber ?? this.bedNumber,
      status: status ?? this.status,
      bookedTenentId: bookedTenentId ?? this.bookedTenentId,
      noticeTenentId: noticeTenentId ?? this.noticeTenentId,
      id: id ?? this.id,
    );
  }

  factory Beds.fromJson(Map<String, dynamic> json) {
    return Beds(
      bedNumber: json["bedNumber"] ?? 0,
      status: json["status"] ?? "",
      bookedTenentId: json["bookedTenentId"] ?? "",
      noticeTenentId: json["noticeTenentId"],
      id: json["_id"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "bedNumber": bedNumber,
        "status": status,
        "bookedTenentId": bookedTenentId,
        "noticeTenentId": noticeTenentId,
        "_id": id,
      };

  @override
  String toString() {
    return "$bedNumber, $status, $bookedTenentId, $noticeTenentId, $id, ";
  }

  @override
  List<Object?> get props => [
        bedNumber,
        status,
        bookedTenentId,
        noticeTenentId,
        id,
      ];
}

/*
{
	"success": true,
	"message": "Logged in successfully",
	"data": {
		"flatType": "1BHK",
		"flatNumber": 101,
		"rooms": {
			"roomNumber": 1,
			"beds": {
				"bedNumber": 1,
				"status": "Booked",
				"bookedTenentId": "66add4276d37726eac83cd7a",
				"noticeTenentId": null,
				"_id": "66add2856d37726eac83cc26"
			},
			"_id": "66add2856d37726eac83cc25"
		},
		"_id": "66add2856d37726eac83cc24",
		"bookedTenent": {
			"_id": "66add4276d37726eac83cd7a",
			"name": "Pavan",
			"email": "pavan@gmail.com",
			"mobileNumber": "1234509876",
			"password": "$2b$10$dDTHJkV3hbdNtmvIfRluHupYlw1utzUSnATN/udGdOn5wUiVggnCG",
			"address1": "Digras",
			"address2": "Nagpur",
			"createdAt": "2024-08-03T06:54:31.977Z",
			"updatedAt": "2024-08-03T09:50:58.838Z",
			"__v": 0,
			"aadhaarNumber": "123456789012",
			"addressProof": "/public/images/202483_95058_r1vdxsofz5.png",
			"altMobileNumber": "9890098900",
			"identityProof": "/public/images/202483_95058_mpui56divp9.jpeg",
			"joiningDate": "2024-07-24T14:38:36.332Z",
			"leavingDate": "2027-07-24T14:38:36.332Z",
			"monthlyRent": 25000,
			"profileImage": "/public/images/202483_95058_duxa8fy6z9.jpeg",
			"rentAgreement": "/public/images/202483_95058_2kkwtgo45u6.jpeg",
			"rentPayDate": "2024-07-24T14:38:36.332Z",
			"securityDeposite": 50000
		},
		"propertyId": "66add2576d37726eac83cc21",
		"name": "Atul PG"
	},
	"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YWRkNDI3NmQzNzcyNmVhYzgzY2Q3YSIsImlhdCI6MTcyMjc4Njc1Nn0.c5WteFlZ4M-421YnZldbiaPK-Dm64RF3WeV2gABQY8g"
}*/