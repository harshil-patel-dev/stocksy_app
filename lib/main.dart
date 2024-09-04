import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stock_trading_app/core/config/dependency_injector.dart';
import 'app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  initializeDependencies();
  await dotenv.load();

  var path = "/assets/db";
  if (!kIsWeb) {
    final dir = await getApplicationDocumentsDirectory();
    path = dir.path;
  }
  Hive.init(path);
  runApp(const MyApp());
}
