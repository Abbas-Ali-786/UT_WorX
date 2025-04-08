import 'package:flutter/material.dart';
import '../../utils/resposive_design/responsive_layout.dart';

class ServiceReportDialog extends StatefulWidget {
  const ServiceReportDialog({super.key});

  @override
  State<ServiceReportDialog> createState() => _ServiceReportDialogState();
}

class _ServiceReportDialogState extends State<ServiceReportDialog> {
  String id = '52369884';
  String faultObservation = '';
  String findings = '';
  bool followUp = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ResponsiveLayout(
        builder: (context, responsive) {
          // Get responsive values based on device type
          final dialogWidth = responsive.deviceValue(
            mobile: 320.0,
            tablet: 450.0,
            desktop: 550.0,
          );

          final padding = responsive.deviceValue(
            mobile: 16.0,
            tablet: 20.0,
            desktop: 24.0,
          );

          final titleFontSize = responsive.deviceValue(
            mobile: 18.0,
            tablet: 20.0,
            desktop: 22.0,
          );

          final labelFontSize = responsive.deviceValue(
            mobile: 14.0,
            tablet: 15.0,
            desktop: 16.0,
          );

          final verticalSpacing = responsive.deviceValue(
            mobile: 8.0,
            tablet: 10.0,
            desktop: 12.0,
          );

          final buttonPadding = responsive.deviceValue(
            mobile: 12.0,
            tablet: 14.0,
            desktop: 16.0,
          );

          return Container(
            width: dialogWidth,
            padding: EdgeInsets.all(padding),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Add Service Report',
                    style: TextStyle(
                        fontSize: titleFontSize, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: verticalSpacing * 2),
                  Text(
                    'ID',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: labelFontSize,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    initialValue: id,
                    decoration: InputDecoration(
                      hintText: '52369884',
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0XFFE5E7EB), width: 1)),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: responsive.deviceValue(
                          mobile: 8.0,
                          tablet: 10.0,
                          desktop: 12.0,
                        ),
                      ),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        id = newValue;
                      });
                    },
                    autovalidateMode: AutovalidateMode.always,
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    'Final Findings',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: labelFontSize,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Please add findings',
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0XFFE5E7EB), width: 1)),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    maxLines: responsive.deviceValue(
                      mobile: 2,
                      tablet: 3,
                      desktop: 3,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        findings = newValue;
                      });
                    },
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    'Asset Component',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: labelFontSize,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Please select asset component',
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0XFFE5E7EB), width: 1)),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        findings = newValue;
                      });
                    },
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    'Spare Parts Used',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: labelFontSize,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0XFFE5E7EB)),
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Select',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    'Completion Status',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: labelFontSize,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0XFFE5E7EB)),
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Select',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_drop_down_outlined),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    'Upload Attachments',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: labelFontSize,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0XFFE5E7EB)),
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Upload photo/video',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.cloud_upload_outlined),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: verticalSpacing * 2),
                  // Use column for mobile, row for tablet and desktop
                  responsive.isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildSaveDraftButton(context, responsive),
                            SizedBox(height: verticalSpacing),
                            _buildSubmitButton(context, responsive),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child:
                                    _buildSaveDraftButton(context, responsive)),
                            const SizedBox(width: 10),
                            Expanded(
                                child: _buildSubmitButton(context, responsive)),
                          ],
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSaveDraftButton(
      BuildContext context, ResponsiveInfo responsive) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        side: BorderSide(color: Color(0XFFE5E7EB)),
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: responsive.deviceValue(
            mobile: 12.0,
            tablet: 14.0,
            desktop: 16.0,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Save',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: responsive.deviceValue(
            mobile: 14.0,
            tablet: 15.0,
            desktop: 16.0,
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context, ResponsiveInfo responsive) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0XFF7DBD2C),
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: responsive.deviceValue(
            mobile: 12.0,
            tablet: 14.0,
            desktop: 16.0,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Submit',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: responsive.deviceValue(
            mobile: 14.0,
            tablet: 15.0,
            desktop: 16.0,
          ),
        ),
      ),
    );
  }
}
