import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stock_trading_app/core/config/service_locator.dart';
import 'app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  setUpServices();
  await dotenv.load();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  runApp(const MyApp());
}
