import 'package:stock_trading_app/core/constants/app_export.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  Color bgColor = Colors.lightBlueAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Page')),
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              style: const ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Colors.green),
                  backgroundColor: WidgetStatePropertyAll(Colors.white)),
              onPressed: () {
                setState(() {
                  if (bgColor == Colors.lightBlueAccent) {
                    bgColor = Colors.amberAccent;
                  } else {
                    bgColor = Colors.lightBlueAccent;
                  }
                });
                ToastManager.showInfoToast(context, title: 'Color changed !!');
              },
              child: const Text('Change Color')),
          ElevatedButton(
              style: const ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                  backgroundColor: WidgetStatePropertyAll(Colors.white)),
              onPressed: () {
                context.goNamed('details2');
              },
              child: const Text('Navigate 2')),
        ],
      ),
    );
  }
}

class Details2View extends StatefulWidget {
  const Details2View({super.key});

  @override
  State<Details2View> createState() => _Details2ViewState();
}

class _Details2ViewState extends State<Details2View> {
  Color bgColor = Colors.lightBlueAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details 2 Page')),
      backgroundColor: bgColor,
      body: const Center(child: Text('Welcome')),
    );
  }
}
