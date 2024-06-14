import 'package:flutter/material.dart';

/// BottomSheetExtension extension of BuildContext
///
/// Functions include:
/// [showAppBottomSheet]
extension BottomSheetExtension on BuildContext {
  /// Show bottom sheet in current app
  ///
  /// [colorBorder] set color into colorBorder, if null,
  /// color of colorBorder is default
  /// [backgroundColor] set color into color background, if null,
  /// color of colorBorder is default
  /// [fillColor] set color into fillColor, if null,
  /// color of fillColor is default
  /// [child] not null, main content of bottom sheet
  void showAppBottomSheet({
    Color? colorBorder,
    Color? backgroundColor,
    Color? fillColor,
    Color? barrierColor,
    bool isScrollControlled = true,
    bool isDismissible = true,
    bool? useSafeArea = false,
    required Widget child,
  }) {
    showModalBottomSheet(
      useRootNavigator: true,
      useSafeArea: useSafeArea??false,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor ?? Colors.transparent,
      barrierColor: barrierColor ?? Colors.transparent,
      isDismissible: isDismissible,
      context: this,
      builder: (context) {
        return child;
      },
    );
  }
}
