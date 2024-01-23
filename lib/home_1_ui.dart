import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_final_67/calendar.dart';

class HomeCaregiverUI extends StatelessWidget {
  const HomeCaregiverUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('HOME'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              buildRow(context, ['ปฏิทิน', 'ประวัติการทำงาน']),
              const SizedBox(height: 10.0),
              buildRow(context, ['ข้อมูลผู้ป่วย', 'แผนที่ ', 'คะแนนรีวิว']),
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
        return Expanded(
          child: Container(
            height: 60.0,
            child: ElevatedButton(
              onPressed: () {
                // ตรวจสอบว่าปุ่มที่ถูกกดคือ "ปฏิทิน" หรือไม่
                if (label == 'ปฏิทิน') {
                  // เปิดหน้าปฏิทิน
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CalendarPage()),
                  );
                } else {
                  // ทำอะไรเมื่อปุ่มอื่น ๆ ถูกกด
                  if (kDebugMode) {
                    print('Pressed $label');
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(label),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
