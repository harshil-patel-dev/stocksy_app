import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:stock_trading_app/core/config/dependency_injector.dart';
import 'package:stock_trading_app/core/constants/app_export.dart';
import 'package:stock_trading_app/core/network/network_connection_checker.dart';
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
  final GoRouter _router =
      AppRouter(authenticationBloc: getIt.get<AuthenticationBloc>()).router;

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      config: ToastManager.config,
      child: MultiRepositoryProvider(
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
            BlocProvider.value(
              value: NetworkConnectionChecker(),
            ),
          ],
          child: MaterialApp.router(
            routerConfig: _router,
            debugShowCheckedModeBanner: false,
            title: 'AppConfig.appName',
            builder: (context, child) => BlocListener<NetworkConnectionChecker,
                InternetConnectionStatus>(
              listenWhen: (previous, current) => previous != current,
              listener: (context, state) {
                if (state == InternetConnectionStatus.connected) {
                  ToastManager.showSuccessToast(context, title: 'Back Online');
                } else {
                  ToastManager.showErrorToast(context,
                      title: 'No Internet Connection');
                }
              },
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
