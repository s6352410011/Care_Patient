import 'package:flutter/material.dart';
import 'package:project_final_67/color.dart';
import 'package:project_final_67/page/calendar.dart';
import 'package:project_final_67/page/data_patient_ui.dart';
import 'package:project_final_67/page/historywork_ui.dart';
import 'package:project_final_67/page/map_ui.dart';
import 'package:project_final_67/page/review_ui.dart';
import 'package:project_final_67/navbar/notifications_ui.dart';
import 'package:project_final_67/navbar/progressive.dart';
import 'package:project_final_67/navbar/messages.dart';
import 'package:project_final_67/navbar/account.dart';

class HomePatientUI extends StatefulWidget {
  const HomePatientUI({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Bar',
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          ),
      home: HomePatientUI(),
      debugShowCheckedModeBanner: false,
    );
  }

  State<HomePatientUI> createState() => _HomePatientUIState();
}

class _HomePatientUIState extends State<HomePatientUI> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    ProgressiveUI(),
    NotificationsUI(),
    MessengerUI(),
    AccountUI(),
  ];

  static final List<Widget> _widgetOptions = <Widget>[
    Text('Progressive'),
    NotificationsUI(),
    HomePatient(),
    Text('Messages'),
    Text('Account'),
  ];

  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Working';
      case 1:
        return 'Notifications';
      case 2:
        return 'Home';
      case 3:
        return 'Messages';
      case 4:
        return 'Account';
      default:
        return 'Caretaker';
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: allColor.pr,
        title: Text(
          _getAppBarTitle(_selectedIndex),
          style: TextStyle(
            color: Colors.white, // สีที่ต้องการ
            fontWeight: FontWeight.bold, // ตัวหนา
            fontSize: 24, // ขนาดตัวอักษร
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            label: 'Working',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePatient extends StatelessWidget {
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
                    primary: Color.fromARGB(255, 7, 39, 65),
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
            iconColor = const Color.fromARGB(255, 18, 52, 109);
            break;
          case 'รายชื่อทั้งหมด':
            iconData = Icons.list;
            iconColor = const Color.fromARGB(255, 18, 52, 109);
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
