class NotificationData {
  final String workOrderId;
  final String workType;
  final String assetId;
  final String createdBy;
  final String status;
  final String priority;

  NotificationData({
    required this.workOrderId,
    required this.workType,
    required this.assetId,
    required this.createdBy,
    required this.status,
    required this.priority,
  });
}
