import 'package:flutter/material.dart';
import 'package:ut_worx/utils/resposive_design/responsive_layout.dart';

class WorkSummaryTable extends StatefulWidget {
  final ResponsiveInfo responsive;

  const WorkSummaryTable({
    super.key,
    required this.responsive,
  });

  @override
  State<WorkSummaryTable> createState() => _WorkSummaryTableState();
}

class _WorkSummaryTableState extends State<WorkSummaryTable> {
  @override
  Widget build(BuildContext context) {
    final titleFontSize = widget.responsive.deviceValue(
      mobile: 14.0,
      tablet: 18.0,
      desktop: 22.0,
    );

    final tableFontSize = widget.responsive.deviceValue(
      mobile: 8.0,
      tablet: 10.0,
      desktop: 14.0,
    );

    final cardPadding = widget.responsive.deviceValue(
      mobile: 12.0,
      tablet: 14.0,
      desktop: 16.0,
    );

    final buttonPadding = widget.responsive.deviceValue(
      mobile: 6.0,
      tablet: 8.0,
      desktop: 10.0,
    );

    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "Work Summary",
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                _customTab(
                  "Work Summary",
                  Colors.white,
                  Color(0XFF7DBD2C),
                  fontSize: tableFontSize,
                  padding: buttonPadding,
                ),
                _customTab(
                  "Faulty Assets",
                  Color(0XFF7DBD2C),
                  Colors.white,
                  fontSize: tableFontSize,
                  padding: buttonPadding,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: _buildFullTable(tableFontSize),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFullTable(double fontSize) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: DataTable(
        columnSpacing: widget.responsive.deviceValue(
          mobile: 10.0,
          tablet: 15.0,
          desktop: 20.0,
        ),
        columns: [
          DataColumn(
            label: Expanded(
              child: Text(
                "WORK ORDER ID",
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                "WORK TITLE",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                "STATUS",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                "ASSIGNED TECHNICIAN",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                "DUE DATE",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                "PRIORITY",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
        rows: List.generate(
          10,
          (index) => DataRow(
            cells: [
              DataCell(Text(
                "25634789$index",
                style: TextStyle(fontSize: fontSize),
              )),
              DataCell(Text(
                "Task $index",
                style: TextStyle(fontSize: fontSize),
              )),
              DataCell(_statusTag(
                index,
                fontSize: fontSize,
              )),
              DataCell(Text(
                "Technician $index",
                style: TextStyle(fontSize: fontSize),
              )),
              DataCell(Text(
                "Tue 11 June",
                style: TextStyle(fontSize: fontSize),
              )),
              DataCell(Text(
                index % 2 == 0 ? "High" : "Low",
                style: TextStyle(fontSize: fontSize),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusTag(int index, {double? fontSize}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: index % 2 == 0 ? Colors.green.shade300 : Colors.orange.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        index % 2 == 0 ? "Completed" : "Pending",
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }

  Widget _customTab(
    String text,
    Color textColor,
    Color backgroundColor, {
    double? fontSize,
    double? padding,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: EdgeInsets.symmetric(
            horizontal: padding ?? 10,
            vertical: padding != null ? padding / 2 : 5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
}
