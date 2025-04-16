class NotificationDataModel {
  final String workOrderId;
  final String workType;
  final String assetId;
  final String createdBy;
  final String status;
  final String priority;

  NotificationDataModel({
    required this.workOrderId,
    required this.workType,
    required this.assetId,
    required this.createdBy,
    required this.status,
    required this.priority,
  });

  // Firebase سے ڈیٹا حاصل کرنے کے لیے
  factory NotificationDataModel.fromJson(Map<String, dynamic> json) {
    return NotificationDataModel(
      workOrderId: json['workOrderId'] ?? '',
      workType: json['workType'] ?? '',
      assetId: json['assetId'] ?? '',
      createdBy: json['createdBy'] ?? '',
      status: json['status'] ?? '',
      priority: json['priority'] ?? '',
    );
  }

  // Firebase میں ڈیٹا بھیجنے کے لیے
  Map<String, dynamic> toJson() {
    return {
      'workOrderId': workOrderId,
      'workType': workType,
      'assetId': assetId,
      'createdBy': createdBy,
      'status': status,
      'priority': priority,
    };
  }
}
