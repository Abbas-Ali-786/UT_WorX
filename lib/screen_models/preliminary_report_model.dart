class PreliminaryReport {
  final String reportId;
  final String workOrderId;
  final String assetId;
  final String findings;
  bool followUpsRequired;
  final String createdBy;
  final String status;

  PreliminaryReport({
    required this.reportId,
    required this.workOrderId,
    required this.assetId,
    required this.findings,
    required this.followUpsRequired,
    required this.createdBy,
    required this.status,
  });

  // Firebase سے ڈیٹا حاصل کرنے کے لیے
  factory PreliminaryReport.fromJson(Map<String, dynamic> json) {
    return PreliminaryReport(
      reportId: json['reportId'] ?? '',
      workOrderId: json['workOrderId'] ?? '',
      assetId: json['assetId'] ?? '',
      findings: json['findings'] ?? '',
      followUpsRequired: json['followUpsRequired'] ?? false,
      createdBy: json['createdBy'] ?? '',
      status: json['status'] ?? '',
    );
  }

  // Firebase میں ڈیٹا بھیجنے کے لیے
  Map<String, dynamic> toJson() {
    return {
      'reportId': reportId,
      'workOrderId': workOrderId,
      'assetId': assetId,
      'findings': findings,
      'followUpsRequired': followUpsRequired,
      'createdBy': createdBy,
      'status': status,
    };
  }
}
