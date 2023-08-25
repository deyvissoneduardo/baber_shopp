import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

sealed class Messages {
  static void showError(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
        icon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.error_outline,
            color: Color(0x15000000),
            size: 90,
          ),
        ),
      ),
    );
  }

  static void showInfo(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message: message,
        icon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.sentiment_neutral,
            color: Color(0x15000000),
            size: 90,
          ),
        ),
      ),
    );
  }

  static void showSuccess(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
        icon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.sentiment_very_satisfied,
            color: Color(0x15000000),
            size: 90,
          ),
        ),
      ),
    );
  }
}
