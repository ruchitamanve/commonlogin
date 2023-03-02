// To parse this JSON data, do
//
//     final FailureResponse = failureResponseFromJson(jsonString);

import 'dart:convert';

Failure failureResponseFromJson(String str) => Failure.fromJson(json.decode(str));

String failureResponseToJson(Failure data) => json.encode(data.toJson());

class Failure {
  Failure({
    this.error,
  });

  final List<Error>? error;

  factory Failure.fromJson(Map<String, dynamic> json) => Failure(
    error: List<Error>.from(json["ERROR"].map((x) => Error.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ERROR": List<dynamic>.from(error!.map((x) => x.toJson())),
  };
}

class Error {
  Error({
    this.errorCode,
    this.errorDescription,
    this.method,
    this.lineNumber,
    this.fileName,
    this.todaysDate,
  });

  final int? errorCode;
  final String? errorDescription;
  final String? method;
  final String? lineNumber;
  final String? fileName;
  final String? todaysDate;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    errorCode: json["ErrorCode"],
    errorDescription: json["ErrorDescription"],
    method: json["Method"],
    lineNumber: json["LineNumber"],
    fileName: json["FileName"],
    todaysDate: json["TodaysDate"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "ErrorCode": errorCode,
    "ErrorDescription": errorDescription,
    "Method": method,
    "LineNumber": lineNumber,
    "FileName": fileName,
    "TodaysDate": todaysDate.toString(),
  };
}
