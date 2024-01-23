import 'package:flutter/material.dart';
import 'package:project_final_67/home_1_ui.dart';
import 'package:project_final_67/home_2_ui.dart';
import 'package:project_final_67/register_ui.dart';
import 'package:project_final_67/forgot_password_ui.dart';
import 'login_ui.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginUI(),
        initialRoute: '/',
        routes: {
          '/HomeCaregiverUI': (context) => HomeCaregiverUI(),
          '/HomePatientUI': (context) => HomePatientUI(),
          '/LoginUI': (context) => LoginUI(),
          '/RegisterUI': (context) => RegisterUI(),
          '/ForgotPassword': (context) => ForgotPasswordUI(),
        });
  }
}
