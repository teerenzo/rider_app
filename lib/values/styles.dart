import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rider_app/values/colors.dart';

abstract class Styles {
  static const _poppins = 'Poppins';

  static const TextStyle small1LinkBlue = TextStyle(
    fontFamily: _poppins,
    fontSize: 14,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );

  static const TextStyle navLinkStyle = TextStyle(
    color: Color(0xFFAFAFAF),
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    height: 1.6,
  );
  static const TextStyle placeholderMediumBlack = TextStyle(
    color: Color(0xFFAFAFAF),
    fontSize: 16,
    fontFamily: _poppins,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  static const TextStyle textMediumWhite = TextStyle(
    fontFamily: _poppins,
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle paragraphSmallGrey = TextStyle(
    fontFamily: _poppins,
    fontSize: 18,
    color: Color(0xFF757575),
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static const TextStyle paragraphExtraSmallGrey = TextStyle(
    fontFamily: _poppins,
    fontSize: 16,
    color: Color(0xFF757575),
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static const TextStyle paragraphSmallGray = TextStyle(
    fontFamily: _poppins,
    fontSize: 14,
    color: Color(0xFF757575),
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle paragraphLargeGray = TextStyle(
    fontFamily: _poppins,
    fontSize: 18,
    color: Color(0xFF757575),
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle paragraphSmallBlack = TextStyle(
    fontFamily: _poppins,
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle paragraphRegularBlack = TextStyle(
    fontFamily: _poppins,
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w300,
    height: 1.2,
  );
  static const TextStyle paragraphMediumBlack = TextStyle(
    fontFamily: _poppins,
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle paragraphMediumPrimary = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 16,
    fontFamily: _poppins,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static const TextStyle heading1Section = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static const TextStyle heading1SectionBlack = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static const TextStyle headingLargeTitleWhite = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w500,
  );

  static const TextStyle headingExtraLargeTitleWhite = TextStyle(
    color: Colors.white,
    fontSize: 40,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle headingExtraLargeTitleBlack = TextStyle(
    color: AppColors.secondary,
    fontSize: 24,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  static const TextStyle headingLargeTitleBlack = TextStyle(
    fontFamily: _poppins,
    fontSize: 20,
    color: AppColors.black,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static const TextStyle headingLargeTitleBlackBold = TextStyle(
    fontFamily: _poppins,
    fontSize: 20,
    color: AppColors.secondary,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static const TextStyle headingMediumTitleBlack = TextStyle(
    fontFamily: _poppins,
    fontSize: 16,
    color: AppColors.secondary,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );
  static const TextStyle headingSmallTitleBlack = TextStyle(
    fontFamily: _poppins,
    fontSize: 14,
    color: AppColors.secondary,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static const TextStyle headingVSmallTitleBlack = TextStyle(
    fontFamily: _poppins,
    fontSize: 12,
    color: AppColors.secondary,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );
}
