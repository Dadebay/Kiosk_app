import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color_constants.dart';

class Assets {
  static const String noConnection = 'assets/lottie/no_connection.gif';
  static const String loading = 'assets/lottie/loading.json';
  static const String otp_loading = 'assets/lottie/otp_animation.json';
  static const String appName = 'Atelýam';
  static const String address = 'assets/icons/address.png';
  static const String phone = 'assets/icons/phone.png';
  static const String instagram = 'assets/icons/instagram.png';
  static const String youtube = 'assets/icons/youtube.png';
  static const String tiktok = 'assets/icons/tiktok.png';
  static const String logoWhite = 'assets/image/logo_white.png';
  static const String logoBlack = 'assets/image/logo_black.png';
  static const String russianLangIcon = 'assets/image/flags/lang_ru.svg';
  static const String englishLangIcon = 'assets/image/flags/lang_en.svg';
  static const String chinaLangIcon = 'assets/image/flags/lang_ch.svg';
  static const String frenchLangIcon = 'assets/image/flags/lang_fr.svg';
  static const String turkLangIcon = 'assets/image/flags/lang_tr.svg';
  static const String turkmenLangIcon = 'assets/image/flags/lang_tm.svg';
  static const String backgorundPattern1 = 'assets/image/patterns/pattern_1.png';
  static const String backgroundPattern2 = 'assets/image/patterns/pattern_2.png';
  static const String backgorundPattern3 = 'assets/image/patterns/pattern_3.png';
}

class BorderRadii {
  static const BorderRadius borderRadius5 = BorderRadius.all(Radius.circular(5));
  static const BorderRadius borderRadius10 = BorderRadius.all(Radius.circular(10));
  static const BorderRadius borderRadius15 = BorderRadius.all(Radius.circular(15));
  static const BorderRadius borderRadius18 = BorderRadius.all(Radius.circular(18));
  static const BorderRadius borderRadius20 = BorderRadius.all(Radius.circular(20));
  static const BorderRadius borderRadius25 = BorderRadius.all(Radius.circular(25));
  static const BorderRadius borderRadius30 = BorderRadius.all(Radius.circular(30));
  static const BorderRadius borderRadius35 = BorderRadius.all(Radius.circular(35));
  static const BorderRadius borderRadius40 = BorderRadius.all(Radius.circular(40));
  static const BorderRadius borderRadius50 = BorderRadius.all(Radius.circular(50));
  static const BorderRadius borderRadius88 = BorderRadius.all(Radius.circular(88));
  static const BorderRadius borderRadius99 = BorderRadius.all(Radius.circular(99));
}

class AppThemes {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      colorSchemeSeed: ColorConstants.darkMainColor,
      useMaterial3: true,
      fontFamily: 'PlusJakartaSans',
      scaffoldBackgroundColor: ColorConstants.whiteMainColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: ColorConstants.darkMainColor,
        titleTextStyle: TextStyle(
          color: ColorConstants.whiteMainColor,
          fontSize: 20,
        ),
        elevation: 0,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.transparent.withOpacity(0),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
