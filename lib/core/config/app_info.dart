import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  String appName = '';
  String packageName = '';
  String version = '';
  String buildNumber = '';
  String deviceId = '';
  String deviceModel = '';
  AppInfo({
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
    required this.deviceId,
    required this.deviceModel,
  });

  static Future<AppInfo> setAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceIdentifier = "";
    String deviceModelName = '';
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceIdentifier = androidInfo.id;
      deviceModelName = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceIdentifier = iosInfo.identifierForVendor ?? '';
      deviceModelName = iosInfo.utsname.machine;
    }
    AppInfo appInfo = AppInfo(
      appName: packageInfo.appName,
      packageName: packageInfo.packageName,
      version: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
      deviceId: deviceIdentifier,
      deviceModel: deviceModelName,
    );
    return appInfo;
  }
}
