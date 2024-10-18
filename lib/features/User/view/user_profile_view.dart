import 'package:flutter/foundation.dart';
import 'package:stock_trading_app/core/constants/app_export.dart';
import 'package:stock_trading_app/features/authentication/bloc/auth_bloc.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !kIsWeb
          ? AppBar(
              title: const Text('User Profile'),
            )
          : null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextButton(
            //     style: const ButtonStyle(
            //         foregroundColor: WidgetStatePropertyAll(Colors.white),
            //         backgroundColor: WidgetStatePropertyAll(Colors.black)),
            //     onPressed: () {
            //       if (Theme.of(context).brightness == Brightness.dark) {
            //         context.read<ThemeCubit>().updateTheme(ThemeMode.light);
            //       } else {
            //         context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
            //       }
            //     },
            //     child: const Text('Change Theme')),
            ElevatedButton(
                style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    backgroundColor: WidgetStatePropertyAll(Colors.redAccent)),
                onPressed: () {
                  ToastManager.showErrorToast(context, title: 'Logged out !!');
                  context.read<AuthenticationBloc>().add(AuthLogoutRequested());
                },
                child: const Text('Logout')),
          ],
        ),
      ),
    );
  }
}
