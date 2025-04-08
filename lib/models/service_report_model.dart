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
}
