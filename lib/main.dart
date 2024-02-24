import 'package:flutter/material.dart';
import 'package:care_patient/color.dart';
import 'package:care_patient/login_ui.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('th_TH', null); // เลือก locale ตามต้องการ
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: AllColor
            .pr, // กำหนดสีพื้นหลังที่ต้องการให้กับ Bottom Navigation Bar
      ),
      home: LoginUI(),
    );
  }
}
