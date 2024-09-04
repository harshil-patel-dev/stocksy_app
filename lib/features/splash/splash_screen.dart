import 'package:stock_trading_app/core/constants/app_export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2), () async {
          if (context.mounted) {
            context.goNamed(Routes.home.name);
          }
        }),
        builder: (context, snapshot) {
          return Scaffold(
            body: Center(
              child: Image.asset('assets/icon.png'),
            ),
          );
        });
  }
}
