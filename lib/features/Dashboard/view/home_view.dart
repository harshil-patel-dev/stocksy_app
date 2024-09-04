import 'package:stock_trading_app/core/constants/app_export.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ListView(
          children: [
            Skeletonizer(
              enableSwitchAnimation: true,
              ignoreContainers: true,
              enabled: true,
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
      ),
    );
  }
}
