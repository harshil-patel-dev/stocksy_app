import 'package:stock_trading_app/core/utils/app_storage.dart';

import '../model/user_model.dart';

class UserRepository {
  Future<UserModel> getUserDetails() async {
    String? accessToken = await getAccessToken();

    return UserModel(
      accessToken: accessToken,
    );
  }

  Future<void> setUserDetails({required Map userDetails}) async {
    await setAccessToken(userDetails['access']);
    await setUserId(userDetails['userCode']);
  }

  Future<void> removeUserDetails() async {
    await removeAccessToken();
    await setUserId(0);
  }

  // Future<int> getUserId() async {
  // Box localStorageBox = await Hive.openBox(AppStorage.localStorageBox);
  // return await localStorageBox.get(AppStorage.userId);
  // }

  Future<void> setUserId(int id) async {
    // Box localStorageBox = await Hive.openBox(AppStorage.localStorageBox);
    // await localStorageBox.put(AppStorage.userId, id);
  }

  // access token

  Future<String?> getAccessToken() async {
    return await AppStorage.getAuthToken();
  }

  Future removeAccessToken() async {
    return await AppStorage.removeAuthToken();
  }

  Future<void> setAccessToken(String? token) async {
    return await AppStorage.saveAuthToken(token);
  }
}
