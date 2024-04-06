import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ColorUtil {
  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  static Color changeColorHue(Color color, double newHueValue) =>
      HSLColor.fromColor(color).withHue(newHueValue).toColor();

  static Color changeColorSaturation(Color color, double newSaturationValue) =>
      HSLColor.fromColor(color).withSaturation(newSaturationValue).toColor();

  static Color changeColorLightness(Color color, double newLightnessValue) =>
      HSLColor.fromColor(color).withLightness(newLightnessValue).toColor();



}
