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
              Skeletonizer(
                enableSwitchAnimation: true,
                ignoreContainers: true,
                enabled: false,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Skeleton.leaf(
                        child: ListTile(
                          title: Text(BoneMock.title),
                          subtitle: Text(BoneMock.subtitle),
                          trailing: const Skeleton.keep(
                              child: Icon(
                            Icons.info_rounded,
                            color: Colors.black,
                          )),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
