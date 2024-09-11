import 'package:stock_trading_app/core/constants/app_export.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (!ResponsiveLayout.isDesktop(context))
                Align(
                  alignment: Alignment.topLeft,
                  child: Hero(
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
                ),
              ListView(
                shrinkWrap: true,
                children: [
                  Skeletonizer(
                    enableSwitchAnimation: true,
                    ignoreContainers: true,
                    enabled: false,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 8,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Skeleton.leaf(
                            child: ListTile(
                              title: Text(BoneMock.title),
                              subtitle: Text(BoneMock.subtitle),
                              leading: const Icon(
                                Icons.home,
                                color: Colors.black,
                                size: 60,
                              ),
                              trailing: const Skeleton.keep(
                                  child: Icon(
                                Icons.arrow_right,
                                color: Colors.black,
                              )),
                            ),
                          );
                        }),
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          foregroundColor: WidgetStatePropertyAll(Colors.black),
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.yellowAccent)),
                      onPressed: () {
                        context.goNamed('details');
                      },
                      child: const Text('Navigate')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
