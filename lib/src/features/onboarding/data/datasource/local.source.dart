import 'package:bhutan_hub/core/constants/index.dart';
import 'package:bhutan_hub/core/errors/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnboardingLocalDatasource {
  const OnboardingLocalDatasource();

  // Actual data will never have either failure or success : only one
  Future<void> cacheFirstTimer();
  Future<bool> checkIfUserIsFirstTimer();
}

class OnboardingLocalDatasourceImplementation
    extends OnboardingLocalDatasource {
  const OnboardingLocalDatasourceImplementation(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<void> cacheFirstTimer() async {
    try {
      await _prefs.setBool(Constant.cacheKey, false);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> checkIfUserIsFirstTimer() async {
    try {
      return _prefs.getBool(Constant.cacheKey) ?? true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
