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
}
