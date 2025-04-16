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

  // Firebase سے ڈیٹا حاصل کرنے کے لیے
  factory PMSModel.fromJson(Map<String, dynamic> json) {
    return PMSModel(
      pmOrderId: json['pmOrderId'] ?? '',
      asset: json['asset'] ?? '',
      location: json['location'] ?? '',
      scheduledDate: json['scheduledDate'] ?? '',
      status: json['status'] ?? '',
    );
  }

  // Firebase میں ڈیٹا بھیجنے کے لیے
  Map<String, dynamic> toJson() {
    return {
      'pmOrderId': pmOrderId,
      'asset': asset,
      'location': location,
      'scheduledDate': scheduledDate,
      'status': status,
    };
  }
}
