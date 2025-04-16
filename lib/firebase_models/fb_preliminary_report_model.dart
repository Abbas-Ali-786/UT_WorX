import 'package:cloud_firestore/cloud_firestore.dart';

class PreliminaryReport {
  final String orderId;
  final String orderTitle;
  final String assetSelection;
  final String findings;
  bool followUps;
  final String createdBy;
  final DateTime? createdAt;
  final String status;

  PreliminaryReport({
    required this.orderId,
    required this.orderTitle,
    required this.assetSelection,
    required this.findings,
    required this.followUps,
    required this.createdBy,
    this.createdAt,
    required this.status,
  });

  factory PreliminaryReport.fromJson(Map<String, dynamic> json) {
    return PreliminaryReport(
      orderId: json['orderId'],
      orderTitle: json['orderTitle'],
      assetSelection: json['assetSelection'],
      findings: json['findings'],
      followUps: json['followUps'],
      createdBy: json['createdBy'],
      createdAt: json['createdAt'] != null
          ? (json['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'orderTitle': orderTitle,
      'assetSelection': assetSelection,
      'findings': findings,
      'followUps': followUps,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'status': status,
    };
  }
}
