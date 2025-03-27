import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HbScaffoldWidget extends StatelessWidget {
  const HbScaffoldWidget({
    super.key,
    required this.body,
    this.statusBarColor = Colors.transparent,
    this.statusBarBrightness = Brightness.light,
    this.backgroundColor,
    this.appBar,
    this.bottomNavigationBar,
  });

  final Widget body;
  final Color statusBarColor;
  final Brightness statusBarBrightness;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarBrightness: statusBarBrightness,
        statusBarIconBrightness: buildStatusBarBrightness(),
      ),
      child: Scaffold(
        appBar: appBar,
        body: body,
        backgroundColor: backgroundColor,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }

  Brightness buildStatusBarBrightness() =>
      statusBarBrightness == Brightness.light
          ? (Platform.isAndroid ? Brightness.dark : Brightness.light)
          : (Platform.isAndroid ? Brightness.light : Brightness.dark);
}
