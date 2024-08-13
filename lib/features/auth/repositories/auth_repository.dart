import 'dart:async';
import 'package:rukunsmart/shared/models/user_model.dart';
import 'package:rukunsmart/shared/services/shared_preference_service.dart';

class AuthRepository {
  final SharedPreferenceService _storageService;

  AuthRepository({required SharedPreferenceService storageService})
      : _storageService = storageService;

  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'current_user';

  Future<User> login(String username, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    if (username == 'user@example.com' && password == 'password123') {
      final user = User(id: '1', name: 'John Doe', email: username);
      await _storageService.setString(_tokenKey, 'simulated_jwt_token');
      await _storageService.setObject(_userKey, user.toJson());
      return user;
    } else {
      throw Exception('Invalid credentials');
    }
  }

  Future<void> logout() async {
    await _storageService.remove(_tokenKey);
    await _storageService.remove(_userKey);
  }

  Future<bool> isAuthenticated() async {
    final token = _storageService.getString(_tokenKey);
    return token != null && token.isNotEmpty;
  }

  Future<User?> getCurrentUser() async {
    if (await isAuthenticated()) {
      return _storageService.getObject<User>(
          _userKey, (json) => User.fromJson(json));
    }
    return null;
  }
}
