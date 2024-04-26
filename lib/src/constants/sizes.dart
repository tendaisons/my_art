// App default Sizing
import 'package:flutter/material.dart';

const tDefaultSize = 30.0;
const tButtonHeight = 15.0;
const tFormHeight = 30.0;
const tSplashContainerSize = 30.0;

// Dashboard
const tDashboardPadding = 20.0;
const tDashboardCardPadding = 10.0;

extension MediaQueryValues on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get toPadding => MediaQuery.of(this).viewPadding.top;
  double get bottom => MediaQuery.of(this).viewInsets.bottom;
}