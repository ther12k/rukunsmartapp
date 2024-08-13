import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static SharedPreferenceService? _instance;
  static SharedPreferences? _preferences;

  SharedPreferenceService._();

  static Future<SharedPreferenceService> getInstance() async {
    if (_instance == null) {
      _instance = SharedPreferenceService._();
      await _instance!._init();
    }
    return _instance!;
  }

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // String
  Future<bool> setString(String key, String value) async {
    return await _preferences!.setString(key, value);
  }

  String? getString(String key) {
    return _preferences!.getString(key);
  }

  // int
  Future<bool> setInt(String key, int value) async {
    return await _preferences!.setInt(key, value);
  }

  int? getInt(String key) {
    return _preferences!.getInt(key);
  }

  // double
  Future<bool> setDouble(String key, double value) async {
    return await _preferences!.setDouble(key, value);
  }

  double? getDouble(String key) {
    return _preferences!.getDouble(key);
  }

  // bool
  Future<bool> setBool(String key, bool value) async {
    return await _preferences!.setBool(key, value);
  }

  bool? getBool(String key) {
    return _preferences!.getBool(key);
  }

  // List<String>
  Future<bool> setStringList(String key, List<String> value) async {
    return await _preferences!.setStringList(key, value);
  }

  List<String>? getStringList(String key) {
    return _preferences!.getStringList(key);
  }

  // Save any object
  Future<bool> setObject(String key, Object value) async {
    return await _preferences!.setString(key, json.encode(value));
  }

  // Get any object
  T? getObject<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    final jsonString = _preferences?.getString(key);
    if (jsonString != null) {
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      return fromJson(jsonMap);
    }
    return null;
  }

  // Check if key exists
  bool containsKey(String key) {
    return _preferences!.containsKey(key);
  }

  // Remove a key
  Future<bool> remove(String key) async {
    return await _preferences!.remove(key);
  }

  // Clear all data
  Future<bool> clear() async {
    return await _preferences!.clear();
  }
}
