import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stock_trading_app/features/User/model/user_model.dart';

class AppStorage {
  static const _userDataBoxName = 'userData';
  static const _sessionDataBoxName = 'sessionData';
  static const _encryptionKeyName = 'encryptionKey';

  static Future<void> initialize() async {
    var path = "/assets/db";
    if (!kIsWeb) {
      final dir = await getApplicationDocumentsDirectory();
      path = dir.path;
    }
    Hive.init(path);
    await _openEncryptedBox(_userDataBoxName);
    await _openEncryptedBox(_sessionDataBoxName);
  }

  static Future<Box> _openEncryptedBox(String boxName) async {
    final encryptionKey = await _getOrCreateEncryptionKey();
    return await Hive.openBox(
      boxName,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  static Future _getOrCreateEncryptionKey() async {
    final keyBox = await Hive.openBox(_encryptionKeyName);
    if (!keyBox.containsKey('key')) {
      final key = Hive.generateSecureKey();
      await keyBox.put('key', key);
      return key;
    }
    return keyBox.get('key');
  }

  // CRUD operations for user data
  static Future<void> saveUserData(UserModel userData) async {
    final box = await _openEncryptedBox(_userDataBoxName);
    await box.put('userData', userData.toJson());
  }

  static Future<UserModel?> getUserData() async {
    final box = await _openEncryptedBox(_userDataBoxName);
    final userData = box.get('userData');
    return userData != null ? UserModel.fromJson(userData) : null;
  }

  static Future<void> clearUserData() async {
    final box = await _openEncryptedBox(_userDataBoxName);
    await box.clear();
  }

  // Auth token operations
  static Future<void> saveAuthToken(String? token) async {
    final box = await _openEncryptedBox(_sessionDataBoxName);
    await box.put('authToken', token);
  }

  static Future<String?> getAuthToken() async {
    final box = await _openEncryptedBox(_sessionDataBoxName);
    return box.get('authToken');
  }

  static Future<void> removeAuthToken() async {
    final box = await _openEncryptedBox(_sessionDataBoxName);
    await box.delete('authToken');
  }

  // Session ID operations
  static Future<void> saveSessionId(String sessionId) async {
    final box = await _openEncryptedBox(_sessionDataBoxName);
    await box.put('sessionId', sessionId);
  }

  static Future<String?> getSessionId() async {
    final box = await _openEncryptedBox(_sessionDataBoxName);
    return box.get('sessionId');
  }

  static Future<void> removeSessionId() async {
    final box = await _openEncryptedBox(_sessionDataBoxName);
    await box.delete('sessionId');
  }
}
