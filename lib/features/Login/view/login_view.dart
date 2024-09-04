import 'package:stock_trading_app/core/constants/app_export.dart';
import 'package:stock_trading_app/features/authentication/bloc/auth_bloc.dart';
import 'package:stock_trading_app/features/authentication/repository/auth_repository.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login Form',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                style: const ButtonStyle(
                    foregroundColor: WidgetStatePropertyAll(Colors.black),
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.greenAccent)),
                onPressed: () {
                  ToastManager.showSuccessToast(context,
                      title: 'Login Successfull');
                  context.read<AuthenticationBloc>().add(
                      const AuthenticationStatusChanged(
                          AuthenticationStatus.authenticated));
                },
                child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
