import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ut_worx/models/service_report_model.dart';
import 'package:ut_worx/utils/custom_widgets/custom_drawer.dart';
import 'package:ut_worx/utils/custom_widgets/custom_header.dart';
import 'package:ut_worx/utils/resposive_design/responsive_layout.dart';

class ServiceReportScreen extends StatefulWidget {
  const ServiceReportScreen({super.key});

  @override
  State<ServiceReportScreen> createState() => _ServiceReportScreenState();
}

class _ServiceReportScreenState extends State<ServiceReportScreen> {
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
    List<ServiceReportModel> serviceReport = [
      ServiceReportModel(
        reportId: '2563478912',
        workOrderId: 'Dog Trainer',
        assetId: '25486',
        finalFindings:
            'Aliquam pulvinar vestibulum blandit. Donec sed nisl libero.',
        sparePartsUsed: 'Control Valve',
        completionDate: DateTime(2025, 2, 12),
        technician: 'Andrew',
      ),
      ServiceReportModel(
        reportId: '2478965123',
        workOrderId: 'Nursing Assistant',
        assetId: '47893',
        finalFindings:
            'Aliquam pulvinar vestibulum blandit. Donec sed nisl libero.',
        sparePartsUsed: 'Control Valve',
        completionDate: DateTime(2025, 2, 15),
        technician: 'Falcon',
      ),
      ServiceReportModel(
        reportId: '5741289634',
        workOrderId: 'Vice President',
        assetId: '12478',
        finalFindings: 'Sam',
        sparePartsUsed: 'Control Valve',
        completionDate: DateTime(2025, 2, 22),
        technician: 'Sam',
      ),
      ServiceReportModel(
        reportId: '8741523698',
        workOrderId: 'BDR',
        assetId: '32789',
        finalFindings: 'Falcon',
        sparePartsUsed: 'Control Valve',
        completionDate: DateTime(2025, 2, 2),
        technician: 'Falcon',
      ),
      ServiceReportModel(
        reportId: '7142589634',
        workOrderId: 'SDR',
        assetId: '14789',
        finalFindings: 'Tony',
        sparePartsUsed: 'Control Valve',
        completionDate: DateTime(2025, 2, 25),
        technician: 'Tony',
      ),
      ServiceReportModel(
        reportId: '1452452014',
        workOrderId: 'Product Owner',
        assetId: '24631',
        finalFindings: 'Paul',
        sparePartsUsed: 'Control Valve',
        completionDate: DateTime(2025, 2, 12),
        technician: 'Paul',
      ),
      ServiceReportModel(
        reportId: '2498756321',
        workOrderId: 'CSM',
        assetId: '02483',
        finalFindings: 'Baron',
        sparePartsUsed: 'Control Valve',
        completionDate: DateTime(2025, 3, 1),
        technician: 'Baron',
      ),
      ServiceReportModel(
        reportId: '2487569314',
        workOrderId: 'Account Executive',
        assetId: '80456',
        finalFindings: 'Falcon',
        sparePartsUsed: 'Control Valve',
        completionDate: DateTime(2025, 3, 5),
        technician: 'Falcon',
      ),
      ServiceReportModel(
        reportId: '0147751236',
        workOrderId: 'BDR',
        assetId: '40369',
        finalFindings: 'Sam',
        sparePartsUsed: 'Control Valve',
        completionDate: DateTime(2025, 3, 8),
        technician: 'Sam',
      ),
      ServiceReportModel(
        reportId: '2540893014',
        workOrderId: 'Account Executive',
        assetId: '80456',
        finalFindings: 'Baron',
        sparePartsUsed: 'Control Valve',
        completionDate: DateTime(2025, 3, 10),
        technician: 'Baron',
      ),
      ServiceReportModel(
        reportId: '0147751236',
        workOrderId: 'CSM',
        assetId: '02483',
        finalFindings: 'Falcon',
        sparePartsUsed: 'Control Valve',
        completionDate: DateTime(2025, 3, 14),
        technician: 'Falcon',
      ),
      ServiceReportModel(
        reportId: '2498756321',
        workOrderId: 'Product Owner',
        assetId: '32789',
        finalFindings: 'Sam',
        sparePartsUsed: 'Control Valve',
        completionDate: DateTime(2025, 3, 20),
        technician: 'Sam',
      ),
      ServiceReportModel(
        reportId: '7142589634',
        workOrderId: 'BDR',
        assetId: '47893',
        finalFindings: 'Paul',
        sparePartsUsed: 'Control Valve',
        completionDate: DateTime(2025, 3, 24),
        technician: 'Paul',
      ),
      ServiceReportModel(
        reportId: '2540893014',
        workOrderId: 'SDR',
        assetId: '12762',
        finalFindings: 'Tony',
        sparePartsUsed: 'Control Valve',
        completionDate: DateTime(2025, 3, 25),
        technician: 'Tony',
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
                    'Service Report',
                    style: TextStyle(
                        fontSize: titleFontSize, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return const ServiceReportScreenDialog();
                      //   },
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(buttonPadding),
                      backgroundColor: Color(0XFF7DBD2C),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Add Service Report',
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
                          'Report ID',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'Work Order ID',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'Asset ID',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'Final Findings',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'Spare Parts Used',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'Completion Date',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'Technician',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                      ],
                      rows: serviceReport.map((workOrder) {
                        return DataRow(
                          cells: [
                            DataCell(Text(workOrder.reportId)),
                            DataCell(Text(workOrder.workOrderId)),
                            DataCell(Text(workOrder.assetId)),
                            DataCell(Text(workOrder.finalFindings)),
                            DataCell(Text(workOrder.sparePartsUsed)),
                            DataCell(Text(DateFormat('dd-MM-yyyy')
                                .format(workOrder.completionDate))),
                            DataCell(Text(workOrder.technician)),
                          ],
                        );
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
}
