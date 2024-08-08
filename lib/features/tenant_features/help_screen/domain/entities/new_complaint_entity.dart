import 'package:equatable/equatable.dart';

class NewComplaintEntity extends Equatable {
  final bool success;
  final String message;
  final ComplaintData? data;

  const NewComplaintEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [success, message, data];

  @override
  String toString() =>
      'NewComplaintEntity(success: $success, message: $message, data: $data)';
}

class ComplaintData extends Equatable {
  final String tenentId;
  final String complaint;
  final String status;
  final String id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int v;

  const ComplaintData({
    required this.tenentId,
    required this.complaint,
    required this.status,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  @override
  List<Object?> get props =>
      [tenentId, complaint, status, id, createdAt, updatedAt, v];

  @override
  String toString() =>
      'ComplaintData(tenentId: $tenentId, complaint: $complaint, status: $status, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
}
