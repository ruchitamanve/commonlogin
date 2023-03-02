import 'dart:math';

import '/extras/cryptString.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

dateFormatddMMYYYY(String dateString) {
  DateTime date = DateTime.parse(dateString);
  String formattedDate = DateFormat('dd-MM-yyyy').format(date);
  // debugPrint('Formatted Date: $formattedDate');
  return formattedDate;
}

String dateFormatApi(DateTime? dateTime) {
  if (dateTime != null) {
    String formattedDate = DateFormat('dd-MMM-yyyy').format(dateTime);
    debugPrint('Formatted Date: $formattedDate');
    return formattedDate;
  }
  return '';
}

String dateFormatDDMMYYYHHMMSS(DateTime? dateTime) {
  if (dateTime != null) {
    String formattedDate = DateFormat('yyyy-MM-dd H:m:s').format(dateTime);
    debugPrint('Formatted Date: $formattedDate');
    return formattedDate;
  }
  return '';
}

String dateFormatYYYYMMMddHHMMSS(DateTime? dateTime) {
  if (dateTime != null) {
    String formattedDate = DateFormat('yyyy-MMM-dd HH:mm:ss').format(dateTime);
    debugPrint('Formatted Date: $formattedDate');
    return formattedDate;
  }
  return '';
}

timeFormateCalendar(String? dateTime) {
  if (dateTime != null) {
    DateTime date = DateTime.parse(dateTime);

    String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(date);
    debugPrint('Formatted Date: $formattedDate');
    return DateTime.parse(formattedDate);
  }
  return '';
}

String dateFormartEDDMMYYY(DateTime? dateTime) {
  if (dateTime != null) {
    String formattedDate = DateFormat('E, dd MMM yyyy').format(dateTime);
    debugPrint('Formatted Date: $formattedDate');
    return formattedDate;
  }
  return '';
}

String dateFormartEDDMMYYYYHM(DateTime? dateTime) {
  if (dateTime != null) {
    String formattedDate = DateFormat('E, dd MMM yyyy H:m').format(dateTime);
    debugPrint('Formatted Date: $formattedDate');
    return formattedDate;
  }
  return '';
}

getServiceParametersString(String iData) {
  var encryptedServiceParam = total_encryption_gcm(iData);
  debugPrint('Encrypted Service Parameter: $encryptedServiceParam');
}

getCalendarDateFormate(String? dateString, String dutyhr) {
  String time = dutyhr.replaceAll(RegExp('#'), '');

  if (dateString != null && dutyhr != null) {
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat('yyyy-MM-dd ').format(date);
    return DateTime.tryParse(formattedDate + time);
  }
  return '';
}

String getRandomString(int length) {
  String _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
  Random _rnd = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
