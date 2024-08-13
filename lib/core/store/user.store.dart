import 'package:bhutanhub/core/constants/store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStore {
  final SharedPreferences _prefs;
  UserStore(this._prefs);

  // Save user token
  Future<void> saveToken(String value) async {
    await _prefs.setString(StoreKey.token, value);
  }

  // Get user token
  Future<String?> getToken() async {
    return _prefs.getString(StoreKey.token);
  }
}
