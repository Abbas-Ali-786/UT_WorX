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
}
