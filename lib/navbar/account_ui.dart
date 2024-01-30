import 'package:flutter/material.dart';
import 'package:project_final_67/color.dart';
import 'package:project_final_67/login_ui.dart';
import 'package:project_final_67/page/account_setting_ui.dart';
import 'package:project_final_67/page/reset_password_ui.dart';

class AccountUI extends StatefulWidget {
  const AccountUI({Key? key}) : super(key: key);

  @override
  State<AccountUI> createState() => _AccountUIState();
}

class _AccountUIState extends State<AccountUI> {
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(
                  'assets/user_image.jpg'), // เปลี่ยนเป็นรูปของผู้ใช้
            ),
            SizedBox(height: 20),
            Text(
              'ชื่อผู้ใช้',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.work,
                  color: Colors.brown,
                ),
                SizedBox(width: 10),
                Text(
                  'Active',
                  style: TextStyle(
                    fontSize: 20,
                    color: isActive ? Colors.green : Colors.red,
                  ),
                ),
                SizedBox(width: 10),
                Switch(
                  value: isActive,
                  onChanged: (value) {
                    setState(() {
                      isActive = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AccountSettingUI()), // เปลี่ยน YourNextPage() เป็นหน้าที่ต้องการไป
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.settings, // ไอคอน Account Setting
                    color: Colors.blue, // สีไอคอน Account Setting
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Account Setting ',
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  Icon(Icons.arrow_forward), // ไอคอนลูกศรไปข้างหน้า
                ],
              ),
            ),
            SizedBox(height: 300),
            ElevatedButton(
              onPressed: () {
                // ทำอะไรสักอย่างเมื่อกดปุ่ม Reset Password
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResetPassword()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // สีปุ่มเขียว
              ),
              child:
                  Text('Reset Password', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('ต้องการออกจากระบบหรือไม่?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // ปิดหน้าต่างแจ้งเตือน
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoginUI()), // หน้า Home หรือหน้าอื่นๆที่คุณต้องการ
                            );
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // สีปุ่มแดง
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.logout, // ไอคอน Logout
                    color: Colors.white, // เปลี่ยนสีของไอคอนเป็นสีขาว
                  ),
                  SizedBox(width: 5),
                  Text('Logout', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
