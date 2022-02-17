import 'package:flutter/material.dart';
import 'package:flutter_challenge/shared/shared.dart';

class FWt {
  FWt();
  static FontWeight regular = FontWeight.w400;
  static FontWeight semiBold = FontWeight.w500;
  static FontWeight mediumBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w800;
}

class Styles {
  static Text regular(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FWt.regular,
        color: color ?? AppColors.neutrals,
      ),
    );
  }

  static Text semiBold(String text,
      {double? fontSize, Color? color, int? maxLines = 1}) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FWt.semiBold,
        color: color,
      ),
    );
  }

  static Text bold(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FWt.bold,
        color: color ?? AppColors.neutrals,
      ),
    );
  }
}
