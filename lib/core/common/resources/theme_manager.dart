import 'package:flutter/material.dart';
import 'package:pct_mark/core/common/resources/color_manager.dart';
import 'package:pct_mark/core/common/resources/font_manager.dart';

class PctTextStyles {
  // login screen styles
  static const TextStyle sigiInTextStyle = TextStyle(
    color: PctColors.signInTextColorBelowMan,
    fontSize: PctFontSize.s18,
    fontFamily: PctFontFamily.Montserrat,
    fontWeight: PctFontWeight.semibold,
  );

  static const TextStyle remMeFogotPsw = TextStyle(
    color: PctColors.rememberMeTextColor,
    fontSize: PctFontSize.s12,
    fontFamily: PctFontFamily.Poppins,
    fontWeight: PctFontWeight.medium,
  );

  static const TextStyle loginScreenNoAccountTitleStyle = TextStyle(
    color: PctColors.signInTextColorBelowMan,
    fontSize: PctFontSize.s12,
    fontFamily: PctFontFamily.Poppins,
    fontWeight: PctFontWeight.regular,
  );
}



// ThemeData getApplicationTheme() {
//   return ThemeData(
//     //main colors of the app
//     primaryColor: ColorManager.primary,
//     primaryColorLight: ColorManager.primaryOpacity70,
//     primaryColorDark: ColorManager.darkPrimary,
//     disabledColor: ColorManager.grey1, //will be used in case of disabled button

//     //ripple color
//     splashColor: ColorManager.primaryOpacity70,

//     //TODO -1 look for accent color attribute  add ColorManager.Grey
//     colorScheme: ColorScheme.fromSwatch(accentColor: ColorManager.grey),

//     //TODO -2 add card theme according to app requirement
//     cardTheme: CardTheme(
//         color: ColorManager.white,
//         shadowColor: ColorManager.grey,
//         elevation: AppSize.s4),

//     //appbar theme
//     //TODO -3 add appbar theme according to app requitment

//     appBarTheme: AppBarTheme(
//         centerTitle: true,
//         color: ColorManager.primary,
//         elevation: AppSize.s4,
//         shadowColor: ColorManager.primaryOpacity70,
//         titleTextStyle:
//             getRegularStyle(color: ColorManager.white, fontSize: FontSize.s12)),
//     //button theme
//     //TODO -4 add button theme according to app requirement

//     buttonTheme: ButtonThemeData(
//       shape: const StadiumBorder(),
//       disabledColor: ColorManager.grey1,
//       buttonColor: ColorManager.primary,
//       splashColor: ColorManager.primaryOpacity70,
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         textStyle: getRegularStyle(color: ColorManager.white),
//         backgroundColor: ColorManager.primary,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(AppSize.s12),
//         ),
//       ),
//     ),

//     //text theme
//     //TODO -5 Modify textTheme according to requirement
//     textTheme: TextTheme(
//         displayLarge: getSemiBoldStyle(
//             color: ColorManager.darkGrey, fontSize: FontSize.s15),
//         titleMedium: getMediumStyle(
//             color: ColorManager.lightGrey, fontSize: FontSize.s14),
//         bodySmall: getRegularStyle(color: ColorManager.grey1),
//         bodyLarge: getRegularStyle(color: ColorManager.grey)),

//     //input decoration theme(text formfield)

//     inputDecorationTheme: InputDecorationTheme(
//       contentPadding: const EdgeInsets.all(AppPadding.p8),
//       //hint style
//       hintStyle: getRegularStyle(color: ColorManager.grey1),
//       //label style
//       labelStyle: getMediumStyle(color: ColorManager.darkGrey),
//       //error style
//       errorStyle: getRegularStyle(color: ColorManager.error),
//       //enabled border
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(AppSize.s8),
//         ),
//       ),

//       //focus border
//       focusedBorder: OutlineInputBorder(
//         borderSide:
//             BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(AppSize.s8),
//         ),
//       ),

//       //error border
//       errorBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(AppSize.s8),
//         ),
//       ),

//       //focus error border
//       focusedErrorBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(AppSize.s8),
//         ),
//       ),
//     ),
//   );
// }
