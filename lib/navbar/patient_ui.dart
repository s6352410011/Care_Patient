import 'package:flutter/material.dart';
import 'package:project_final_67/color.dart';
import 'package:project_final_67/page/calendar.dart';
import 'package:project_final_67/page/data_patient_ui.dart';
import 'package:project_final_67/page/historywork_ui.dart';
import 'package:project_final_67/page/map_ui.dart';
import 'package:project_final_67/page/review_ui.dart'; // นำเข้าไลบรารีที่เกี่ยวข้อง

class HomePatientUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              buildRow(context, ['ปฏิทิน', 'ประวัติการว่าจ้าง']),
              const SizedBox(height: 10.0),
              buildRow(context, ['ข้อมูลผู้ดูแล', 'แผนที่', 'คะแนนรีวิว']),
              const SizedBox(height: 20.0),
              buildRowWithNames(context, ['รายชื่อผู้ดูแล', 'รายชื่อทั้งหมด']),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow(BuildContext context, List<String> labels) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: labels
          .map((label) {
            IconData iconData;
            Color iconColor;

            switch (label) {
              case 'ปฏิทิน':
                iconData = Icons.calendar_today;
                iconColor = Colors.blue;
                break;
              case 'ประวัติการว่าจ้าง':
                iconData = Icons.history;
                iconColor = Colors.green;
                break;
              case 'ข้อมูลผู้ดูแล':
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
                    switch (label) {
                      case 'ปฏิทิน':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CalendarPage(),
                          ),
                        );
                        break;
                      case 'ประวัติการว่าจ้าง':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HistoryWorkPage(),
                          ),
                        );
                        break;
                      case 'ข้อมูลผู้ดูแล':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PatientPage(),
                          ),
                        );
                        break;
                      case 'แผนที่':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapPage(),
                          ),
                        );
                        break;
                      case 'คะแนนรีวิว':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReviewPage(),
                          ),
                        );
                        break;
                      default:
                        break;
                    }
                  },
                  icon: Icon(iconData, color: iconColor),
                  label: Text(label),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    textStyle: const TextStyle(fontSize: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    primary: allColor.sc,
                  ),
                ),
              ),
            );
          })
          .expand((widget) => [
                widget,
                SizedBox(
                  width: 0,
                )
              ])
          .toList(),
    );
  }

  Widget buildRowWithNames(BuildContext context, List<String> labels) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: labels.map((label) {
        IconData iconData;
        Color iconColor;

        switch (label) {
          case 'รายชื่อผู้ดูแล':
            iconData = Icons.recent_actors;
            iconColor = allColor.sc;
            break;
          case 'รายชื่อทั้งหมด':
            iconData = Icons.list;
            iconColor = allColor.sc;
            break;
          default:
            iconData = Icons.error;
            iconColor = Colors.grey;
            break;
        }

        return Expanded(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  switch (label) {
                    case 'รายชื่อทั้งหมด':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReviewPage(),
                        ),
                      );
                      break;
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: allColor.pr,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: label == 'รายชื่อผู้ดูแล'
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        Icon(iconData, color: iconColor),
                        SizedBox(width: 5),
                        Text(
                          label,
                          style:
                              TextStyle(color: Colors.white), // กำหนดสีข้อความ
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
