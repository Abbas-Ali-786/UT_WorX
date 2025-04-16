class ReportGeneratorModel {
  final String workOrderId;
  final int assetId;
  final String completionDate;
  final String status;

  ReportGeneratorModel({
    required this.workOrderId,
    required this.assetId,
    required this.completionDate,
    required this.status,
  });

  // Firebase سے ڈیٹا حاصل کرنے کے لیے
  factory ReportGeneratorModel.fromJson(Map<String, dynamic> json) {
    return ReportGeneratorModel(
      workOrderId: json['workOrderId'] ?? '',
      assetId: json['assetId'] ?? 0,
      completionDate: json['completionDate'] ?? '',
      status: json['status'] ?? '',
    );
  }

  // Firebase میں ڈیٹا بھیجنے کے لیے
  Map<String, dynamic> toJson() {
    return {
      'workOrderId': workOrderId,
      'assetId': assetId,
      'completionDate': completionDate,
      'status': status,
    };
  }
}
