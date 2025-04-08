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
}
