// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ut_worx/view/auth/login_screen.dart';
import '../../utils/resposive_design/responsive_layout.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _showError = false;
  String _errorMessage = '';
  bool _isObscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Function to handle signup attempt
  void _attemptSignup() {
    // Validate if passwords match
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      setState(() {
        _showError = true;
        _errorMessage = 'Please fill in all fields';
      });
      return;
    }

    if (!_emailController.text.isEmail) {
      setState(() {
        _showError = true;
        _errorMessage = 'Please enter your correct email';
      });
      return;
    }

    if (_passwordController.text.length < 6) {
      setState(() {
        _showError = true;
        _errorMessage = 'Password must be at least 6 characters long.';
      });
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _showError = true;
        _errorMessage = 'Passwords do not match. Please try again.';
      });
      return;
    }

    // Navigate to login screen after successful signup
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF4F7FE),
      body: ResponsiveLayout(
        builder: (context, responsive) {
          // Get responsive values based on device type
          final containerWidth = responsive.deviceValue(
            mobile: 350.0,
            tablet: 400.0,
            desktop: 500.0,
          );

          final padding = responsive.deviceValue(
            mobile: 15.0,
            tablet: 25.0,
            desktop: 25.0,
          );

          final titleFontSize = responsive.deviceValue(
            mobile: 18.0,
            tablet: 22.0,
            desktop: 24.0,
          );

          final labelFontSize = responsive.deviceValue(
            mobile: 14.0,
            tablet: 15.0,
            desktop: 16.0,
          );

          final buttonPadding = responsive.deviceValue(
            mobile: 12.0,
            tablet: 14.0,
            desktop: 16.0,
          );

          final logoHeight = responsive.deviceValue(
            mobile: 60.0,
            tablet: 70.0,
            desktop: 80.0,
          );

          return Center(
            child: SingleChildScrollView(
              child: Container(
                width: containerWidth,
                padding: EdgeInsets.all(padding),
                decoration: BoxDecoration(
                  color: Color(0XFFFFFFFF),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: logoHeight,
                    ),
                    SizedBox(
                        height: responsive.deviceValue(
                      mobile: 8.0,
                      desktop: 15.0,
                    )),
                    Text(
                      "Create an Account",
                      style: TextStyle(
                          fontSize: titleFontSize, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        height: responsive.deviceValue(
                      mobile: 15.0,
                      desktop: 25.0,
                    )),

                    // Email Field
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: labelFontSize,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: _emailController,
                      cursorColor: Color(0XFF7DBD2C),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0XFF7DBD2C),
                          ),
                        ),
                        hintText: "Please enter email",
                        hintStyle: TextStyle(
                          color: Color(0XFF737373),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: responsive.deviceValue(
                            mobile: 10.0,
                            desktop: 14.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: responsive.deviceValue(
                      mobile: 12.0,
                      desktop: 20.0,
                    )),

                    // Password Field
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: labelFontSize,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      cursorColor: Color(0XFF7DBD2C),
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0XFF7DBD2C),
                          ),
                        ),
                        hintText: "Please enter password",
                        hintStyle: TextStyle(
                          color: Color(0XFF737373),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: responsive.deviceValue(
                            mobile: 10.0,
                            tablet: 12.0,
                            desktop: 14.0,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: responsive.deviceValue(
                      mobile: 12.0,
                      desktop: 20.0,
                    )),

                    // Confirm Password Field
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: labelFontSize,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: _isObscure,
                      cursorColor: Color(0XFF7DBD2C),
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0XFF7DBD2C),
                          ),
                        ),
                        hintText: "Please confirm password",
                        hintStyle: TextStyle(
                          color: Color(0XFF737373),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: responsive.deviceValue(
                            mobile: 10.0,
                            tablet: 12.0,
                            desktop: 14.0,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: responsive.deviceValue(
                        mobile: 25.0,
                        tablet: 30.0,
                        desktop: 35.0,
                      ),
                    ),

                    // Sign Up Button
                    SizedBox(
                      height: responsive.deviceValue(
                        mobile: 45.0,
                        tablet: 45.0,
                        desktop: 45.0,
                      ),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFF7DBD2C),
                          padding:
                              EdgeInsets.symmetric(vertical: buttonPadding),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: _attemptSignup,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: responsive.deviceValue(
                              mobile: 14.0,
                              tablet: 16.0,
                              desktop: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: responsive.deviceValue(
                      mobile: 8.0,
                      desktop: 12.0,
                    )),

                    // Already have an account link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: Color(0XFF737373),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                            fontSize: responsive.deviceValue(
                              mobile: 13.0,
                              desktop: 15.0,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Color(0XFF1A71F6),
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0XFF1A71F6),
                              fontSize: responsive.deviceValue(
                                mobile: 13.0,
                                desktop: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Error message box - only shown when _showError is true
                    if (_showError)
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFFFEE2E2),
                          border: Border.all(
                            color: Color.fromARGB(255, 255, 164, 164),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sign Up Error',
                              style: TextStyle(
                                color: Color(0xFF991B1B),
                                fontWeight: FontWeight.bold,
                                fontSize: responsive.deviceValue(
                                  mobile: 12.0,
                                  desktop: 14.0,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              _errorMessage,
                              style: TextStyle(
                                color: Color(0xFFB91C1C),
                                fontSize: responsive.deviceValue(
                                  mobile: 10.0,
                                  desktop: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
