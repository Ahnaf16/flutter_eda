import 'package:flutter/material.dart';

extension ContextEx on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);

  Brightness get bright => theme.brightness;

  bool get isDark => bright == Brightness.dark;

  BoxDecoration get boxDecoration {
    final color = Colors.grey[10];
    final colorD = Colors.grey[170];

    const border = Colors.black;
    final borderD = Colors.grey[130];

    final boxColor = isDark ? colorD : color;
    final borderColor = isDark ? borderD : border;

    return BoxDecoration(
      color: boxColor,
      borderRadius: BorderRadius.circular(5),
      border: Border.fromBorderSide(
        BorderSide(
          color: borderColor ?? const Color(0xFF000000),
        ),
      ),
    );
  }
}
