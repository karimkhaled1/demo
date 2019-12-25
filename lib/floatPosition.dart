import 'package:flutter/material.dart';
import 'dart:math' as math;

class StartFloatFloatingActionButtonLocation
    extends FloatingActionButtonLocation {
  const StartFloatFloatingActionButtonLocation();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // Compute the x-axis offset.
    final double fabX = _endOffset(scaffoldGeometry);

    // Compute the y-axis offset.
    final double contentBottom = scaffoldGeometry.contentBottom;
    final double bottomSheetHeight = scaffoldGeometry.bottomSheetSize.height;
    final double fabHeight = scaffoldGeometry.floatingActionButtonSize.height;
    final double snackBarHeight = scaffoldGeometry.snackBarSize.height;

    double fabY = contentBottom - fabHeight - kFloatingActionButtonMargin;
    if (snackBarHeight > 0.0)
      fabY = math.min(
          fabY,
          contentBottom -
              snackBarHeight -
              fabHeight -
              kFloatingActionButtonMargin);
    if (bottomSheetHeight > 0.0)
      fabY =
          math.min(fabY, contentBottom - bottomSheetHeight - fabHeight / 2.0);

    return Offset(fabX, fabY);
  }

  @override
  String toString() => 'FloatingActionButtonLocation.StartFloat';
}

double _endOffset(ScaffoldPrelayoutGeometry scaffoldGeometry,
    {double offset = 0.0}) {
  assert(scaffoldGeometry.textDirection != null);

  return _rightOffset(scaffoldGeometry, offset: offset);
}

double _rightOffset(ScaffoldPrelayoutGeometry scaffoldGeometry,
    {double offset = 0.0}) {
  return scaffoldGeometry.scaffoldSize.width -
      kFloatingActionButtonMargin -
      scaffoldGeometry.minInsets.right -
      scaffoldGeometry.floatingActionButtonSize.width +
      offset;
}
