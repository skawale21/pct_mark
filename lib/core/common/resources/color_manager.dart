import 'package:flutter/material.dart';

class PctColors {
  static const mainColor = Color(0xFF1FB198);
  static const backgroundColor = Colors.white;
  static const whiteColor = Colors.white;
  static const greyColor = Colors.grey;
  static const transparantColor = Colors.transparent;
  static const blackColor = Colors.black;
  static Color primary = HexColor.fromHex("#ED9728");
  // static Color darkGrey = HexColor.fromHex("#525252");
  // static Color grey = HexColor.fromHex("#737477");
  // static Color lightGrey = HexColor.fromHex("#9E9E9E");
  // static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");

  // static Color mainColor = const Color(0xFF1FB198);

  // // new colors
  // static Color darkPrimary = HexColor.fromHex("#d17d11");
  // static Color grey1 = HexColor.fromHex("#707070");
  // static Color grey2 = HexColor.fromHex("#797979");
  // static Color white = HexColor.fromHex("#FFFFFF");
  // static Color error = HexColor.fromHex("#e61f34");
  // static Color black = HexColor.fromHex("#000000"); // red color

  // //complain screen colors

  // static Color complainStatusTextOpenColor = HexColor.fromHex("#EF743C");
  // static Color complainStatusTextResolvedColor = HexColor.fromHex("#16A163");
  // static Color complainResendTextColor = HexColor.fromHex("#16A163");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
