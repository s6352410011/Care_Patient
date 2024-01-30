import 'package:flutter/material.dart';
import 'package:project_final_67/color.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  TextEditingController _reviewController =
      TextEditingController(); // เพิ่ม Controller สำหรับจัดการข้อความรีวิว

  @override
  void dispose() {
    _reviewController.dispose(); // จัดการการคืนทรัพยากร
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: allColor.pr, // สีพื้นหลังของ AppBar
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // จัดตำแหน่งตรงกลาง
          children: [
            Text(
              'คะแนนรีวิว ',
              style: TextStyle(
                fontWeight: FontWeight.bold, // ตัวหนา
                color: Colors.white, // สีข้อความ
              ),
            ),
            Icon(Icons.star,
                color: Colors.amber), // ไอคอน รูปดาว พร้อมกับสีของไอคอน
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10, // จำนวนรีวิว
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text('รีวิวที่ ${index + 1}'), // ข้อความรีวิว
                  subtitle:
                      Text('คำอธิบายรีวิวที่ ${index + 1}'), // คำอธิบายรีวิว
                  trailing: Icon(Icons
                      .arrow_forward_ios), // ไอคอนเพื่อนำทางไปยังรายละเอียดเพิ่มเติม
                  onTap: () {
                    // การทำงานเมื่อกดรีวิว
                    // คุณสามารถเพิ่มโค้ดที่นี่เพื่อเปิดหน้ารีวิวเพิ่มเติมหรือทำอะไรก็ตามตามที่คุณต้องการ
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _reviewController,
                    decoration: InputDecoration(
                      hintText: 'เขียนรีวิว', // ข้อความในช่องพิมพ์
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // การทำงานเมื่อกดปุ่มส่งรีวิว
                    String reviewText = _reviewController.text;
                    // คุณสามารถทำอะไรก็ตามกับข้อความรีวิวที่ผู้ใช้พิมพ์ตรงนี้
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
