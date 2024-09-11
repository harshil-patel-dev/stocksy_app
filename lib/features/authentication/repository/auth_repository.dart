import 'dart:async';
import 'package:stock_trading_app/core/config/dependency_injector.dart';
import 'package:stock_trading_app/core/utils/app_storage.dart';
import 'package:stock_trading_app/features/User/bloc/user_bloc.dart';

import '../../User/repository/user_repository.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final controller = StreamController<AuthenticationStatus>();
  bool showIntroScreen = false;

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* controller.stream;
  }

  Future<void> authenticateUser() async {
    String? token = await AppStorage.getAuthToken();
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
    await getIt.get<UserRepository>().removeUserDetails();
    await AppStorage.removeAuthToken();
    await AppStorage.clearUserData();
    getIt.get<UserBloc>().add(SetInitialUserDetails());

    controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => controller.close();
}
