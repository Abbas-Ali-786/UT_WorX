import 'package:flutter/material.dart';
import 'package:ut_worx/models/preliminary_report_model.dart';
import 'package:ut_worx/utils/custom_widgets/custom_drawer.dart';
import 'package:ut_worx/utils/custom_widgets/custom_header.dart';
import 'package:ut_worx/utils/resposive_design/responsive_layout.dart';
import 'package:ut_worx/view/preliminary_report/create_preliminary_report.dart';

class PreliminaryReportScreen extends StatefulWidget {
  const PreliminaryReportScreen({super.key});

  @override
  _PreliminaryReportScreenState createState() =>
      _PreliminaryReportScreenState();
}

class _PreliminaryReportScreenState extends State<PreliminaryReportScreen> {
  List<PreliminaryReport> reports = [
    PreliminaryReport(
      reportId: '2563478912',
      workOrderId: 'Dog Trainer',
      assetId: '25486',
      findings: 'Aliquam pulvinar vestibulum blandit. Donec sed nisl libero.',
      followUpsRequired: true,
      createdBy: 'Andrew',
      status: 'Completed',
    ),
    PreliminaryReport(
      reportId: '2478965123',
      workOrderId: 'Nursing Assistant',
      assetId: '47893',
      findings: 'Aliquam pulvinar vestibulum blandit. Donec sed nisl libero.',
      followUpsRequired: false,
      createdBy: 'Falcon',
      status: 'Pending',
    ),
    PreliminaryReport(
      reportId: '5741289634',
      workOrderId: 'Vice President',
      assetId: '12478',
      findings: 'Sam',
      followUpsRequired: true,
      createdBy: 'Sam',
      status: 'Rejected',
    ),
    PreliminaryReport(
      reportId: '8741523698',
      workOrderId: 'BDR',
      assetId: '32789',
      findings: 'Falcon',
      followUpsRequired: true,
      createdBy: 'Falcon',
      status: 'OnHold',
    ),
    PreliminaryReport(
      reportId: '7142589634',
      workOrderId: 'SDR',
      assetId: '14789',
      findings: 'Tony',
      followUpsRequired: true,
      createdBy: 'Tony',
      status: 'Pending',
    ),
    PreliminaryReport(
      reportId: '1452452014',
      workOrderId: 'Product Owner',
      assetId: '24631',
      findings: 'Paul',
      followUpsRequired: true,
      createdBy: 'Paul',
      status: 'Completed',
    ),
    PreliminaryReport(
      reportId: '2498756321',
      workOrderId: 'CSM',
      assetId: '02483',
      findings: 'Baron',
      followUpsRequired: true,
      createdBy: 'Baron',
      status: 'Pending',
    ),
    PreliminaryReport(
      reportId: '2487569314',
      workOrderId: 'Account Executive',
      assetId: '80456',
      findings: 'Falcon',
      followUpsRequired: true,
      createdBy: 'Falcon',
      status: 'Rejected',
    ),
    PreliminaryReport(
      reportId: '0147751236',
      workOrderId: 'BDR',
      assetId: '40369',
      findings: 'Sam',
      followUpsRequired: true,
      createdBy: 'Sam',
      status: 'Pending',
    ),
    PreliminaryReport(
      reportId: '2540893014',
      workOrderId: 'Account Executive',
      assetId: '80456',
      findings: 'Baron',
      followUpsRequired: true,
      createdBy: 'Baron',
      status: 'Pending',
    ),
    PreliminaryReport(
      reportId: '0147751236',
      workOrderId: 'CSM',
      assetId: '02483',
      findings: 'Falcon',
      followUpsRequired: true,
      createdBy: 'Falcon',
      status: 'Pending',
    ),
    PreliminaryReport(
      reportId: '2498756321',
      workOrderId: 'Product Owner',
      assetId: '32789',
      findings: 'Sam',
      followUpsRequired: true,
      createdBy: 'Sam',
      status: 'Pending',
    ),
    PreliminaryReport(
      reportId: '7142589634',
      workOrderId: 'BDR',
      assetId: '47893',
      findings: 'Paul',
      followUpsRequired: true,
      createdBy: 'Paul',
      status: 'Pending',
    ),
    PreliminaryReport(
      reportId: '2540893014',
      workOrderId: 'SDR',
      assetId: '12762',
      findings: 'Tony',
      followUpsRequired: true,
      createdBy: 'Tony',
      status: 'Pending',
    ),
  ];

  void toggleFollowUpsRequired(String reportId) {
    setState(() {
      final report =
          reports.firstWhere((report) => report.reportId == reportId);
      report.followUpsRequired = !report.followUpsRequired;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(builder: (context, responsive) {
      final appBarHeight = responsive.deviceValue(
        mobile: 50.0,
        tablet: 70.0,
        desktop: 80.0,
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

      final tableData = responsive.deviceValue(
        mobile: 12.0,
        tablet: 14.0,
        desktop: 16.0,
      );

      final buttonPadding = responsive.deviceValue(
        mobile: 8.0,
        tablet: 10.0,
        desktop: 12.0,
      );
      final titlePadding = responsive.deviceValue(
        mobile: 20.0,
        tablet: 20.0,
        desktop: 20.0,
      );
      final bool usefullLayout = responsive.isTablet || responsive.isDesktop;

      return Scaffold(
        backgroundColor: const Color(0XFFF4F7FE),
        drawer: const CustomDrawer(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(appBarHeight),
          child: CustomHeader(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: titlePadding, right: titlePadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Preliminary Report',
                        style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold)),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const ReportDialog();
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
                          'Add Report',
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
                  radius: const Radius.circular(10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: usefullLayout
                          ? MediaQuery.sizeOf(context).width * 1.3
                          : 900,
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
                            'Findings',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ))),
                          DataColumn(
                              label: Expanded(
                                  child: Text(
                            'Follow Ups Require',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ))),
                          DataColumn(
                              label: Expanded(
                                  child: Text(
                            'Created By',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ))),
                          DataColumn(
                              label: Expanded(
                                  child: Text(
                            'Status',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ))),
                        ],
                        rows: reports
                            .map<DataRow>((report) => DataRow(cells: [
                                  DataCell(Text(report.reportId)),
                                  DataCell(Text(report.workOrderId)),
                                  DataCell(Text(report.assetId)),
                                  DataCell(Text(report.findings)),
                                  DataCell(
                                    Transform.scale(
                                      scale: 0.7,
                                      child: Switch(
                                        value: report.followUpsRequired,
                                        activeTrackColor: Color(0XFF2563EB),
                                        activeColor: Colors.white,
                                        onChanged: (value) {
                                          toggleFollowUpsRequired(
                                              report.reportId);
                                        },
                                      ),
                                    ),
                                  ),
                                  DataCell(Text(report.createdBy)),
                                  DataCell(
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: _getStatusColor(report.status),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        report.status,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ]))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'Rejected':
        return Colors.red;
      case 'OnHold':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
}
