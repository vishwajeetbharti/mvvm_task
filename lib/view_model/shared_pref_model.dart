import 'package:shared_preferences/shared_preferences.dart';

class UserView {
  static saveUser(String id, String number) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("id", id);
    sp.setString("number", number);
  }

  Future<String?> getToekn() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('id');
    return token;
  }

  static Future<String> getUserid() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? id = sp.getString('id');
    return id.toString();
  }

  Future<String> getUsernumber() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? num = sp.getString('number');
    return num.toString();
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
