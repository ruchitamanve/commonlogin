import 'dart:io';
import 'dart:typed_data';
import '/pushnotifications/models/notificationmodel.dart';
import 'package:flutter/cupertino.dart';

import 'dart:convert';

import '/data_models/failure_model.dart';
import '/extras/cryptString.dart';
import '/extras/storage.dart';
import 'package:xml/xml.dart';
import 'package:convert/convert.dart';
import 'package:http/http.dart' as http;
import 'package:brotli/brotli.dart';
import '../pushnotifications/models/allnotificationsmodel.dart';
import '../pushnotifications/models/deletemodel.dart';
import '../pushnotifications/models/recallmodel.dart';
import '/comman/sharedpreferences.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io' show Platform;

class NotificationProvider extends ChangeNotifier {
  NotificationGet? notificationget;
  AllNotifition? allNotifition;
  DeleteNote? deleteNote;
  RecallAlert? recallAlert;

  bool isLoading = true;
  final Map<String, Object> _response = {
    "status": false,
    "message": "Oops Something went wrong"
  };
  Future getNotifications(
      context, _notificationLogID, _notificationLogAttributes) async {
    try {
      var url = 'http://asms.arms.aero:9095/armsasmsint/IMDO/MRO';
      String _userToken = storage.get_idr_result_token().toString();
      String _serviceAction = "AMS_SA_NOTIFICATIONLOG_STATUS";

      final _xmlBuilder = XmlBuilder();
      print(
          "getNotifications Api Call $_notificationLogID -- $_notificationLogAttributes ");
      _xmlBuilder.element('iData', nest: () {
        _xmlBuilder.element('NotificationLogID', nest: _notificationLogID);
        _xmlBuilder.element('NotificationLogAttributes',
            nest: _notificationLogAttributes);
      });

      final _xmlBuildDocument = _xmlBuilder.buildDocument();
      String _xmlString = _xmlBuildDocument.toString();
      String _encryptedXmlParameters = _totalEncryptionGcm(_xmlString);

      final _BarChartXml = XmlBuilder();
      _BarChartXml.element('MobileTransaction', nest: () {
        _BarChartXml.element('UserToken', nest: _userToken);
        _BarChartXml.element('ServiceAction', nest: _serviceAction);
        _BarChartXml.element('ServiceParameters',
            nest: _encryptedXmlParameters);
      });
      final _BarChartXmlBuildDocument = _BarChartXml.buildDocument();
      String _xmlRequest = _BarChartXmlBuildDocument.toString();

      debugPrint(" xml request $_xmlRequest");
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-type': 'text/xml',
          },
          body: _xmlRequest);
      final output = brotli.decodeToString(
          hex.decode(response.body.substring(1, response.body.length - 1)));
      print(output);
      if (json.decode(output).containsKey('ERROR')) {
        isLoading = false;
        notifyListeners();
        debugPrint("error from api");
        return FailureResponse.fromJson(_response);
      } else {
        notificationget = NotificationGet.fromJson(json.decode(output));
        debugPrint("Notification response ${json.decode(output)}");
        isLoading = false;
        notifyListeners();
        return notificationget;
      }
    } on Exception catch (e) {
      debugPrint("her in error $e");
      isLoading = false;
    }
  }

  Future getAllNotifications() async {
    var _userID = storage.get_party_id_number().toString();
    // var _userID = await Sharedpreferences.getStringValue("userID");
    String encryptedUserId = total_encryption_gcm(_userID);
    // AllNotifition? notficationdata = storage.getNotifications();
    debugPrint("notification data ${storage.getNotifications()}");
    var _deviceTypeID;
    if (Platform.isAndroid) {
      _deviceTypeID = "4";
    } else if (Platform.isIOS) {
      _deviceTypeID = "5";
    }

    try {
      var url = 'http://asms.arms.aero:9095/armsasmsint/IMDO/MRO';
      String _userToken = storage.get_idr_result_token().toString();
      String _serviceAction = "AMS_SA_NOTIFICATIONLOG_GET";

      final _xmlBuilder = XmlBuilder();
      print("AllNotifications Api Call $_userID -- $_deviceTypeID ");
      _xmlBuilder.element('iData', nest: () {
        _xmlBuilder.element('UserID', nest: _userID);
        _xmlBuilder.element('DeviceTypeID', nest: "4");
      });

      final _xmlBuildDocument = _xmlBuilder.buildDocument();
      String _xmlString = _xmlBuildDocument.toString();
      String _encryptedXmlParameters = _totalEncryptionGcm(_xmlString);

      final _BarChartXml = XmlBuilder();
      _BarChartXml.element('MobileTransaction', nest: () {
        _BarChartXml.element('UserToken', nest: _userToken);
        _BarChartXml.element('ServiceAction', nest: _serviceAction);
        _BarChartXml.element('ServiceParameters',
            nest: _encryptedXmlParameters);
      });
      final _BarChartXmlBuildDocument = _BarChartXml.buildDocument();
      String _xmlRequest = _BarChartXmlBuildDocument.toString();

      debugPrint(" xml request $_xmlRequest");
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-type': 'text/xml',
          },
          body: _xmlRequest);
      final output = brotli.decodeToString(
          hex.decode(response.body.substring(1, response.body.length - 1)));

      if (json.decode(output).containsKey('ERROR')) {
        isLoading = false;
        notifyListeners();
        debugPrint("error from api");
        return FailureResponse.fromJson(_response);
      } else {
        allNotifition = AllNotifition.fromJson(json.decode(output));
        debugPrint("all notifications response here ${json.decode(output)}");
        if (allNotifition != null) {
          storage.setNotifications(allNotifition!);
        }
        isLoading = false;
        notifyListeners();
      }
    } on Exception catch (e) {
      debugPrint("her in error $e");
      isLoading = false;
    }
  }

  Future getDeleteNotifications(
      context, _notificationLogID, _notificationLogAttributes) async {
    try {
      var url = 'http://asms.arms.aero:9095/armsasmsint/IMDO/MRO';
      String _userToken = storage.get_idr_result_token().toString();
      String _serviceAction = "AMS_SA_NOTIFICATIONLOG_STATUS";

      final _xmlBuilder = XmlBuilder();
      print(
          "DeleteNotifications Api Call $_notificationLogID -- $_notificationLogAttributes ");
      _xmlBuilder.element('iData', nest: () {
        _xmlBuilder.element('NotificationLogID', nest: _notificationLogID);
        _xmlBuilder.element('NotificationLogAttributes',
            nest: _notificationLogAttributes);
      });

      final _xmlBuildDocument = _xmlBuilder.buildDocument();
      String _xmlString = _xmlBuildDocument.toString();
      String _encryptedXmlParameters = _totalEncryptionGcm(_xmlString);

      final _BarChartXml = XmlBuilder();
      _BarChartXml.element('MobileTransaction', nest: () {
        _BarChartXml.element('UserToken', nest: _userToken);
        _BarChartXml.element('ServiceAction', nest: _serviceAction);
        _BarChartXml.element('ServiceParameters',
            nest: _encryptedXmlParameters);
      });
      final _BarChartXmlBuildDocument = _BarChartXml.buildDocument();
      String _xmlRequest = _BarChartXmlBuildDocument.toString();

      debugPrint(" xml request $_xmlRequest");
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-type': 'text/xml',
          },
          body: _xmlRequest);
      final output = brotli.decodeToString(
          hex.decode(response.body.substring(1, response.body.length - 1)));
      print(output);
      print("delete response ${response.body}");

      if (json.decode(output).containsKey('ERROR')) {
        isLoading = false;

        // notifyListeners();
        debugPrint("error from api");
        return FailureResponse.fromJson(_response);
      } else {
        deleteNote = DeleteNote.fromJson(json.decode(output));
        debugPrint(" delete all notifications response ${json.decode(output)}");
        isLoading = false;
        if (deleteNote?.table?[0].status == 1) {
          return deleteNote;
        }
        // notifyListeners();
        return FailureResponse.fromJson(_response);
      }
    } on Exception catch (e) {
      debugPrint("her in error $e");
      isLoading = false;
    }
  }

  Future recallNotification(
      context, _recallnotificationDetailD, _replyaction) async {
    try {
      var url = 'http://asms.arms.aero:9095/armsasmsint/IMDO/MRO';
      String _userToken = storage.get_idr_result_token().toString();
      String _serviceAction = "AMS_SA_MOBILE_DUTYRECALLSTATUS_SAVE";

      final _xmlBuilder = XmlBuilder();
      print(
          "RecallNotification Api Call $_recallnotificationDetailD -- $_replyaction ");
      _xmlBuilder.element('iData', nest: () {
        _xmlBuilder.element('RecallNotificationDetailD',
            nest: _recallnotificationDetailD);
        _xmlBuilder.element('ReplyAction', nest: _replyaction);
      });

      final _xmlBuildDocument = _xmlBuilder.buildDocument();
      String _xmlString = _xmlBuildDocument.toString();
      String _encryptedXmlParameters = _totalEncryptionGcm(_xmlString);

      final _BarChartXml = XmlBuilder();
      _BarChartXml.element('MobileTransaction', nest: () {
        _BarChartXml.element('UserToken', nest: _userToken);
        _BarChartXml.element('ServiceAction', nest: _serviceAction);
        _BarChartXml.element('ServiceParameters',
            nest: _encryptedXmlParameters);
      });
      final _BarChartXmlBuildDocument = _BarChartXml.buildDocument();
      String _xmlRequest = _BarChartXmlBuildDocument.toString();

      debugPrint(" xml request $_xmlRequest");
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-type': 'text/xml',
          },
          body: _xmlRequest);
      final output = brotli.decodeToString(
          hex.decode(response.body.substring(1, response.body.length - 1)));
      print(output);
      if (json.decode(output).containsKey('ERROR')) {
        isLoading = false;
        // notifyListeners();
        debugPrint("error from api");
        return FailureResponse.fromJson(_response);
      } else {
        recallAlert = RecallAlert.fromJson(json.decode(output));
        debugPrint(" recall notifications response ${json.decode(output)}");
        isLoading = false;
        // notifyListeners();
        return recallAlert;
      }
    } on Exception catch (e) {
      debugPrint("her in error $e");
      isLoading = false;
    }
  }
}

String _totalEncryption(String normalString) {
  String _encryptionResult = cryptString(normalString);
  List<int> bytes = utf8.encode(_encryptionResult);
  String _output = hex.encode(bytes);
  print("it is ${_output}");
  return _output;
}

String _totalEncryptionGcm(String normal_string) {
  String encription_result_string = cryptString_GCM(normal_string);
  List<int> bytes = utf8.encode(encription_result_string);
  String output = hex.encode(bytes);
// String encription_result_base64_encoded =base64.encode(bytes);
  print("GCM encrypted value is ${output}");
  return output;
}
