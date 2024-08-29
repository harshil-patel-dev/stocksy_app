import 'package:hive/hive.dart';
import 'package:stock_trading_app/features/User/model/user_model.dart';

class AppStorage {
  static const _userDataBoxName = 'userData';
  static const _sessionDataBoxName = 'sessionData';
  static const _authenticationDataBoxName = 'authenticationData';

  static Future<void> initialize() async {
    await Hive.openBox(_userDataBoxName);
    await Hive.openBox(_sessionDataBoxName);
    await Hive.openBox(_authenticationDataBoxName);
  }

  // CRUD operations for user data
  static Future<void> saveUserData(UserModel userData) async {
    final box = await Hive.openBox(_userDataBoxName);
    await box.put('userData', userData);
  }

  static Future<UserModel?> getUserData() async {
    final box = await Hive.openBox(_userDataBoxName);
    return box.get('userData') as UserModel?;
  }

  static Future<void> clearUserData() async {
    final box = await Hive.openBox(_userDataBoxName);
    await box.clear();
  }

  // CRUD operations for session data
  // ... (similar to user data)

  // CRUD operations for authentication data
  // ... (similar to user data)
}
