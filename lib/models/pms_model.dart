class PMSModel {
  final String pmOrderId;
  final String asset;
  final String location;
  final String scheduledDate;
  final String status;

  PMSModel({
    required this.pmOrderId,
    required this.asset,
    required this.location,
    required this.scheduledDate,
    required this.status,
  });
}
