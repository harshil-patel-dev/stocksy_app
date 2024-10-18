import 'package:stock_trading_app/core/constants/app_export.dart';
import 'package:stock_trading_app/features/Dashboard/view/dashboard_view.dart';
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
        if (state.matchedLocation == Routes.splash.path) {
          // If auth state is known, redirect to appropriate screen
          if (authenticationBloc.state ==
              const AuthenticationState.authenticated()) {
            return Routes.home.path;
          } else if (authenticationBloc.state ==
              const AuthenticationState.unauthenticated()) {
            return Routes.login.path;
          }
          // If auth state is unknown, stay on splash screen
          return null;
        }

        // Handle other routes based on auth state
        if (authenticationBloc.state ==
            const AuthenticationState.unauthenticated()) {
          if (state.matchedLocation == Routes.login.path ||
              state.matchedLocation == Routes.signUp.path) {
            return null;
          }
          return Routes.login.path;
        } else if (authenticationBloc.state ==
            const AuthenticationState.authenticated()) {
          if (state.matchedLocation == Routes.login.path ||
              state.matchedLocation == Routes.signUp.path) {
            return Routes.home.path;
          }
        }

        // If no redirect is necessary, return null
        return null;
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
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          name: Routes.signUp.name,
          path: Routes.signUp.path,
          builder: (context, state) => const SignUpScreen(),
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
