import 'package:deptech/screens/admin/edit_admin.dart';
import 'package:deptech/screens/auth/login_screen.dart';
import 'package:deptech/screens/main/main_screen.dart';
import 'package:flutter/material.dart';

import 'screens/auth/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deptech',
      theme: ThemeData(
        backgroundColor: Color(0xff082223),
      ),
      initialRoute: '/',
      // home: LoginScreen(),
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/main-screen': (context) => MainScreen(),
      },
    );
  }
}
