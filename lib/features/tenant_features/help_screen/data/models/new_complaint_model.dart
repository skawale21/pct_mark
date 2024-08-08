import 'package:pct_mark/features/tenant_features/help_screen/domain/entities/new_complaint_entity.dart';

class NewComplaintModel extends NewComplaintEntity {
  const NewComplaintModel({
    required super.success,
    required super.message,
    ComplaintDataModel? super.data,
  });

  factory NewComplaintModel.fromJson(Map<String, dynamic> json) {
    return NewComplaintModel(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null
          ? ComplaintDataModel.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': (data as ComplaintDataModel?)?.toJson(),
    };
  }
}

class ComplaintDataModel extends ComplaintData {
  const ComplaintDataModel({
    required super.tenentId,
    required super.complaint,
    required super.status,
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.v,
  });

  factory ComplaintDataModel.fromJson(Map<String, dynamic> json) {
    return ComplaintDataModel(
      tenentId: json['tenentId'],
      complaint: json['complaint'],
      status: json['status'],
      id: json['_id'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tenentId': tenentId,
      'complaint': complaint,
      'status': status,
      '_id': id,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
    };
  }
}
