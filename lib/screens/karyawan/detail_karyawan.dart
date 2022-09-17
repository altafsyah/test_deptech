import 'package:deptech/db/db_karyawan.dart';
import 'package:deptech/model/karyawan.dart';
import 'package:deptech/screens/karyawan/edit_karyawan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailKaryawan extends StatelessWidget {
  Karyawan karyawan;

  DetailKaryawan(this.karyawan);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nama Lengkap',
                          style: GoogleFonts.poppins()
                              .copyWith(fontSize: 16, color: Colors.grey[600])),
                      Text(
                        '${karyawan.firstName!} ${karyawan.lastName!}',
                        style: GoogleFonts.poppins()
                            .copyWith(fontSize: 24, color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email',
                          style: GoogleFonts.poppins()
                              .copyWith(fontSize: 16, color: Colors.grey[600])),
                      Text(
                        '${karyawan.email}',
                        style: GoogleFonts.poppins()
                            .copyWith(fontSize: 24, color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('No. HP',
                          style: GoogleFonts.poppins()
                              .copyWith(fontSize: 16, color: Colors.grey[600])),
                      Text(
                        '${karyawan.noHp}',
                        style: GoogleFonts.poppins()
                            .copyWith(fontSize: 24, color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Alamat',
                          style: GoogleFonts.poppins()
                              .copyWith(fontSize: 16, color: Colors.grey[600])),
                      Text(
                        '${karyawan.alamat}',
                        style: GoogleFonts.poppins()
                            .copyWith(fontSize: 24, color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jenis Kelamin',
                          style: GoogleFonts.poppins()
                              .copyWith(fontSize: 16, color: Colors.grey[600])),
                      Text(
                        '${karyawan.jenisKelamin}',
                        style: GoogleFonts.poppins()
                            .copyWith(fontSize: 24, color: Colors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    'Tambah Cuti',
                    style: GoogleFonts.poppins()
                        .copyWith(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditKaryawan(
                        karyawan: karyawan,
                      ),
                    ));
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    'Edit',
                    style: GoogleFonts.poppins()
                        .copyWith(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                DBKaryawan.instance.delete(karyawan).whenComplete(() =>
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/main-screen', (route) => false));
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[800]!),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    'Hapus',
                    style: GoogleFonts.poppins()
                        .copyWith(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
