import 'package:flutter/material.dart';
import 'package:project_final_67/g.dart';
import 'package:project_final_67/home_1_ui.dart';
import 'package:project_final_67/home_2_ui.dart';
import 'package:project_final_67/register_ui.dart';
import 'package:project_final_67/forgot_password_ui.dart';
import 'login_ui.dart';
import 'g.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginUI(),
    );
  }
}
