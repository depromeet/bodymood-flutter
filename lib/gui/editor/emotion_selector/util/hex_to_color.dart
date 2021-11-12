import 'package:flutter/material.dart';

Color stringHexToColor(String hex) {
  final hexString = hex.replaceAll('#', '0xff');
  final intHex = int.parse(hexString);
  return Color(intHex);
}
