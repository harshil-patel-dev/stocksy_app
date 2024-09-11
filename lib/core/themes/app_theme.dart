// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AppTheme {
//   AppTheme._();

//   static ThemeData data(bool isDark) {
//     return ThemeData(
//       brightness: isDark ? Brightness.dark : Brightness.light,
//       appBarTheme: AppBarTheme(
//         backgroundColor: isDark ? AppColor.navy : AppColor.purple,
//         centerTitle: true,
//         elevation: 2.h,
//         titleTextStyle: AppFont.bold.s16,
//       ),
//       floatingActionButtonTheme: FloatingActionButtonThemeData(
//         backgroundColor: isDark ? AppColor.blue : AppColor.lightPurple,
//         foregroundColor: isDark ? Colors.white : Colors.black,
//         elevation: 2.h,
//         extendedTextStyle: AppFont.normal.s14,
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: isDark ? AppColor.blue : AppColor.lightPurple,
//           elevation: 2.h,
//           textStyle: AppFont.normal.s14,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(6.r),
//           ),
//         ),
//       ),
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//       fontFamily: GoogleFonts.poppins().fontFamily,
//       textTheme: TextTheme(
//         bodySmall: AppFont.normal.s12,
//         bodyMedium: AppFont.normal.s14,
//         bodyLarge: AppFont.normal.s16,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:stock_trading_app/core/themes/app_colors.dart';
import 'package:stock_trading_app/core/themes/app_fonts.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.kBlackColor,
          centerTitle: true,
          elevation: 2,
          titleTextStyle: AppFont.bold.s16,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColor.kPrimaryColor,
          foregroundColor: AppColor.kWhiteTextColor,
          elevation: 2,
          extendedTextStyle: AppFont.normal.s14,
        ),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: AppColor.kPrimaryColor,
        //     elevation: 2,
        //     textStyle: AppFont.normal.s14,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(6),
        //     ),
        //   ),
        // ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.poppins().fontFamily,
        // textTheme: TextTheme(
        //   bodySmall: AppFont.normal.s12,
        //   bodyMedium: AppFont.normal.s14,
        //   bodyLarge: AppFont.normal.s16,
        // ),
      );

  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: Colors.blue,
        ),
      );
}

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void updateTheme(ThemeMode theme) => emit(theme);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    return ThemeMode.values[json['theme'] as int];
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode mode) {
    return {'theme': mode.index};
  }
}
