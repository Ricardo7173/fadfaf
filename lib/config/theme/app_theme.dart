import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Un tema a partir de un color hex.
const Color _customColor = Color(0xFFF6F0080);

//Una lista d etemas predefinidos
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }) : assert(
    selectedColor >= 0 && selectedColor <=_colorThemes.length - 1,
    'El color se debe econtrar entre 0 y ${_colorThemes.length -1}'
    );

  ThemeData theme() {
    return ThemeData(colorSchemeSeed: _colorThemes[selectedColor],
    brightness: Brightness.dark
    );
  }
}
