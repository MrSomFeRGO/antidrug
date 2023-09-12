
import 'package:antidrugs/repository/local/abstract_local_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository implements AbstractLocalRepository {
  const LocalRepository({required this.prefs});
  final SharedPreferences prefs;

  @override
  bool isContainsKey(String key) {
    return prefs.containsKey(key);
  }

  @override
  Future<bool> removeAllValues() {
    return prefs.clear();
  }

  @override
  Future<bool> removeValue(String key) {
    return prefs.remove(key);
  }

  @override
  Future<bool> setValue(String key, value) async {
    if (value is int) {
      return await prefs.setInt(key, value);
    } else if (value is double) {
      return await prefs.setDouble(key, value);
    } else if (value is bool) {
      return await prefs.setBool(key, value);
    } else {
      return await prefs.setString(key, value);
    }
  }

  @override
  double getDoubleValue(String key) {
    if (prefs.containsKey(key)) {
      return prefs.getDouble(key)!;
    } else {
      throw Exception();
    }
  }

  @override
  int getIntValue(String key) {
    if (prefs.containsKey(key)) {
      return prefs.getInt(key)!;
    } else {
      throw Exception();
    }
  }

  @override
  String getStringValue(String key) {
    if (prefs.containsKey(key)) {
      return prefs.getString(key)!;
    } else {
      throw Exception();
    }
  }

  @override
  bool getBoolValue(String key) {
    if (prefs.containsKey(key)) {
      return prefs.getBool(key)!;
    } else {
      throw Exception();
    }
  }
}
