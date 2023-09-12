abstract class AbstractLocalRepository {
  Future<bool> setValue(String key, dynamic value);
  int getIntValue(String key);
  double getDoubleValue(String key);
  String getStringValue(String key);
  bool getBoolValue(String key);
  Future<bool> removeValue(String key);
  Future<bool> removeAllValues();
  bool isContainsKey(String key);
}
