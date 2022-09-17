import 'package:deptech/admin_pref.dart';
import 'package:deptech/db/db_admin.dart';
import 'package:deptech/model/admin.dart';
import 'package:deptech/screens/admin/edit_admin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int? id;
  Admin? admin;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    AdminPref().getIdAdmin().then((value) {
      id = value;
      DBAdmin.instance.readAdmin(value).then((data) => admin = data);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: id == null && admin == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Halo ${admin!.firstName} ${admin!.lastName}',
                    style: GoogleFonts.poppins()
                        .copyWith(fontSize: 24, color: Colors.white)),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditAdmin(
                                admin: admin!,
                              ))),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Text(
                      'Edit Profil',
                      style:
                          GoogleFonts.poppins().copyWith(color: Colors.white),
                    )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    AdminPref().removeIdAdmin();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Text(
                      'Logout',
                      style:
                          GoogleFonts.poppins().copyWith(color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
    );
  }
}
