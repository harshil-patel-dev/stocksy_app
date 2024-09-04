import 'dart:async';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stock_trading_app/core/constants/app_export.dart';

class NetworkConnectionChecker extends Cubit<InternetConnectionStatus> {
  late InternetConnectionChecker _connection;
  StreamSubscription? _subscription;

  NetworkConnectionChecker() : super(InternetConnectionStatus.connected) {
    _connection = InternetConnectionChecker.createInstance(
      checkInterval: const Duration(seconds: 10),
      customCheckOptions: [
        AddressCheckOption(uri: Uri.parse('https://1.1.1.1')),
        AddressCheckOption(
          uri: Uri.parse('https://google.com'),
        ),
      ],
      useDefaultOptions: false,
    );

    _subscription = _connection.onStatusChange.listen((status) async {
      if (status == InternetConnectionStatus.connected) {
        emit(InternetConnectionStatus.connected);
      } else if (status == InternetConnectionStatus.disconnected) {
        emit(InternetConnectionStatus.disconnected);
      }
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
