import 'package:stock_trading_app/core/constants/app_export.dart';

class DashboardScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const DashboardScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: _appDashboardView(),
      tablet: _appDashboardView(),
      web: _webDashboardView(context),
    );
  }

  Scaffold _appDashboardView() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shuru.com",
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.blueAccent),
        ),
      ),
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
          NavigationDestination(
              label: 'Profile', icon: Icon(Icons.person_2_rounded)),
        ],
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }

  Scaffold _webDashboardView(BuildContext context) {
    return Scaffold(
      appBar: _webNavbarView(context),
      body: Expanded(
        child: navigationShell,
      ),
    );
  }

  PreferredSizeWidget _webNavbarView(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 60),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          children: [
            const Hero(
                tag: AppConstants.AppLogoHeroTag,
                child: Text(
                  "Shuru.com",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.blueAccent),
                )),
            const Spacer(),
            _navButton(context, 'Dashboard', 0),
            _navButton(context, 'Profile', 1),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  Widget _navButton(BuildContext context, String label, int index) {
    bool isSelected = navigationShell.currentIndex == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        onPressed: () => navigationShell.goBranch(index),
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
}
