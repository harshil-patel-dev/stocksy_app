import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toastification/toastification.dart';

class ToastManager {
  static ToastificationConfig config = const ToastificationConfig();

  static void showSuccessToast(BuildContext context,
      {required String title, String? description}) {
    toastification.dismissAll();
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      title: Text(title),
      description: description != null ? Text(description) : null,
      alignment: _getToastAlignment(),
      autoCloseDuration: const Duration(seconds: 4),
      foregroundColor: Color(0xff000000),
      boxShadow: highModeShadow,
      showProgressBar: false,
      dragToClose: true,
    );
  }

  static void showErrorToast(BuildContext context,
      {required String title, String? description}) {
    toastification.dismissAll();
    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: Text(title),
      description: description != null ? Text(description) : null,
      alignment: _getToastAlignment(),
      autoCloseDuration: const Duration(seconds: 4),
      boxShadow: highModeShadow,
      showProgressBar: false,
      dragToClose: true,
    );
  }

  static void showWarningToast(BuildContext context,
      {required String title, String? description}) {
    toastification.show(
      context: context,
      type: ToastificationType.warning,
      style: ToastificationStyle.flatColored,
      title: Text(title),
      description: description != null ? Text(description) : null,
      alignment: _getToastAlignment(),
      autoCloseDuration: const Duration(seconds: 4),
      boxShadow: highModeShadow,
      dragToClose: true,
    );
  }

  static void showInfoToast(BuildContext context,
      {required String title, String? description}) {
    toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.flatColored,
      title: Text(title),
      description: description != null ? Text(description) : null,
      alignment: _getToastAlignment(),
      autoCloseDuration: const Duration(seconds: 4),
      boxShadow: highModeShadow,
      dragToClose: true,
    );
  }

  static Alignment _getToastAlignment() {
    switch (Platform.operatingSystem) {
      case 'android':
      case 'ios':
        return Alignment.topCenter;
      case 'web':
        return Alignment.topRight;
      default:
        return Alignment.topCenter;
    }
  }
}
