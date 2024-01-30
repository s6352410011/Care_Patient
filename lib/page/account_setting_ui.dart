import 'package:flutter/material.dart';
import 'package:project_final_67/login_ui.dart';

class AccountSettingUI extends StatefulWidget {
  const AccountSettingUI({Key? key}) : super(key: key);

  @override
  State<AccountSettingUI> createState() => _AccountSettingUIState();
}

class _AccountSettingUIState extends State<AccountSettingUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Setting'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/user_image.jpg'),
                // รูป user มีปุ่มให้กดเปลี่ยน
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'ชื่อ-นามสกุล'),
                // ชื่อ-นามสกุล
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                // email
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'เบอร์โทรศัพท์'),
                // เบอร์โทรศัพท์
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'ที่อยู่'),
                // ที่อยู่
              ),
              SizedBox(height: 300),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('ต้องการลบบัญชีของคุณถาวร?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // ปิดหน้าต่างแจ้งเตือน
                            },
                            child: Text('Close'),
                          ),
                          TextButton(
                            onPressed: () {
                              // ทำอะไรสักอย่างเมื่อกดปุ่ม OK
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginUI(),
                                ),
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
                child: Text('Delete Account',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
