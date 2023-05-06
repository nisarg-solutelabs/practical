import 'package:flutter/material.dart';

class AppColorScheme {
  ///light color scheme for the aoo
  static ColorScheme lightScheme = const ColorScheme.light(
    primary: Color(
      0XFFF76951,
    ),
    background: Color(
      0XFFFFFFFF,
    ),
  );
}

///card shadows
List<BoxShadow> cardShadow = <BoxShadow>[
  const BoxShadow(
    color: Color.fromRGBO(
      0,
      0,
      0,
      0.1,
    ),
    blurRadius: 3,
    offset: Offset(
      0,
      1,
    ),
  ),
  const BoxShadow(
    color: Color.fromRGBO(
      0,
      0,
      0,
      0.06,
    ),
    blurRadius: 2,
    offset: Offset(
      0,
      1,
    ),
  ),
];
