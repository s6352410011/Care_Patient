import 'package:flutter/material.dart';
import 'package:project_final_67/color.dart';
import 'package:project_final_67/home_main_patient_ui.dart';
import 'package:project_final_67/page/historywork_ui.dart';
import 'package:project_final_67/register_ui.dart';
import 'package:project_final_67/forgot_password_ui.dart';
import 'package:project_final_67/home_main_caregiver_ui.dart';
import 'package:project_final_67/login_ui.dart';
import 'package:project_final_67/test.dart';
import 'package:intl/intl.dart';
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
        canvasColor: allColor
            .pr, // กำหนดสีพื้นหลังที่ต้องการให้กับ Bottom Navigation Bar
      ),
      home: LoginUI(),
    );
  }
}
