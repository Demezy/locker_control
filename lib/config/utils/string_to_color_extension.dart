import 'dart:ui';

extension StringToColor on String {
  Color toColor() {
    var hash = 0;
    for (var i = 0; i < length; i++) {
      hash += codeUnitAt(i);
      hash += hash << 10;
      hash ^= hash >> 6;
    }
    hash += hash << 3;
    hash ^= hash >> 11;
    hash += hash << 15; // Generate color code in format 0xRRGGBB
    var colorCode = hash & 0x00FFFFFF;
    colorCode |= 0xFF000000;
    return Color(colorCode);
  }
}
