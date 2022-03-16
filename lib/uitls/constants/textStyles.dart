import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

abstract class AppTextStyle {
  ///Font Size
  static const double small_font_size = 11.0;
  static const double xSmall_font_size = 12.0;

  static const double regular_font_size = 13.0;
  static const double xRegular_font_size = 14.0;

  static const double medium_font_size = 16.0;
  static const double xMedium_font_size = 18.0;

  static const double large_font_size = 20.0;
  static const double xLarge_font_size = 32.0;

  ///Roboto

  ///small

  static final TextStyle robotoSmallWhite = GoogleFonts.roboto(
    fontSize: small_font_size,
    color: AppColors.white,
  );

  ///x small
  static final TextStyle robotoXSmallBlack = GoogleFonts.roboto(
    fontSize: xSmall_font_size,
    color: AppColors.black,
  );

  static final TextStyle robotoXSmallWhite = GoogleFonts.roboto(
    fontSize: xSmall_font_size,
    color: AppColors.white,
  );

  ///Regular
  static final TextStyle robotoRegularBlack = GoogleFonts.roboto(
    fontSize: regular_font_size,
    color: AppColors.black,
  );
  static final TextStyle robotoRegularWhite = GoogleFonts.roboto(
    fontSize: regular_font_size,
    color: AppColors.white,
  );


  static final TextStyle robotoXRegularWhite = GoogleFonts.roboto(
    fontSize: xRegular_font_size,
    color: AppColors.white,
  );

  ///medium

  static final TextStyle robotoLargeBlack = GoogleFonts.roboto(
    fontSize: large_font_size,
    color: AppColors.black,
  );
  static final TextStyle robotoLargeWhite = GoogleFonts.roboto(
    fontSize: large_font_size,
    color: AppColors.white,
  );
  static final TextStyle robotoXMediumBlack = GoogleFonts.roboto(
    fontSize: xMedium_font_size,
    color: AppColors.black,
  );
  static final TextStyle robotoMediumBlack = GoogleFonts.roboto(
    fontSize: medium_font_size,
    color: AppColors.black,
  );



  ///Regular
  static final TextStyle openSansRegular = GoogleFonts.openSans(
    fontSize: regular_font_size,
  );

  static final TextStyle openSansRegularSecondary = GoogleFonts.openSans(
    color: AppColors.secondaryColor,
    fontSize: regular_font_size,
  );


  ///large
  ///

  static final TextStyle openSansLargePrimary = GoogleFonts.openSans(
    color: AppColors.primaryColor,
    fontSize: large_font_size,
  );

  static final TextStyle openSansLargeWhiteBold = GoogleFonts.openSans(
    fontSize: large_font_size,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
}
