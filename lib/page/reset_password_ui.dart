import 'package:flutter/material.dart';
import 'package:project_final_67/color.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reset Password',
          style: TextStyle(
            fontWeight: FontWeight.bold, // ตัวหนา
            color: Colors.white, // สีข้อความ
          ),
        ),
        backgroundColor: allColor.pr, // สีพื้นหลังของ AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // เขียนโค้ดสำหรับรีเซ็ตรหัสผ่านที่นี่
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}