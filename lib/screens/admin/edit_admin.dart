import 'package:deptech/admin_pref.dart';
import 'package:deptech/db/db_admin.dart';
import 'package:deptech/helper.dart';
import 'package:deptech/model/admin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditAdmin extends StatefulWidget {
  final Admin admin;
  const EditAdmin({Key? key, required this.admin}) : super(key: key);

  @override
  State<EditAdmin> createState() => _EditAdminState();
}

class _EditAdminState extends State<EditAdmin> {
  final _formKey = GlobalKey<FormState>();
  Admin adminModel = Admin();

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextFormField(
                            initialValue: widget.admin.firstName,
                            style: GoogleFonts.poppins()
                                .copyWith(color: Colors.white),
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
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.red)),
                                hintText: 'First Name',
                                hintStyle: GoogleFonts.poppins()
                                    .copyWith(color: Colors.white)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nama depan harus diisi';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              adminModel.firstName = newValue;
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextFormField(
                            initialValue: widget.admin.lastName,
                            style: GoogleFonts.poppins()
                                .copyWith(color: Colors.white),
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
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.red)),
                                hintText: 'Last Name',
                                hintStyle: GoogleFonts.poppins()
                                    .copyWith(color: Colors.white)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nama belakang harus diisi';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              adminModel.lastName = newValue;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue: widget.admin.email,
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
                        adminModel.email = newValue;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue: widget.admin.password,
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
                        adminModel.password = newValue;
                      },
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  adminModel.id = widget.admin.id;
                  DBAdmin.instance.update(adminModel).whenComplete(() =>
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/main-screen', (route) => false));
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
      )),
    );
  }
}
