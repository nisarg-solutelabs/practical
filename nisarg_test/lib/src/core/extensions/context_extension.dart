import 'package:flutter/material.dart';

///extension of the [BuildContext]
extension BuildContextExtension on BuildContext {
  ///return [ColorScheme] of the app
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  ///return [TextTheme] of the app
  TextTheme get textTheme => Theme.of(this).textTheme;

  ///return [Size] of the device
  Size get size => MediaQuery.of(this).size;

  ///return width of the device
  double get width => size.width;

  ///return height of the device
  double get height => size.height;
}

extension IntExtension on int {
  ///sized box with width
  SizedBox get hs => SizedBox(
        width: toDouble(),
      );

  ///sized box with height
  SizedBox get vs => SizedBox(
        height: toDouble(),
      );
}

///extension of the [double]
extension DoubleExtension on double {
  ///sized box with width
  SizedBox get hs => SizedBox(
        width: toDouble(),
      );

  ///sized box with height
  SizedBox get vs => SizedBox(
        height: toDouble(),
      );
}
