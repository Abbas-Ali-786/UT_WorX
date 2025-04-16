class WorkSchedulingModel {
  final String workOrderId;
  final String technicianAssigned;
  final int scheduledDate;
  final String estimatedHours;
  final String status;

  WorkSchedulingModel({
    required this.workOrderId,
    required this.technicianAssigned,
    required this.scheduledDate,
    required this.estimatedHours,
    required this.status,
  });

  // Firebase سے ڈیٹا حاصل کرنے کے لیے
  factory WorkSchedulingModel.fromJson(Map<String, dynamic> json) {
    return WorkSchedulingModel(
      workOrderId: json['workOrderId'] ?? '',
      technicianAssigned: json['technicianAssigned'] ?? '',
      scheduledDate: json['scheduledDate'] ?? 0,
      estimatedHours: json['estimatedHours'] ?? '',
      status: json['status'] ?? '',
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
    };
  }
}
