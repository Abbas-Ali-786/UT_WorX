import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ut_worx/firebase_models/fb_notification_model.dart';
import 'package:ut_worx/utils/custom_widgets/custom_drawer.dart';
import 'package:ut_worx/utils/resposive_design/responsive_layout.dart';
import 'package:ut_worx/view/notification_creation/create_notification.dart';

class NotificationListScreen extends StatefulWidget {
  const NotificationListScreen({super.key});

  @override
  State<NotificationListScreen> createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(builder: (context, responsives) {
      return Scaffold(
        backgroundColor: const Color(0XFFF4F7FE),
        drawer: const CustomDrawer(),
        body: const NotificationTable(),
      );
    });
  }
}

class NotificationTable extends StatelessWidget {
  const NotificationTable({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(builder: (context, responsive) {
      final titlePadding = responsive.deviceValue(
        mobile: 20.0,
        tablet: 20.0,
        desktop: 20.0,
      );
      final titleFontSize = responsive.deviceValue(
        mobile: 14.0,
        tablet: 18.0,
        desktop: 22.0,
      );
      final buttonFontSize = responsive.deviceValue(
        mobile: 10.0,
        tablet: 12.0,
        desktop: 16.0,
      );
      final buttonPadding = responsive.deviceValue(
        mobile: 8.0,
        tablet: 10.0,
        desktop: 12.0,
      );
      final tableTitle = responsive.deviceValue(
        mobile: 10.0,
        tablet: 13.0,
        desktop: 15.0,
      );
      final tableRowHeight = responsive.deviceValue(
        mobile: 30.0,
        tablet: 40.0,
        desktop: 50.0,
      );
      final bool usefullLayout = responsive.isTablet || responsive.isDesktop;

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: titlePadding, right: titlePadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notification',
                    style: TextStyle(
                        fontSize: titleFontSize, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const NotificationDialog();
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Color(0XFF7DBD2C),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(buttonPadding),
                      child: Text(
                        'Create Notification',
                        style: TextStyle(fontSize: buttonFontSize),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Notifications')
                    .orderBy('createdAt', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0XFF7DBD2C),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('No notifications found'),
                    );
                  }

                  // Convert Firestore documents to NotificationDataModel objects
                  final List<NotificationModel> notificationData =
                      snapshot.data!.docs.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    DateTime? createdAt;
                    if (data['createdAt'] != null) {
                      createdAt = (data['createdAt'] as Timestamp).toDate();
                    }

                    return NotificationModel(
                      orderId: data['orderId'] ?? '',
                      orderTitle: data['orderTitle'] ?? '',
                      description: data['description'] ?? '',
                      prelimFinding: data['prelimFinding'] ?? '',
                      assetSelection: data['assetSelection'] ?? '',
                      workCategory: data['workCategory'] ?? '',
                      createdBy: data['createdBy'] ?? '',
                      status: data['status'] ?? 'Pending',
                      priority: data['priority'] ?? '',
                      breakdownBypass: data['breakdownBypass'] ?? '',
                      createdAt: createdAt,
                    );
                  }).toList();

                  return Scrollbar(
                    thumbVisibility: true,
                    thickness: 8,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        width: usefullLayout
                            ? MediaQuery.sizeOf(context).width * 1.3
                            : 800,
                        margin: EdgeInsets.only(bottom: 15),
                        child: DataTable(
                          columnSpacing: 10,
                          horizontalMargin: 10,
                          headingTextStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: tableTitle),
                          headingRowColor:
                              WidgetStateProperty.all(Color(0XFFE5E7EB)),
                          dataTextStyle: TextStyle(fontSize: tableTitle),
                          headingRowHeight: tableRowHeight,
                          dataRowHeight: tableRowHeight,
                          columns: const [
                            DataColumn(
                                label: Expanded(
                              child: Text(
                                'ORDER ID',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            )),
                            DataColumn(
                                label: Expanded(
                              child: Text(
                                'ORDER TITLE',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            )),
                            DataColumn(
                                label: Expanded(
                              child: Text(
                                'ASSET SELECTION',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            )),
                            DataColumn(
                                label: Expanded(
                              child: Text(
                                'PRELIM FINDING',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            )),
                            DataColumn(
                                label: Expanded(
                              child: Text(
                                'CREATED BY',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            )),
                            DataColumn(
                                label: Expanded(
                              child: Text(
                                'STATUS',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            )),
                            DataColumn(
                                label: Expanded(
                              child: Text(
                                'PRIORITY',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            )),
                          ],
                          rows: notificationData.map((data) {
                            return DataRow(cells: [
                              DataCell(Text(data.orderId)),
                              DataCell(Text(data.orderTitle)),
                              DataCell(Text(data.assetSelection)),
                              DataCell(Text(data.prelimFinding)),
                              DataCell(Text(data.createdBy)),
                              DataCell(
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: _getStatusColor(data.status),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    data.status,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(
                                  data.priority,
                                  style: TextStyle(
                                      color: _getPriorityColor(data.priority)),
                                ),
                              ),
                            ]);
                          }).toList(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green.shade400;
      case 'Pending':
        return Colors.yellow.shade700;
      case 'Rejected':
        return Colors.red.shade400;
      case 'OnHold':
        return Colors.blue.shade400;
      default:
        return Colors.grey;
    }
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return Colors.red;
      case 'Medium':
        return Colors.orange;
      case 'Low':
        return Colors.green;
      default:
        return Colors.black;
    }
  }
}
