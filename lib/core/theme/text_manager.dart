import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextManager {
  // AppBar Texts
  static TextStyle get appBarTitle => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );

  // Card Texts (Home Screen)
  static TextStyle get cardNameAndAge => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle get cardCity => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
  );

  // Profile Detail Screen Texts
  static TextStyle get profileDetailName => TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Gotham",
  );

  static TextStyle get profileDetailLocationLabel => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
    color: Colors.black,
    fontFamily: "Gotham",
  );

  static TextStyle get profileDetailLocationValue => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
    fontFamily: "Gotham",
  );

  // Error & Button Texts
  static TextStyle get errorMessage => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  );

  static TextStyle get buttonText =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500);
}
