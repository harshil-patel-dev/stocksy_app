import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_trading_app/app.dart';
import 'package:stock_trading_app/core/router/routes.dart';

import 'package:stock_trading_app/features/Dashboard/view/dashboard_view.dart';
import 'package:stock_trading_app/features/Dashboard/view/home_view.dart';
import 'package:stock_trading_app/features/User/view/user_profile_view.dart';
import '../../features/Login/view/login_view.dart';
import '../../features/SignUp/view/signup_view.dart';
import '../../features/authentication/bloc/auth_bloc.dart';
import 'view/error_route_screen.dart';

class AppRouter {
  final AuthenticationBloc authenticationBloc;
  AppRouter({required this.authenticationBloc});

  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
  final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

  late final router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: Routes.home.path,
      debugLogDiagnostics: true,
      refreshListenable: authenticationBloc,
      redirect: (BuildContext context, GoRouterState state) {
        if (authenticationBloc.state == const AuthenticationState.unknown()) {
          if (state.path == Routes.splash.path) return null;
          return Routes.splash.path;
        } else if (authenticationBloc.state ==
            const AuthenticationState.unauthenticated()) {
          if (state.matchedLocation == Routes.login.path) return null;
          if (state.matchedLocation == Routes.signUp.path) return null;
          return Routes.login.path;
        } else {
          if (state.matchedLocation == Routes.login.path ||
              state.matchedLocation == Routes.signUp.path ||
              state.matchedLocation == Routes.home.path) {
            return Routes.home.path;
          }
          return null;
        }
      },
      errorPageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: ErrorScreen(),
        );
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: SplashScreen(),
          ),
        ),
        GoRoute(
          name: Routes.login.name,
          path: Routes.login.path,
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          name: Routes.signUp.name,
          path: Routes.signUp.path,
          builder: (context, state) => SignUpScreen(),
        ),
        StatefulShellRoute.indexedStack(
            parentNavigatorKey: _rootNavigatorKey,
            builder: (context, state, navigationShell) {
              return DashboardScreen(navigationShell: navigationShell);
            },
            branches: [
              StatefulShellBranch(
                navigatorKey: _shellNavigatorAKey,
                routes: [
                  GoRoute(
                    name: Routes.home.path,
                    path: Routes.home.path,
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: HomeView(),
                    ),
                    routes: const [
                      // child route
                      // GoRoute(
                      //   path: 'details',
                      //   builder: (context, state) =>
                      //       const DetailsScreen(label: 'A'),
                      // ),
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                navigatorKey: _shellNavigatorBKey,
                routes: [
                  GoRoute(
                    name: Routes.profile.name,
                    path: Routes.profile.path,
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        child: UserProfileView(),
                      );
                    },
                    routes: const [
                      // child route
                      // GoRoute(
                      //   path: 'details',
                      //   builder: (context, state) =>
                      //       const DetailsScreen(label: 'B'),
                      // ),
                    ],
                  ),
                ],
              ),
            ])
      ]);
}
