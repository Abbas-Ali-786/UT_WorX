class ServiceReportModel {
  final String reportId;
  final String workOrderId;
  final String assetId;
  final String finalFindings;
  final String sparePartsUsed;
  final DateTime completionDate;
  final String technician;

  ServiceReportModel({
    required this.reportId,
    required this.workOrderId,
    required this.assetId,
    required this.finalFindings,
    required this.sparePartsUsed,
    required this.completionDate,
    required this.technician,
  });

  // Firebase سے ڈیٹا حاصل کرنے کے لیے
  factory ServiceReportModel.fromJson(Map<String, dynamic> json) {
    return ServiceReportModel(
      reportId: json['reportId'] ?? '',
      workOrderId: json['workOrderId'] ?? '',
      assetId: json['assetId'] ?? '',
      finalFindings: json['finalFindings'] ?? '',
      sparePartsUsed: json['sparePartsUsed'] ?? '',
      // Firebase میں DateTime کو Timestamp کے طور پر سٹور کیا جاتا ہے
      completionDate: json['completionDate'] != null
          ? (json['completionDate'] is DateTime
              ? json['completionDate']
              : (json['completionDate'].toDate()))
          : DateTime.now(),
      technician: json['technician'] ?? '',
    );
  }

  // Firebase میں ڈیٹا بھیجنے کے لیے
  Map<String, dynamic> toJson() {
    return {
      'reportId': reportId,
      'workOrderId': workOrderId,
      'assetId': assetId,
      'finalFindings': finalFindings,
      'sparePartsUsed': sparePartsUsed,
      'completionDate':
          completionDate, // Firebase automatically converts DateTime to Timestamp
      'technician': technician,
    };
  }
}
