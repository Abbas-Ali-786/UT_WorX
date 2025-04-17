import 'package:cloud_firestore/cloud_firestore.dart';

class WorkSchedulingModel {
  final String workOrderId;
  final String technicianAssigned;
  final DateTime scheduledDate;
  final String estimatedHours;
  final String status;
  final String? createdBy;
  final DateTime? createdAt;

  WorkSchedulingModel({
    required this.workOrderId,
    required this.technicianAssigned,
    required this.scheduledDate,
    required this.estimatedHours,
    required this.status,
    this.createdBy,
    this.createdAt,
  });

  // Firebase سے ڈیٹا حاصل کرنے کے لیے
  factory WorkSchedulingModel.fromJson(Map<String, dynamic> json) {
    return WorkSchedulingModel(
      workOrderId: json['workOrderId'] ?? '',
      technicianAssigned: json['technicianAssigned'] ?? '',
      scheduledDate: json['scheduledDate'] != null
          ? (json['scheduledDate'] as Timestamp).toDate()
          : DateTime.now(),
      estimatedHours: json['estimatedHours'] ?? '',
      status: json['status'] ?? 'Scheduled',
      createdBy: json['createdBy'],
      createdAt: json['createdAt'] != null
          ? (json['createdAt'] as Timestamp).toDate()
          : null,
    );
  }

  // Firebase میں ڈیٹا بھیجنے کے لیے
  Map<String, dynamic> toJson() {
    return {
      'workOrderId': workOrderId,
      'technicianAssigned': technicianAssigned,
      'scheduledDate': scheduledDate,
      'estimatedHours': estimatedHours,
      'status': status,
      'createdBy': createdBy,
      'createdAt': createdAt,
    };
  }
}
