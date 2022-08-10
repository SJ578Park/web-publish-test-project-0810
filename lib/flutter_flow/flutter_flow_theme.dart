// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color primaryBtnText;
  Color lineColor;
  Color customColor1;
  Color customColor2;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFF7342FF);
  Color secondaryColor = const Color(0xFF39D2C0);
  Color tertiaryColor = const Color(0xFFEE8B60);
  Color alternate = const Color(0xFFFF5963);
  Color primaryBackground = const Color(0xFFF1F4F8);
  Color secondaryBackground = const Color(0xFFFFFFFF);
  Color primaryText = const Color(0xFF101213);
  Color secondaryText = const Color(0xFF57636C);

  Color primaryBtnText = Color(0xFFFFFFFF);
  Color lineColor = Color(0xFFE0E3E7);
  Color customColor1 = Color(0xFFB2CCD7);
  Color customColor2 = Color(0xFF2BA63A);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'IM_Hyemin';
  TextStyle get title1 => TextStyle(
        fontFamily: 'IM_Hyemin',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );
  String get title2Family => 'Spoqa Han Sans Neo';
  TextStyle get title2 => TextStyle(
        fontFamily: 'Spoqa Han Sans Neo',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );
  String get title3Family => 'IM_Hyemin';
  TextStyle get title3 => TextStyle(
        fontFamily: 'IM_Hyemin',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
  String get subtitle1Family => 'Spoqa Han Sans Neo';
  TextStyle get subtitle1 => TextStyle(
        fontFamily: 'Spoqa Han Sans Neo',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );
  String get subtitle2Family => 'Spoqa Han Sans Neo';
  TextStyle get subtitle2 => TextStyle(
        fontFamily: 'Spoqa Han Sans Neo',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );
  String get bodyText1Family => 'Spoqa Han Sans Neo';
  TextStyle get bodyText1 => TextStyle(
        fontFamily: 'Spoqa Han Sans Neo',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  String get bodyText2Family => 'Spoqa Han Sans Neo';
  TextStyle get bodyText2 => TextStyle(
        fontFamily: 'Spoqa Han Sans Neo',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    double letterSpacing,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    TextDecoration decoration,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
