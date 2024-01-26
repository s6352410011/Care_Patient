import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_final_67/color.dart';
import 'package:project_final_67/page/calendar.dart';
import 'package:project_final_67/page/data_patient_ui.dart';
import 'package:project_final_67/page/historywork_ui.dart';
import 'package:project_final_67/page/map_ui.dart';
import 'package:project_final_67/page/review_ui.dart';

class HomeCaregiverUI extends StatelessWidget {
  const HomeCaregiverUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'HOME',
            style: TextStyle(
              fontSize: 24, // กำหนดขนาดตัวอักษร
              fontWeight: FontWeight.bold, // กำหนดให้ตัวอักษรหนา
              color: Colors.white, // กำหนดสีของตัวอักษร
            ),
          ),
          backgroundColor: allColor.pr, // กำหนดสีพื้นหลังของ AppBar
          centerTitle: true, // จัดข้อความตรงกลาง
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              buildRow(context, ['ปฏิทิน', 'ประวัติการทำงาน']),
              const SizedBox(height: 10.0),
              buildRow(context, ['ข้อมูลผู้ป่วย', 'แผนที่', 'คะแนนรีวิว']),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow(BuildContext context, List<String> labels) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: labels.map((label) {
        IconData iconData;
        Color iconColor;

        // กำหนด icon และสีของ icon ตาม label
        switch (label) {
          case 'ปฏิทิน':
            iconData = Icons.calendar_today;
            iconColor = Colors.blue;
            break;
          case 'ประวัติการทำงาน':
            iconData = Icons.history;
            iconColor = Colors.green;
            break;
          case 'ข้อมูลผู้ป่วย':
            iconData = Icons.person;
            iconColor = Colors.orange;
            break;
          case 'แผนที่':
            iconData = Icons.map;
            iconColor = Colors.red;
            break;
          case 'คะแนนรีวิว':
            iconData = Icons.star;
            iconColor = Colors.yellow;
            break;
          default:
            iconData = Icons.error;
            iconColor = Colors.grey;
            break;
        }

        return Expanded(
          child: Container(
            height: 60.0,
            child: ElevatedButton.icon(
              onPressed: () {
                // โค้ดเมื่อปุ่มถูกกด
                switch (label) {
                  case 'ปฏิทิน':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CalendarPage()),
                    );
                    break;
                  case 'ประวัติการทำงาน':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HistoryWorkPage()),
                    );
                    break;
                  case 'ข้อมูลผู้ป่วย':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PatientPage()),
                    );
                    break;
                  case 'แผนที่':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MapPage()),
                    );
                    break;
                  case 'คะแนนรีวิว':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReviewPage()),
                    );
                    break;
                  default:
                    // กรณีที่ไม่มีการจัดการสำหรับปุ่มอื่นๆ
                    break;
                }
              },
              icon: Icon(iconData, color: iconColor), // Icon
              label: Text(label), // Text
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white, // สีของข้อความ
                textStyle: const TextStyle(fontSize: 16.0), // ขนาดตัวอักษร
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: const BorderSide(
                      color:
                          Color.fromARGB(255, 255, 255, 255)), // สีขอบของปุ่ม
                ),
                primary: Colors.lightBlueAccent, // สีพื้นหลังของปุ่ม
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
