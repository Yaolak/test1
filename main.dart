import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'register.dart';
import 'login.dart';
import 'hello.dart';  

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      routes: {
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/hello': (context) => HelloPage(),  
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(  
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center,  
            children: [
              ElevatedButton(
                onPressed: () {
                  
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('ลงทะเบียน'),
              ),
              SizedBox(height: 20),  
              ElevatedButton(
                onPressed: () {
                
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('เข้าสู่ระบบ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// หน้า HelloPage (ทักทายผู้ใช้หลังจากเข้าสู่ระบบ)
class HelloPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ยินดีต้อนรับ'),
      ),
      body: Center(
        child: Text(
          'เข้าสู่ระบบสำเร็จ!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
