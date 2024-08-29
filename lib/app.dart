import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_trading_app/core/config/service_locator.dart';
import 'package:stock_trading_app/core/router/app_router.dart';
import 'package:toastification/toastification.dart';

import 'core/utils/toast_manager.dart';
import 'features/User/bloc/user_bloc.dart';
import 'features/authentication/bloc/auth_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router =
      AppRouter(authenticationBloc: getIt.get<AuthenticationBloc>()).router;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: getIt.get<AuthenticationBloc>().authenticationRepository,
          ),
          RepositoryProvider.value(
            value: getIt.get<UserBloc>().userRepository,
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: getIt.get<AuthenticationBloc>(),
            ),
            BlocProvider.value(
              value: getIt.get<UserBloc>()..add(SetInitialUserDetails()),
            ),
          ],
          child: ToastificationWrapper(
            config: ToastManager.config,
            child: MaterialApp.router(
              routerConfig: _router,
              debugShowCheckedModeBanner: false,
              title: 'AppConfig.appName',
            ),
          ),
        ));
  }
}


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}