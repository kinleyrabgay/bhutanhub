import 'package:bhutanhub/core/constants/keys.dart';
import 'package:bhutanhub/core/errors/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnboardingLocalDatasource {
  const OnboardingLocalDatasource();
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
      await _prefs.setBool(ConstantKeys.cacheKey, false);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> checkIfUserIsFirstTimer() async {
    try {
      return _prefs.getBool(ConstantKeys.cacheKey) ?? true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
