import 'package:deptech/db/db_karyawan.dart';
import 'package:deptech/model/karyawan.dart';
import 'package:deptech/screens/karyawan/detail_karyawan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Karyawan>? karyawan;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DBKaryawan.instance.getKaryawan().then((value) {
      karyawan = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: (karyawan == null)
          ? CircularProgressIndicator()
          : (karyawan!.length == 0)
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Belum ada data',
                          style: GoogleFonts.poppins()
                              .copyWith(fontSize: 24, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  margin: EdgeInsets.all(30),
                  child: Column(
                    children: karyawan!.map((data) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailKaryawan(data))),
                        child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            width: double.infinity,
                            // height: 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[800]),
                            child: Text('${data.firstName} ${data.lastName}',
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 24, color: Colors.white))),
                      );
                    }).toList(),
                  ),
                ),
    );
  }
}
