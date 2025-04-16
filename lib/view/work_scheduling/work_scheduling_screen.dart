import 'package:flutter/material.dart';
import 'package:ut_worx/screen_models/notification_data_model.dart';
import 'package:ut_worx/screen_models/work_scheduling_model.dart';
import 'package:ut_worx/utils/custom_widgets/custom_drawer.dart';
import 'package:ut_worx/utils/custom_widgets/custom_header.dart';
import 'package:ut_worx/utils/resposive_design/responsive_layout.dart';
import 'package:ut_worx/view/notification_creation/create_notification.dart';
import 'package:ut_worx/view/work_scheduling/create_work_scheduling.dart';

class WorkSchedulingScreen extends StatefulWidget {
  const WorkSchedulingScreen({super.key});

  @override
  State<WorkSchedulingScreen> createState() => _WorkSchedulingScreenState();
}

class _WorkSchedulingScreenState extends State<WorkSchedulingScreen> {
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
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(appBarHeight),
        //   child: CustomHeader(),
        // ),
        body: const NotificationTable(),
      );
    });
  }
}

class NotificationTable extends StatelessWidget {
  const NotificationTable({super.key});

  @override
  Widget build(BuildContext context) {
    final List<WorkSchedulingModel> workScheduling = [
      WorkSchedulingModel(
          workOrderId: '5478930124',
          technicianAssigned: 'Sam',
          scheduledDate: 12478,
          estimatedHours: 'Sam',
          status: 'Completed'),
      WorkSchedulingModel(
          workOrderId: '3541278930',
          technicianAssigned: 'Falcon',
          scheduledDate: 32789,
          estimatedHours: 'Falcon',
          status: 'Pending'),
      WorkSchedulingModel(
          workOrderId: '0124789635',
          technicianAssigned: 'Tony',
          scheduledDate: 14789,
          estimatedHours: 'Tony',
          status: 'Rejected'),
      WorkSchedulingModel(
          workOrderId: '5478213695',
          technicianAssigned: 'Paul',
          scheduledDate: 24631,
          estimatedHours: 'Paul',
          status: 'OnHold'),
      WorkSchedulingModel(
          workOrderId: '2458731054',
          technicianAssigned: 'Baron',
          scheduledDate: 02483,
          estimatedHours: 'Baron',
          status: 'Pending'),
      WorkSchedulingModel(
          workOrderId: '9352417890',
          technicianAssigned: 'Falcon',
          scheduledDate: 80456,
          estimatedHours: 'Falcon',
          status: 'Completed'),
      WorkSchedulingModel(
          workOrderId: '5023647891',
          technicianAssigned: 'Sam',
          scheduledDate: 40369,
          estimatedHours: 'Sam',
          status: 'Pending'),
      WorkSchedulingModel(
          workOrderId: '0245318762',
          technicianAssigned: 'Baron',
          scheduledDate: 80456,
          estimatedHours: 'Baron',
          status: 'Rejected'),
      WorkSchedulingModel(
          workOrderId: '4783169524',
          technicianAssigned: 'Falcon',
          scheduledDate: 02483,
          estimatedHours: 'Falcon',
          status: 'Pending'),
      WorkSchedulingModel(
          workOrderId: '2453178326',
          technicianAssigned: 'Sam',
          scheduledDate: 32789,
          estimatedHours: 'Sam',
          status: 'Pending'),
      WorkSchedulingModel(
          workOrderId: '2547361586',
          technicianAssigned: 'Paul',
          scheduledDate: 47893,
          estimatedHours: 'Paul',
          status: 'Pending'),
      WorkSchedulingModel(
          workOrderId: '2543185362',
          technicianAssigned: 'Tony',
          scheduledDate: 12762,
          estimatedHours: 'Tony',
          status: 'Pending'),
    ];

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
                    'Scheduled Task',
                    style: TextStyle(
                        fontSize: titleFontSize, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const WorkSchedulingDialog();
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
                        'Add Schedule Task',
                        style: TextStyle(fontSize: buttonFontSize),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                    width:
                        usefullLayout ? MediaQuery.sizeOf(context).width : 800,
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
                          'TECHNICIAN ASSIGNED',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'SCHEDULED DATE',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'ESTINATED HOURS',
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
                      ],
                      rows: workScheduling.map((data) {
                        return DataRow(cells: [
                          DataCell(Text(data.workOrderId)),
                          DataCell(Text(data.technicianAssigned)),
                          DataCell(Text(data.scheduledDate.toString())),
                          DataCell(Text(data.estimatedHours)),
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
