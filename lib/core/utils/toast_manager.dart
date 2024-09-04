import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toastification/toastification.dart';

class ToastManager {

  
  static ToastificationConfig config = const ToastificationConfig();

  static void showSuccessToast(BuildContext context,
      {required String title,
      String? description,
      bool dismissExisting = true}) {
    if (dismissExisting) {
      toastification.dismissAll();
    }
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      title: Text(title),
      description: description != null ? Text(description) : null,
      alignment: _getToastAlignment(),
      autoCloseDuration: const Duration(seconds: 4),
      foregroundColor: const Color(0xff000000),
      boxShadow: highModeShadow,
      showProgressBar: false,
      dragToClose: true,
    );
  }

  static void showErrorToast(BuildContext context,
      {required String title,
      String? description,
      bool dismissExisting = true}) {
    if (dismissExisting) {
      toastification.dismissAll();
    }
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
      {required String title,
      String? description,
      bool dismissExisting = true}) {
    if (dismissExisting) {
      toastification.dismissAll();
    }
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
        showProgressBar: false);
  }

  static void showInfoToast(BuildContext context,
      {required String title,
      String? description,
      bool dismissExisting = true}) {
    if (dismissExisting) {
      toastification.dismissAll();
    }
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
        showProgressBar: false);
  }

  static Alignment _getToastAlignment() {
    if (kIsWeb) {
      return Alignment.topRight;
    }
    return Alignment.topCenter;
  }
}
