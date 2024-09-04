import 'package:get_it/get_it.dart';
import 'package:stock_trading_app/features/User/bloc/user_bloc.dart';
import '../../features/User/repository/user_repository.dart';
import '../../features/authentication/bloc/auth_bloc.dart';
import '../../features/authentication/repository/auth_repository.dart';
import 'app_info.dart';

final getIt = GetIt.instance;

void initializeDependencies() {
  getIt.registerSingleton<AuthenticationRepository>(AuthenticationRepository());
  getIt.registerSingleton<UserRepository>(UserRepository());
  getIt.registerSingleton<AuthenticationBloc>(AuthenticationBloc(
      authenticationRepository: getIt.get<AuthenticationRepository>()));
  getIt.registerSingleton<UserBloc>(
      UserBloc(userRepository: getIt.get<UserRepository>()));
  getIt.registerSingletonAsync<AppInfo>(() => AppInfo.setAppInfo());
  
}
