// forgot_password_ui.dart

import 'package:flutter/material.dart';

class ForgotPasswordUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Center(
        child: Text('This is the Forgot Password page'),
      ),
    );
  }
}
