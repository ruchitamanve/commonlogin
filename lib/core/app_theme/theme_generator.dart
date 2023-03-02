import '/client_id/common_url_data_model.dart';
import '/core/app_theme/theme_default_config.dart';
import '/core/app_theme/theme_value.dart';
import 'package:flutter/material.dart';

/// [ThemeGenerator] is a Singleton class to access through out the app
///
class ThemeGenerator {
  /// Private constructor
  ThemeGenerator._();
  static late ThemeGenerator _instance;
  ThemeValue _entity = ThemeValue.fromJson(lightThemeConfig);

  /// Factory method to get the same instance every time accessing in the app
  factory ThemeGenerator() {
    return _instance;
  }

  static void init(BuildContext context, GetClientBaseURLResult? commonData) {
    try {
      /// Initializing the data
      _instance = ThemeGenerator._()
        .._entity = ThemeValue.fromJson(commonData!.toJson());
    } catch (e, stackTrace) {
      debugPrint('Theme initialization EX: $e \n $stackTrace');
    }
  }

  /// App Global Color Codes
  Color get buttonColor => getColor(_entity.buttoncolor!);
  Color get dottedLineColor => getColor(_entity.dottedLineColour!);
  Color get headerColor => getColor(_entity.headerColour!);
  Color get headerTextColor => getColor(_entity.headerTextcolour!);
  Color get iconColor => getColor(_entity.iconColour!);
  Color get subHeaderColor => getColor(_entity.subHeadercolour!);
  Color get subHeaderColorDark => getColor(_entity.subHeadercolourdark!);
  Color get subHeaderColorLight => getColor(_entity.subHeadercolourlight!);

  /// App Font family & font file path
  String get fontFamily => _entity.fontFamily!;
  String get fontFileName => _entity.fontFilesName!;
  String get fontPath => _entity.fontPath!;

/*  TextStyle bodyText10 = TextStyle(
    fontSize: 10,
    letterSpacing: 1,
    color: ThemeGenerator().subHeaderColor,
  );

  TextStyle bodyText12 = TextStyle(
    fontSize: 12,
    letterSpacing: 1,
    color: ThemeGenerator().subHeaderColor,
  );*/

  Color getColor(String value) {
    var colorsList = value.split(',');
    var redValue = int.parse(colorsList[0]);
    var greenValue = int.parse(colorsList[1]);
    var blueValue = int.parse(colorsList[2]);
    return Color.fromRGBO(redValue, greenValue, blueValue, 1);
  }
}

String fontName = 'Calibri';

TextStyle smallText = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: fontName,
  fontWeight: FontWeight.w300,
  fontSize: 14,
  color: Colors.black,
);
TextStyle mediumText = const TextStyle(
  decoration: TextDecoration.none,
  fontFamily: 'Calibri',
  fontWeight: FontWeight.w500,
  fontSize: 18,
  color: Colors.red,
); //Color.fromARGB(255, 6, 204, 249)
TextStyle largeText = TextStyle(
  decoration: TextDecoration.none,
  fontFamily: fontName,
  fontWeight: FontWeight.w700,
  fontSize: 16,
  color: Colors.black,
);
