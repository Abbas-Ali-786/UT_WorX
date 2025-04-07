import 'package:flutter/material.dart';
import 'package:ut_worx/models/notification_data_model.dart';
import 'package:ut_worx/utils/custom_widgets/custom_drawer.dart';
import 'package:ut_worx/utils/custom_widgets/custom_header.dart';
import 'package:ut_worx/utils/resposive_design/responsive_layout.dart';

class NotificationListScreen extends StatefulWidget {
  const NotificationListScreen({super.key});

  @override
  State<NotificationListScreen> createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(builder: (context, responsives) {
      final appBarHeight = responsives.deviceValue(
        mobile: 50.0,
        tablet: 70.0,
        desktop: 80.0,
      );
      return Scaffold(
        backgroundColor: const Color(0XFFF4F7FE),
        drawer: const CustomDrawer(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(appBarHeight),
          child: CustomHeader(),
        ),
        body: const NotificationTable(),
      );
    });
  }
}

class NotificationTable extends StatelessWidget {
  const NotificationTable({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NotificationData> notificationData = [
      NotificationData(
        workOrderId: '2563478912',
        workType: 'Dog Trainer',
        assetId: '25486',
        createdBy: 'Andrew',
        status: 'Completed',
        priority: 'High',
      ),
      NotificationData(
        workOrderId: '2478965123',
        workType: 'Nursing Assistant',
        assetId: '47893',
        createdBy: 'Falcon',
        status: 'Pending',
        priority: 'Medium',
      ),
      NotificationData(
        workOrderId: '5741289634',
        workType: 'Vice President',
        assetId: '12478',
        createdBy: 'Sam',
        status: 'Rejected',
        priority: 'Low',
      ),
      NotificationData(
        workOrderId: '8741523698',
        workType: 'BDR',
        assetId: '32789',
        createdBy: 'Falcon',
        status: 'OnHold',
        priority: 'Medium',
      ),
      NotificationData(
        workOrderId: '7142589634',
        workType: 'SDR',
        assetId: '14789',
        createdBy: 'Tony',
        status: 'Pending',
        priority: 'Low',
      ),
      NotificationData(
        workOrderId: '1452452014',
        workType: 'Product Owner',
        assetId: '24631',
        createdBy: 'Paul',
        status: 'Completed',
        priority: 'High',
      ),
      NotificationData(
        workOrderId: '2498756321',
        workType: 'CSM',
        assetId: '02483',
        createdBy: 'Baron',
        status: 'Pending',
        priority: 'Medium',
      ),
      NotificationData(
        workOrderId: '2487569314',
        workType: 'Account Executive',
        assetId: '80456',
        createdBy: 'Falcon',
        status: 'Rejected',
        priority: 'Low',
      ),
      NotificationData(
        workOrderId: '0147751236',
        workType: 'BDR',
        assetId: '40369',
        createdBy: 'Sam',
        status: 'Pending',
        priority: 'Medium',
      ),
      NotificationData(
        workOrderId: '2540893014',
        workType: 'Account Executive',
        assetId: '80456',
        createdBy: 'Baron',
        status: 'Pending',
        priority: 'High',
      ),
      NotificationData(
        workOrderId: '0147751236',
        workType: 'CSM',
        assetId: '02483',
        createdBy: 'Falcon',
        status: 'Pending',
        priority: 'Low',
      ),
      NotificationData(
        workOrderId: '2498756321',
        workType: 'Product Owner',
        assetId: '32789',
        createdBy: 'Sam',
        status: 'Pending',
        priority: 'Medium',
      ),
      NotificationData(
        workOrderId: '7142589634',
        workType: 'BDR',
        assetId: '47893',
        createdBy: 'Paul',
        status: 'Pending',
        priority: 'Medium',
      ),
      NotificationData(
        workOrderId: '5741289634',
        workType: 'CSM',
        assetId: '02483',
        createdBy: 'Andrew',
        status: 'Pending',
        priority: 'Low',
      ),
      NotificationData(
        workOrderId: '2540893014',
        workType: 'SDR',
        assetId: '12762',
        createdBy: 'Tony',
        status: 'Pending',
        priority: 'High',
      ),
    ];

    return ResponsiveLayout(builder: (context, responsive) {
      final titlePadding = responsive.deviceValue(
        mobile: 8.0,
        tablet: 10.0,
        desktop: 12.0,
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
        mobile: 6.0,
        tablet: 8.0,
        desktop: 10.0,
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
                    'Notification Creation',
                    style: TextStyle(
                        fontSize: titleFontSize, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(buttonPadding),
                      backgroundColor: Color(0XFF7DBD2C),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Create Notification',
                      style: TextStyle(fontSize: buttonFontSize),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Scrollbar(
                thumbVisibility: true,
                thickness: 8,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: usefullLayout
                        ? MediaQuery.sizeOf(context).width * 1.3
                        : 800,
                    child: DataTable(
                      columnSpacing: 20,
                      horizontalMargin: 15,
                      headingTextStyle: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: tableTitle),
                      headingRowColor:
                          WidgetStateProperty.all(Color(0XFFE5E7EB)),
                      dataTextStyle: TextStyle(fontSize: tableTitle),
                      headingRowHeight: tableRowHeight,
                      dataRowHeight: tableRowHeight,
                      columns: const [
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'WORK ORDER ID',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'WORK TYPE',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'ASSET ID',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'CREATED BY',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'STATUS',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'PRIORITY',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                      ],
                      rows: notificationData.map((data) {
                        return DataRow(cells: [
                          DataCell(Text(data.workOrderId)),
                          DataCell(Text(data.workType)),
                          DataCell(Text(data.assetId)),
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
