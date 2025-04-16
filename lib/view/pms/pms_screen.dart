import 'package:flutter/material.dart';
import 'package:ut_worx/screen_models/pms_model.dart';
import 'package:ut_worx/screen_models/work_scheduling_model.dart';
import 'package:ut_worx/utils/custom_widgets/custom_drawer.dart';
import 'package:ut_worx/utils/custom_widgets/custom_header.dart';
import 'package:ut_worx/utils/resposive_design/responsive_layout.dart';
import 'package:ut_worx/view/pms/assign_pms_dialog.dart';
import 'package:ut_worx/view/work_scheduling/create_work_scheduling.dart';

class PMSScreen extends StatefulWidget {
  const PMSScreen({super.key});

  @override
  State<PMSScreen> createState() => _PMSScreenState();
}

class _PMSScreenState extends State<PMSScreen> {
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
        body: const PMSTable(),
      );
    });
  }
}

class PMSTable extends StatelessWidget {
  const PMSTable({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PMSModel> pmsData = [
      PMSModel(
        pmOrderId: '487441',
        asset: 'Adidas',
        location: 'Syracuse, Connecticut',
        scheduledDate: '12-02-2025',
        status: 'Completed',
      ),
      PMSModel(
        pmOrderId: '653518',
        asset: 'Triazole',
        location: 'Kent, Utah',
        scheduledDate: '15-02-2025',
        status: 'Pending',
      ),
      PMSModel(
        pmOrderId: '651535',
        asset: 'Adidas',
        location: 'Lansing, Illinois',
        scheduledDate: '22-02-2025',
        status: 'Rejected',
      ),
      PMSModel(
        pmOrderId: '558612',
        asset: 'Sberbank Russia',
        location: 'Portland, Illinois',
        scheduledDate: '02-02-2025',
        status: 'OnHold',
      ),
      PMSModel(
        pmOrderId: '558612',
        asset: 'Microsoft',
        location: 'Great Falls, Maryland',
        scheduledDate: '25-02-2025',
        status: 'Pending',
      ),
      PMSModel(
        pmOrderId: '449003',
        asset: 'Sberbank Russia',
        location: 'Lafayette, California',
        scheduledDate: '12-02-2025',
        status: 'Completed',
      ),
      PMSModel(
        pmOrderId: '487441',
        asset: 'Bitcoin',
        location: 'Coppell, Virginia',
        scheduledDate: '01-03-2025',
        status: 'Pending',
      ),
      PMSModel(
        pmOrderId: '487441',
        asset: 'Bitcoin',
        location: 'Pasadena, Oklahoma',
        scheduledDate: '05-03-2025',
        status: 'Rejected',
      ),
      PMSModel(
        pmOrderId: '558612',
        asset: 'Adidas',
        location: 'Syracuse, Connecticut',
        scheduledDate: '08-03-2025',
        status: 'Pending',
      ),
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
                    'Preventive Maintenance Scheduler',
                    style: TextStyle(
                        fontSize: titleFontSize, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {},
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
                        'Upload Excel',
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
                        usefullLayout ? MediaQuery.sizeOf(context).width : 600,
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
                          'PM Order ID',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'Asset',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'Location',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'Scheduled Date',
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
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'Action',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ))),
                      ],
                      rows: pmsData.map((data) {
                        return DataRow(cells: [
                          DataCell(Text(data.pmOrderId)),
                          DataCell(Text(data.asset)),
                          DataCell(Text(data.location)),
                          DataCell(Text(data.scheduledDate)),
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
                          DataCell(GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AssignPmsDialog();
                                },
                              );
                            },
                            child: Text(
                              'Assign',
                              style: TextStyle(
                                color: Color(0XFF0159A1),
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0XFF0159A1),
                              ),
                            ),
                          )),
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
}
