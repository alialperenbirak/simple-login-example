import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  Future<bool> saveToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(CacheManagerKey.TOKEN.toString());
  }
}

enum CacheManagerKey { TOKEN }
