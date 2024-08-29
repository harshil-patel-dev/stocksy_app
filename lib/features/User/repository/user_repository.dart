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
    // Box keyBox = await Hive.openBox(AppStorage.encryptedBox);
    // var key = await keyBox.get(AppStorage.key);

    // if (key != null) {
    //   var encryptedBox = await Hive.openBox(AppStorage.secureVault,
    //       encryptionCipher: HiveAesCipher(key));
    //   return await encryptedBox.get(AppStorage.accessToken);
    // } else {
    return null;
    // }
  }

  Future<bool?> removeAccessToken() async {
    // Box keyBox = await Hive.openBox(AppStorage.encryptedBox);
    // var key = await keyBox.get(AppStorage.key);
    // if (key != null) {
    //   var encryptedBox = await Hive.openBox(AppStorage.secureVault,
    //       encryptionCipher: HiveAesCipher(key));
    //   await encryptedBox.delete(AppStorage.accessToken);
    //   return true;
    // } else {
    return false;
    // }
  }

  Future<void> setAccessToken(String? token) async {
    // var keyBox = await Hive.openBox(AppStorage.encryptedBox);
    // List<int> key;
    // if (!keyBox.containsKey('key')) {
    //   key = Hive.generateSecureKey();
    //   await keyBox.put(AppStorage.key, key);
    // } else {
    //   key = await keyBox.get(AppStorage.key);
    // }
    // var encryptedBox = await Hive.openBox(AppStorage.secureVault,
    //     encryptionCipher: HiveAesCipher(key));
    // await encryptedBox.put(AppStorage.accessToken, token);
  }
}
