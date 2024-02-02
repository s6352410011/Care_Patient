import 'package:flutter/material.dart';
import 'package:project_final_67/color.dart';
import 'package:project_final_67/page/review_ui.dart';

class CardPatient extends StatefulWidget {
  const CardPatient({Key? key}) : super(key: key);

  @override
  State<CardPatient> createState() => _CardPatientState();
}

class _CardPatientState extends State<CardPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0), // ระยะห่าง 10 จากขอบหน้าจอ
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReviewPage()),
              );
            },
            child: Card(
              color: allColor.pr, // สีพื้นหลังของการ์ด
              elevation: 10, // ระดับการยกขึ้นของการ์ด
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // ทำให้มีขอบโค้ง
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text(
                      'ชื่อผู้ป่วย',
                      style: TextStyle(
                        fontSize: 20, // ขนาดตัวอักษร
                        color: Colors.white, // สีข้อความ
                        fontWeight: FontWeight.bold, // ตัวหนา
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'อายุ : ',
                          style: TextStyle(
                            fontSize: 14, // ขนาดตัวอักษร
                            color: Colors.white, // สีข้อความ
                            fontWeight: FontWeight.bold, // ตัวหนา
                          ),
                        ),
                        Text(
                          'โรคประจำตัว : ',
                          style: TextStyle(
                            fontSize: 14, // ขนาดตัวอักษร
                            color: Colors.white, // สีข้อความ
                            fontWeight: FontWeight.bold, // ตัวหนา
                          ),
                        ),
                        Text(
                          'ความต้องการในการดูแล : ',
                          style: TextStyle(
                            fontSize: 14, // ขนาดตัวอักษร
                            color: Colors.white, // สีข้อความ
                            fontWeight: FontWeight.bold, // ตัวหนา
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
