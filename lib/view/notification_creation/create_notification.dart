import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import '../../utils/resposive_design/responsive_layout.dart';
import '../../constant/toaster.dart';

class NotificationDialog extends StatefulWidget {
  const NotificationDialog({super.key});

  @override
  State<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  // Form controllers
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _assetController = TextEditingController();

  // State variables
  String workCategory = 'Select';
  String priority = 'Select';
  bool breakdownBypass = true;

  // Work category options
  final List<String> workCategories = [
    'Mechanical',
    'Electrical',
    'Plumbing',
    'HVAC',
    'Other'
  ];

  // Priority options
  final List<String> priorities = ['Low', 'Medium', 'High', 'Critical'];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _assetController.dispose();
    super.dispose();
  }

  // Function to submit notification to Firebase
  Future<void> _submitNotification() async {
    // Validate inputs
    if (_titleController.text.isEmpty) {
      Toaster.showToast('Please enter a work order title');
      return;
    }

    if (_descriptionController.text.isEmpty) {
      Toaster.showToast('Please enter a description');
      return;
    }

    if (_assetController.text.isEmpty) {
      Toaster.showToast('Please select an asset');
      return;
    }

    if (workCategory == 'Select') {
      Toaster.showToast('Please select a work category');
      return;
    }

    if (priority == 'Select') {
      Toaster.showToast('Please select a priority');
      return;
    }

    // Show loading indicator
    EasyLoading.show(status: 'Creating notification...');

    try {
      // Generate a unique ID
      final String orderId = const Uuid().v1().substring(0, 8);

      // Get current user email
      final String userEmail = FirebaseAuth.instance.currentUser?.email ?? '';

      // Create notification data
      final Map<String, dynamic> notificationData = {
        'orderId': orderId,
        'orderTitle': _titleController.text,
        'description': _descriptionController.text,
        'assetSelection': _assetController.text,
        'workCategory': workCategory,
        'priority': priority,
        'breakdownBypass': breakdownBypass,
        'createdBy': userEmail,
        'createdAt': FieldValue.serverTimestamp(),
        'status': 'Pending',
      };

      // create preliminary report data
      final Map<String, dynamic> preliminaryReportData = {
        'orderId': orderId,
        'orderTitle': _titleController.text,
        'assetSelection': _assetController.text,
        'findings': '',
        'followUps': false,
        'createdBy': userEmail,
        'createdAt': FieldValue.serverTimestamp(),
        'status': 'Pending',
      };

      // Save to Firebase
      await FirebaseFirestore.instance
          .collection('Notifications')
          .doc(orderId)
          .set(notificationData);

      await FirebaseFirestore.instance
          .collection('PreliminaryReports')
          .doc(orderId)
          .set(preliminaryReportData);

      // Hide loading indicator
      EasyLoading.dismiss();

      Toaster.showToast('Notification created successfully');

      if (mounted) {
        Navigator.of(context).pop(true); // Return true to indicate success
      }
    } catch (e) {
      EasyLoading.dismiss();
      Toaster.showToast('Error: ${e.toString()}');
      debugPrint('Error creating notification: $e');
    }
  }

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
                    'Create Notification',
                    style: TextStyle(
                        fontSize: titleFontSize, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: verticalSpacing * 2),
                  Text(
                    'Order Title',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: labelFontSize,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: 'Please add title',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0XFFE5E7EB), width: 1)),
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
                    autovalidateMode: AutovalidateMode.always,
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: labelFontSize,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _descriptionController,
                    maxLines: responsive.deviceValue(
                      mobile: 2,
                      tablet: 3,
                      desktop: 3,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Please add description',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0XFFE5E7EB), width: 1)),
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
                    autovalidateMode: AutovalidateMode.always,
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    'Asset Selection',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: labelFontSize,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _assetController,
                    decoration: InputDecoration(
                      hintText: 'Please select asset',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0XFFE5E7EB), width: 1)),
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
                            'Upload',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.cloud_upload_outlined),
                          onPressed: () {
                            // File upload functionality would go here
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    'Work Category',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: labelFontSize,
                    ),
                  ),
                  const SizedBox(height: 5),
                  DropdownButtonFormField<String>(
                    value: workCategory == 'Select' ? null : workCategory,
                    decoration: InputDecoration(
                      hintText: 'Select',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0XFFE5E7EB), width: 1)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0XFFE5E7EB), width: 1)),
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
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down_outlined),
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        workCategory = newValue ?? 'Select';
                      });
                    },
                    items: workCategories
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    'Priority',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: labelFontSize,
                    ),
                  ),
                  const SizedBox(height: 5),
                  DropdownButtonFormField<String>(
                    value: priority == 'Select' ? null : priority,
                    decoration: InputDecoration(
                      hintText: 'Select',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0XFFE5E7EB), width: 1)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Color(0XFFE5E7EB), width: 1)),
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
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down_outlined),
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        priority = newValue ?? 'Select';
                      });
                    },
                    items: priorities
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: verticalSpacing),
                  Row(
                    children: [
                      Text(
                        'Breakdown/Bypass',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: labelFontSize,
                        ),
                      ),
                      const Spacer(),
                      Checkbox(
                        value: breakdownBypass,
                        activeColor: Color(0XFF7DBD2C),
                        onChanged: (bool? newValue) {
                          setState(() {
                            if (newValue != null) {
                              breakdownBypass = newValue;
                            }
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: verticalSpacing * 2),
                  // Use column for mobile, row for tablet and desktop
                  responsive.isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildCancelButton(context, responsive),
                            SizedBox(height: verticalSpacing),
                            _buildSubmitButton(context, responsive),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: _buildCancelButton(context, responsive)),
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

  Widget _buildCancelButton(BuildContext context, ResponsiveInfo responsive) {
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
        'Cancel',
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
      onPressed: () async {
        await _submitNotification();
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
