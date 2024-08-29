import 'package:flutter/material.dart';
import 'package:stock_trading_app/core/constants/app_imports.dart';
import 'package:stock_trading_app/features/authentication/bloc/auth_bloc.dart';
import 'package:stock_trading_app/features/authentication/repository/auth_repository.dart';

class UserProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                    backgroundColor: WidgetStatePropertyAll(Colors.redAccent)),
                onPressed: () {
                  ToastManager.showErrorToast(context, title: 'Logged out !!');
                  context.read<AuthenticationBloc>().add(
                      const AuthenticationStatusChanged(
                          AuthenticationStatus.unauthenticated));
                },
                child: const Text('Logout')),
          ],
        ),
      ),
    );
  }
}
