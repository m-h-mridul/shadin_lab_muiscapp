import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ColorManager.dart';

class ThemeManager {
  static RxBool themeModecheak = true.obs;
  static ThemeMode themeMode = ThemeMode.light;
  static void themeModeCheak(bool value) {
    themeModecheak.value = !themeModecheak.value;
    if (themeModecheak.value) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
  }
}

ThemeData lighttheme = ThemeData(
  appBarTheme: AppBarTheme(
      elevation: 1.0, backgroundColor: ColorManager.primary),
  primaryColor: ColorManager.primary,
);

//***
//
//
// */
// ThemeData lighttheme = ThemeData(
//   appBarTheme: const AppBarTheme(
//       elevation: 1.0, backgroundColor: ColorManager.appbarBackgroud),
//   primaryColor: ColorManager.greenNormal,
//   dividerColor: ColorManager.gray,
//   scaffoldBackgroundColor: ColorManager.scaffoldbackground,
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ButtonStyle(
//       textStyle: MaterialStateProperty.all<TextStyle>(
//         GoogleFonts.jost(
//           fontSize: Get.textScaleFactor * 15,
//           color: ColorManager.white,
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//       // fixedSize: MaterialStateProperty.all<Size>(
//       //     Size(Get.size.width, Get.size.height * 0.07)),
//       // padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
//       //     vertical: MediaQuerypage.safeBlockVertical!,
//       //     horizontal: MediaQuerypage.safeBlockHorizontal!)),
//       backgroundColor:
//           MaterialStateProperty.all<Color>(ColorManager.greenhover),
//       shape: MaterialStateProperty.all<OutlinedBorder>(
//         RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       ),
//     ),
//   ),
//   textTheme: TextTheme(
//     titleMedium: GoogleFonts.jost(
//       fontSize: Get.textScaleFactor * 16,
//       color: ColorManager.white,
//       fontWeight: FontWeight.w500,
//     ),
//     titleSmall: GoogleFonts.jost(
//       fontSize: Get.textScaleFactor * 16,
//       color: ColorManager.gray,
//       fontWeight: FontWeight.w500,
//     ),
//     displayLarge: GoogleFonts.jost(
//       fontSize: Get.textScaleFactor * 24,
//       color: ColorManager.black,
//       fontWeight: FontWeight.w600,
//     ),
//     displayMedium: GoogleFonts.jost(
//       fontSize: Get.textScaleFactor * 22,
//       color: ColorManager.black,
//       fontWeight: FontWeight.w600,
//     ),
//     displaySmall: GoogleFonts.jost(
//       fontSize: Get.textScaleFactor * 20,
//       color: ColorManager.black,
//       fontWeight: FontWeight.w600,
//     ),
//     labelLarge: GoogleFonts.jost(
//       fontSize: Get.textScaleFactor * 22,
//       color: ColorManager.greenhover,
//       fontWeight: FontWeight.w400,
//     ),
//     labelMedium: GoogleFonts.jost(
//       fontSize: Get.textScaleFactor * 20,
//       color: ColorManager.greenhover,
//       fontWeight: FontWeight.w500,
//     ),
//     labelSmall: GoogleFonts.jost(
//       fontSize: Get.textScaleFactor * 15,
//       color: ColorManager.greenhover,
//       fontWeight: FontWeight.w400,
//     ),
//   ),
//   floatingActionButtonTheme: FloatingActionButtonThemeData(
//     backgroundColor: ColorManager.greenhover,
//     //shape: ShapeBorder.lerp(a, b, t),
//     elevation: 1,
//     extendedTextStyle: GoogleFonts.poppins(
//       fontSize: Get.textScaleFactor * 14,
//       fontWeight: FontWeight.w500,
//       color: ColorManager.white,
//     ),
//   ),
//);
