import 'dart:async';

import 'package:deptech/admin_pref.dart';
import 'package:deptech/db/db_admin.dart';
import 'package:deptech/helper.dart';
import 'package:deptech/model/admin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  void initState() {
    // TODO: implement initState
    AdminPref().getIdAdmin().then((value) {
      Timer(Duration(seconds: 2), () {
        print(value);
        if (value != null)
          Navigator.pushNamedAndRemoveUntil(
              context, '/main-screen', (route) => false);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Form(
              key: _formKey,
              child: Container(
                child: Column(
                  children: [
                    TextFormField(
                      style:
                          GoogleFonts.poppins().copyWith(color: Colors.white),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.red)),
                          hintText: 'Email',
                          hintStyle: GoogleFonts.poppins()
                              .copyWith(color: Colors.white)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email harus diisi';
                        } else {
                          if (checkEmail(value)) {
                            return null;
                          }
                          return 'Email tidak valid';
                        }
                      },
                      onSaved: (newValue) {
                        email = newValue;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      cursorColor: Colors.white,
                      style:
                          GoogleFonts.poppins().copyWith(color: Colors.white),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.red)),
                          hintText: 'Password',
                          hintStyle: GoogleFonts.poppins()
                              .copyWith(color: Colors.white)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password harus diisi';
                        } else {
                          if (value.length < 8) {
                            return 'Password minimal 8 karakter';
                          }
                          return null;
                        }
                      },
                      onSaved: (newValue) {
                        password = newValue;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum punya akun? ',
                        style: GoogleFonts.poppins().copyWith(
                          color: Colors.grey[800],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/register', (route) => false);
                        },
                        child: Text(
                          'Daftar',
                          style: GoogleFonts.poppins().copyWith(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        DBAdmin.instance
                            .loginAdmin(email!, password!)
                            .then((value) {
                          print(value);
                          if (value != null) {
                            if (value) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/main-screen', (route) => false);
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      child: Text('Gagal Login'),
                                    );
                                  });
                            }
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: Text('Gagal Login'),
                                  );
                                });
                          }
                        });
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text('Masuk'),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
