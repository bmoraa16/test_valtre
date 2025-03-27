import 'package:flutter/material.dart';

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble());

  SizedBox get pw => SizedBox(width: toDouble());
}

extension ScreenPercentage on int {
  heightPercent(Size size) {
    var size2 = this;
    var percent = size2 / 100;
    var percentage = size.height * percent;
    return percentage;
  }

  widthPercent(Size size) {
    var size2 = this;
    var percent = size2 / 100;
    var percentage = size.width * percent;
    return percentage;
  }
}
