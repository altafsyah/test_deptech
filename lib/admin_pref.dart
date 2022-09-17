import 'package:shared_preferences/shared_preferences.dart';

class AdminPref {
  Future setIdAdmin(int id) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('id_admin', id);
  }

  Future getIdAdmin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt('id_admin');
  }

  Future removeIdAdmin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove('id_admin');
  }
}
