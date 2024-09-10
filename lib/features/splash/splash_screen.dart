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
            backgroundColor: Colors.white,
            body: Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                width:
                    MediaQuery.of(context).size.width * (kIsWeb ? 0.25 : 0.70),
                child: Hero(
                  tag: AppConstants.AppLogoHeroTag,
                  child: Image.asset(
                    'assets/icon.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
