import 'package:flutter/material.dart';

mixin LoadingMixin {
  showLoadingSpinner(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (_) => PopScope(
        canPop: false,
        child: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
