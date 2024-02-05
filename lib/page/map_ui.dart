import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แผนที่'),
      ),
      body: WebView(
        initialUrl: 'https://www.google.co.th/maps',
        javascriptMode:
            JavascriptMode.unrestricted, // อนุญาตการใช้งาน JavaScript
        userAgent: 'CustomUserAgent', // ตั้งค่า UserAgent ของ WebView
        initialMediaPlaybackPolicy:
            AutoMediaPlaybackPolicy.always_allow, // ตั้งค่าการเล่นสื่ออัตโนมัติ
        debuggingEnabled: true, // เปิดโหมด Debug
        onPageStarted: (url) {
          // เมื่อหน้าเว็บเริ่มโหลด
        },
        onPageFinished: (url) {
          // เมื่อหน้าเว็บโหลดเสร็จสมบูรณ์
        },
        onWebResourceError: (error) {
          // เมื่อมีข้อผิดพลาดในการโหลดเนื้อหาเว็บ
        },
      ),
    );
  }
}
