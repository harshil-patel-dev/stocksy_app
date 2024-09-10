import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_trading_app/core/constants/app_export.dart';

class CustomNavbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Colors.white,
      child: Row(
        children: [
          Hero(
            tag: AppConstants.AppLogoHeroTag,
            child: Container(
              width: 200,
              height: 60,
              margin: const EdgeInsets.all(12),
              child: Image.asset(
                'assets/icon.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const Spacer(),
          _navButton(context, route: Routes.home, label: 'Dashboard'),
          _navButton(context, route: Routes.profile, label: 'Profile'),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _navButton(
    BuildContext context, {
    required Routes route,
    required String label,
  }) {
    bool isSelected = (GoRouterState.of(context).path ?? '/') == route.path;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        onPressed: () => context.goNamed(route.name),
        style: TextButton.styleFrom(
          backgroundColor:
              isSelected ? Colors.deepPurpleAccent.withOpacity(0.1) : null,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.deepPurpleAccent : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
