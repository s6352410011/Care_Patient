// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:project_final_67/forgot_password_ui.dart';
import 'home_1_ui.dart';
import 'home_2_ui.dart';
import 'package:project_final_67/register_ui.dart';
import 'color.dart';

class LoginUI extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 100),
              Container(
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo_cp.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromRGBO(143, 148, 251, 1),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromRGBO(143, 148, 251, 1),
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.grey[700]),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey[700]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 1900),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_emailController.text.isNotEmpty &&
                                  _passwordController.text.isNotEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('เลือกประเภทที่คุณเป็น'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeCaregiverUI(),
                                                ),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.blue,
                                              onPrimary: Colors.white,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15, horizontal: 30),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              side: BorderSide(
                                                color: Colors.blue,
                                                width: 2,
                                              ),
                                            ),
                                            child: Text('คนดูแล'),
                                          ),
                                          SizedBox(
                                              height:
                                                  10), // ระยะห่าง 3 ระหว่างปุ่ม
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePatientUI(),
                                                ),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.blue,
                                              onPrimary: Colors.white,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15, horizontal: 30),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              side: BorderSide(
                                                color: Colors.blue,
                                                width: 2,
                                              ),
                                            ),
                                            child: Text('ผู้ป่วย'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Error'),
                                      content: Text(
                                        'Please enter both email and password.',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(200, 50),
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              primary: Color.fromARGB(255, 55, 233, 180),
                              onPrimary: Color.fromARGB(255, 136, 138, 137),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: BorderSide(
                                color: Color.fromARGB(255, 136, 226, 176),
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 1900),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterUI(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 50),
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          primary: Color.fromARGB(255, 55, 233, 180),
                          onPrimary: Color.fromARGB(255, 136, 138, 137),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: BorderSide(
                            color: Color.fromARGB(255, 136, 226, 176),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: Text(
                        "— OR LOGIN WITH —",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: ElevatedButton(
                        onPressed: () {
                          // โค้ดเข้าสู่ระบบด้วย Google
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 50),
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          primary: Colors.red, // สีพื้นหลังของปุ่ม
                          onPrimary: Colors.white, // สีของข้อความบนปุ่ม
                          elevation: 5, // เงาของปุ่ม
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: Colors.red), // สีเส้นขอบของปุ่ม
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/g.png',
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                                width: 8), // ระยะห่างระหว่างไอคอนกับข้อความ
                            Text(
                              "Login with Google",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // ระยะห่างด้านบนของปุ่ม
                    FadeInUp(
                      duration: Duration(milliseconds: 1800),
                      child: ElevatedButton(
                        onPressed: () {
                          // โค้ดเข้าสู่ระบบด้วย Facebook
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(200, 50),
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          primary: Colors.blue, // สีพื้นหลังของปุ่ม
                          onPrimary: Colors.white, // สีของข้อความบนปุ่ม
                          elevation: 5, // เงาของปุ่ม
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: Colors.blue), // สีเส้นขอบของปุ่ม
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.facebook,
                              color: Colors.white,
                            ),
                            SizedBox(
                                width: 8), // ระยะห่างระหว่างไอคอนกับข้อความ
                            Text(
                              "Login with Facebook",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    FadeInUp(
                      duration: Duration(milliseconds: 2000),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordUI(),
                              ),
                            );
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: allColor.pr,
                              // color: Color.fromARGB(255, 39, 19, 48),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
