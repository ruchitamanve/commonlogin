// To parse this JSON data, do
//
//     final themeValue = themeValueFromJson(jsonString);

import 'dart:convert';

ThemeValue themeValueFromJson(String str) => ThemeValue.fromJson(json.decode(str));

String themeValueToJson(ThemeValue data) => json.encode(data.toJson());

class ThemeValue {
  ThemeValue({
    this.buttoncolor,
    this.dottedLineColour,
    this.fontFamily,
    this.fontFilesName,
    this.fontPath,
    this.headerColour,
    this.headerTextcolour,
    this.iconColour,
    this.subHeadercolour,
    this.subHeadercolourdark,
    this.subHeadercolourlight,
  });

  final String? buttoncolor;
  final String? dottedLineColour;
  final String? fontFamily;
  final String? fontFilesName;
  final String? fontPath;
  final String? headerColour;
  final String? headerTextcolour;
  final String? iconColour;
  final String? subHeadercolour;
  final String? subHeadercolourdark;
  final String? subHeadercolourlight;

  factory ThemeValue.fromJson(Map<String, dynamic> json) {
    // debugPrint('Theme Json Data ff: ${json["FontFamily"]}');
    return ThemeValue(
        buttoncolor: json["Buttoncolor"],
        dottedLineColour: json["DottedLineColour"],
        fontFamily: json["FontFamily"],
        fontFilesName: json["FontFilesName"],
        fontPath: json["FontPath"],
        headerColour: json["HeaderColour"],
        headerTextcolour: json["HeaderTextcolour"],
        iconColour: json["IconColour"],
        subHeadercolour: json["SubHeadercolour"],
        subHeadercolourdark: json["SubHeadercolourdark"],
        subHeadercolourlight: json["SubHeadercolourlight"]
    );
  }


  Map<String, dynamic> toJson() => {
    "Buttoncolor": buttoncolor,
    "DottedLineColour": dottedLineColour,
    "FontFamily": fontFamily,
    "FontFilesName": fontFilesName,
    "FontPath": fontPath,
    "HeaderColour": headerColour,
    "HeaderTextcolour": headerTextcolour,
    "IconColour": iconColour,
    "SubHeadercolour": subHeadercolour,
    "SubHeadercolourdark": subHeadercolourdark,
    "SubHeadercolourlight": subHeadercolourlight,
  };
}
