import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String orderId;
  final String orderTitle;
  final String description;
  final String prelimFinding;
  final String assetSelection;
  final String workCategory;
  final String priority;
  final bool breakdownBypass;
  final String? attachmentUrl;
  final String createdBy;
  final DateTime? createdAt;
  final String? imageData;
  final String? imageName;
  final String status;

  NotificationModel({
    required this.orderId,
    required this.orderTitle,
    required this.description,
    required this.prelimFinding,
    required this.assetSelection,
    required this.workCategory,
    required this.priority,
    required this.breakdownBypass,
    this.attachmentUrl,
    required this.createdBy,
    this.createdAt,
    this.imageData,
    this.imageName,
    required this.status,
  });

  // Firebase سے ڈیٹا حاصل کرنے کے لیے
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      orderId: json['orderId'] ?? '',
      orderTitle: json['orderTitle'] ?? '',
      description: json['description'] ?? '',
      prelimFinding: json['prelimFinding'] ?? '',
      assetSelection: json['assetSelection'] ?? '',
      workCategory: json['workCategory'] ?? '',
      priority: json['priority'] ?? '',
      breakdownBypass: json['breakdownBypass'] ?? false,
      attachmentUrl: json['attachmentUrl'],
      createdBy: json['createdBy'] ?? '',
      createdAt: json['createdAt'] != null
          ? (json['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
      imageData: json['imageData'],
      imageName: json['imageName'],
      status: json['status'],
    );
  }

  // Firebase میں ڈیٹا بھیجنے کے لیے
  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'orderTitle': orderTitle,
      'description': description,
      'prelimFinding': prelimFinding,
      'assetSelection': assetSelection,
      'workCategory': workCategory,
      'priority': priority,
      'breakdownBypass': breakdownBypass,
      'attachmentUrl': attachmentUrl,
      'createdBy': createdBy,
      'createdAt': createdAt,
      'imageData': imageData,
      'imageName': imageName,
      'status': status,
    };
  }
}
