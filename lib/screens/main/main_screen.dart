import 'package:deptech/db/db_karyawan.dart';
import 'package:deptech/screens/karyawan/add_karyawan.dart';
import 'package:deptech/screens/main/cuti_screen.dart';
import 'package:deptech/screens/main/home_screen.dart';
import 'package:deptech/screens/main/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    Widget body() {
      switch (_index) {
        case 0:
          return HomeScreen();
        case 1:
          return CutiScreen();
        case 2:
          return ProfileScreen();
        default:
          return HomeScreen();
      }
    }

    Widget AddKaryawanFAB() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddKaryawan()));
        },
        child: Icon(Icons.add),
      );
    }

    Widget AddCuti() {
      return FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      );
    }

    Widget fab() {
      switch (_index) {
        case 0:
          return AddKaryawanFAB();
        case 1:
          return AddCuti();
        default:
          return Container();
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(child: body()),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[800],
        selectedItemColor: Colors.white,
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        unselectedItemColor: Colors.white24,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Karyawan'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Cuti'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profil'),
        ],
      ),
      floatingActionButton: fab(),
    );
  }
}
