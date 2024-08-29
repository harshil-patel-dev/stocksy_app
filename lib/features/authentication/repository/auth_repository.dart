import 'dart:async';
import '../../User/repository/user_repository.dart';

enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated
}

class AuthenticationRepository {
  final controller = StreamController<AuthenticationStatus>();
  bool showIntroScreen = false;

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* controller.stream;
  }

  Future<void> authenticateUser() async {
    UserRepository userRepository = UserRepository();
    String? token = await userRepository.getAccessToken();
    await getIntroScreenShown();

    if (token != null) {
      controller.add(AuthenticationStatus.authenticated);
    } else {
      controller.add(AuthenticationStatus.unauthenticated);
    }
  }

  Future<void> getIntroScreenShown() async {
    // Box localStorageBox = await Hive.openBox(AppStorage.localStorageBox);
    // var showIntro = await localStorageBox.get(AppStorage.showIntroScreen);
    // if (showIntro == null) {
    //   showIntroScreen = true;
    // }
  }

  Future<void> setIntroScreenShown() async {
    // Box localStorageBox = await Hive.openBox(AppStorage.localStorageBox);
    // await localStorageBox.put(AppStorage.showIntroScreen, false);
    // showIntroScreen = false;
  }

  Future<void> logOut() async {
    UserRepository userRepository = UserRepository();
    await userRepository.removeUserDetails();

    // getIt.get<UserBloc>().add(SetInitialUserDetails());

    controller.add(AuthenticationStatus.unauthenticated);
  }

  // Future<ApiResult> resetPasssword({required String password}) async {
  //   ApiResult apiResult =
  //       await _authenticationService.resetPassword(password: password);
  //   return apiResult;
  // }

  // Future<ApiResult> changePasssword(
  //     {required String oldPassword,
  //     required String newPassword,
  //     }) async {
  //   ApiResult apiResult = await _authenticationService.changePassword(
  //       oldPassword: oldPassword,
  //       newPassword: newPassword,
  //   );
  //   return apiResult;
  // }

  void dispose() => controller.close();
}
