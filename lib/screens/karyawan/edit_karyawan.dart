import 'package:deptech/db/db_karyawan.dart';
import 'package:deptech/helper.dart';
import 'package:deptech/model/karyawan.dart';
import 'package:deptech/screens/karyawan/detail_karyawan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditKaryawan extends StatefulWidget {
  final Karyawan karyawan;
  const EditKaryawan({Key? key, required this.karyawan}) : super(key: key);

  @override
  State<EditKaryawan> createState() => _EditKaryawanState();
}

class _EditKaryawanState extends State<EditKaryawan> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Karyawan karyawan = widget.karyawan;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
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
                              initialValue: karyawan.firstName,
                              style: GoogleFonts.poppins()
                                  .copyWith(color: Colors.white),
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
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
                                karyawan.firstName = newValue;
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              initialValue: karyawan.lastName,
                              style: GoogleFonts.poppins()
                                  .copyWith(color: Colors.white),
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(12)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
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
                                karyawan.lastName = newValue;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: karyawan.email,
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
                          karyawan.email = newValue;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: karyawan.noHp,
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.number,
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
                            hintText: 'No HP',
                            hintStyle: GoogleFonts.poppins()
                                .copyWith(color: Colors.white)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'No HP harus diisi';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          karyawan.noHp = newValue;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: karyawan.alamat,
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
                            hintText: 'Alamat',
                            hintStyle: GoogleFonts.poppins()
                                .copyWith(color: Colors.white)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Alamat harus diisi';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          karyawan.alamat = newValue;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField<String>(
                        value: karyawan.jenisKelamin,
                        dropdownColor: Colors.grey,
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
                            hintText: 'Alamat',
                            hintStyle: GoogleFonts.poppins()
                                .copyWith(color: Colors.white)),
                        isExpanded: true,
                        items: [
                          DropdownMenuItem(
                            child: Text('Pria'),
                            value: 'Pria',
                          ),
                          DropdownMenuItem(
                            child: Text('Wanita'),
                            value: 'Wanita',
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {});
                        },
                        onSaved: (newValue) {
                          karyawan.jenisKelamin = newValue;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Harap diisi';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print(karyawan.jenisKelamin);
                    DBKaryawan.instance.update(karyawan).whenComplete(() =>
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
                    child: Text('Simpan'),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
