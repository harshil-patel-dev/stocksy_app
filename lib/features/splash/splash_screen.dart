import 'package:flutter/foundation.dart';
import 'package:stock_trading_app/core/constants/app_export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1), () async {
          if (context.mounted) {
            context.goNamed(Routes.home.name);
          }
        }),
        builder: (context, snapshot) {
          return Scaffold(
            body: Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: const Hero(
                  tag: AppConstants.AppLogoHeroTag,
                  child: Text(
                    "Shuru.com",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.blueAccent),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
