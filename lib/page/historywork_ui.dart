import 'package:flutter/material.dart';

class HistoryWorkPage extends StatefulWidget {
  const HistoryWorkPage({super.key});

  @override
  State<HistoryWorkPage> createState() => _HistoryWorkPageState();
}

class _HistoryWorkPageState extends State<HistoryWorkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ประวัติการทำงาน'),
      ),
      body: const Center(
        child: Text('ประวัติการทำงาน'),
      ),
    );
  }
}
