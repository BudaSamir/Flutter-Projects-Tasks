import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  // Named Constructor
  CacheHelper._internal();
  // Singleton
  static final CacheHelper _cacheHelper = CacheHelper._internal();
  factory CacheHelper() => _cacheHelper;

  static late SharedPreferences pref;

  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  Future<bool> put({required String key, required dynamic value}) async {
    if (value is String) {
      return await pref.setString(key, value);
    } else if (value is bool) {
      return await pref.setBool(key, value);
    } else if (value is double) {
      return await pref.setDouble(key, value);
    } else if (value is List<String>) {
      return await pref.setStringList(key, value);
    } else {
      return await pref.setInt(key, value);
    }
  }

  dynamic get({required String key}) {
    return pref.get(key);
  }

  Future<bool> removeData({required key}) async {
    return await pref.remove(key);
  }

  Future<bool> clearData() async {
    return await pref.clear();
  }

  Future<void> cacheLanguageCode(String languageCode) async {
    CacheHelper().put(key: 'LOCALE', value: languageCode);
  }

  Future<String> getCacheLanguageCode() async {
    final cacheLanguageCode = CacheHelper().get(key: 'LOCALE');
    if (cacheLanguageCode != null) {
      return cacheLanguageCode;
    } else {
      return 'ar';
    }
  }
}
