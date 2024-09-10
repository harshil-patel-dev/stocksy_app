import 'package:stock_trading_app/core/constants/app_export.dart';
import 'package:stock_trading_app/features/Dashboard/view/dashboard_view.dart';
import 'package:stock_trading_app/features/Dashboard/view/detail.dart';
import 'package:stock_trading_app/features/Dashboard/view/home_view.dart';
import 'package:stock_trading_app/features/User/view/user_profile_view.dart';
import 'package:stock_trading_app/features/splash/splash_screen.dart';
import '../../features/Login/view/login_view.dart';
import '../../features/SignUp/view/signup_view.dart';
import '../../features/authentication/bloc/auth_bloc.dart';
import 'view/error_route_screen.dart';

class AppRouter {
  final AuthenticationBloc authenticationBloc;
  AppRouter({required this.authenticationBloc});

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final _homeNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'home');
  static final _profileNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'profile');

  late final router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: Routes.splash.path,
      debugLogDiagnostics: true,
      refreshListenable: authenticationBloc,
      redirect: (BuildContext context, GoRouterState state) {
        final currentRoute = Routes.values.firstWhere(
          (route) => route.path == state.matchedLocation,
          orElse: () => Routes.splash,
        );

        if (authenticationBloc.state == const AuthenticationState.unknown()) {
          if (currentRoute == Routes.splash) return null;
          return Routes.splash.path;
        } else if (authenticationBloc.state ==
            const AuthenticationState.unauthenticated()) {
          if (currentRoute == Routes.login) return null;
          if (currentRoute == Routes.signUp) return null;
          return Routes.login.path;
        } else {
          if (currentRoute == Routes.login ||
              currentRoute == Routes.signUp ||
              currentRoute == Routes.home) {
            return Routes.home.path;
          }
          return null;
        }
      },
      errorPageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const ErrorScreen(),
        );
      },
      routes: [
        GoRoute(
          path: Routes.splash.path,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const SplashScreen(),
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
            pageBuilder: (context, state, navigationShell) =>
                CustomTransitionPage(
                    child: DashboardScreen(navigationShell: navigationShell),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child)),
            branches: [
              StatefulShellBranch(
                navigatorKey: _homeNavigatorKey,
                routes: [
                  GoRoute(
                    name: Routes.home.path,
                    path: Routes.home.path,
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: HomeView(),
                    ),
                    routes: [
                      GoRoute(
                          parentNavigatorKey: _homeNavigatorKey,
                          name: 'details',
                          path: 'details',
                          builder: (context, state) => const DetailsView(),
                          routes: [
                            GoRoute(
                              parentNavigatorKey: _homeNavigatorKey,
                              name: 'details2',
                              path: 'details2',
                              builder: (context, state) => const Details2View(),
                            )
                          ]),
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                navigatorKey: _profileNavigatorKey,
                routes: [
                  GoRoute(
                    name: Routes.profile.name,
                    path: Routes.profile.path,
                    pageBuilder: (context, state) {
                      return const NoTransitionPage(
                        child: UserProfileView(),
                      );
                    },
                  ),
                ],
              ),
            ])
      ]);
}
