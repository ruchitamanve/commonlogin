import 'dart:typed_data';
import '/comman/failure_reponse_model.dart';
import '/comman/global_var.dart';
import '/comman/sharedpreferences.dart';
import '/core/app_constants.dart';
import '/core/utils/common_functions.dart';
import '/data_models/idr_data_model.dart';
import '/local_db/moor_db.dart';
import '/registration/mobile_registration_model.dart';
import '/registration/model_to_otp_mr.dart';
import '/extras/cryptString.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:xml/xml.dart';
import 'dart:io';
import 'package:brotli/brotli.dart';
import 'package:convert/convert.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get_storage/get_storage.dart';
import '/extras/storage.dart';
import 'dart:io' show Platform;
import 'package:drift/drift.dart' as drift;

class MobileRegistrationProvider extends ChangeNotifier {
  mobile_registration_model? mobileRegistrationDataModel;
  model_to_otp_mr? getModelToOtpMr;
  idr_data_model? idrResponseModel;
  final box = GetStorage();
  late CaasLocalDatabase _cassLocalDatabase;

  Future mrServiceWithoutOTP(context, String userId, _password) async {
    try {
      var url = GlobalValues.baseURL + '/MR';

      String devicehash = storage.get_device_token();
      storage.set_user_name(userId);
      storage.setPassword(_password);

      String pnsKey = storage.getStorageKey("pnsKey");
      String clientId = GlobalValues.clientId;
      String userName = userId; //"C3112001"
      // String password = "SDSarms@12345";
      String deviceTypeId = "";
      String securityModel = GlobalValues.securityModel;
      String version = "";
      String encryptedUsername = total_encryption_gcm(userName);
      String encryptedPassword = total_encryption_gcm(_password);

      String _randomString = getRandomString(12);
      String _securityModel = total_encryption_gcm(
          _randomString + "|" + securityModel); //securityModel

      if (Platform.isAndroid) {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        print('Running on ${androidInfo.fingerprint.toString()}');
        version = "Android" + androidInfo.version.release.toString();
        deviceTypeId = "4";
      } else if (Platform.isIOS) {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

        version = "IOS" + iosInfo.systemVersion.toString();
        deviceTypeId = "5";
      } else {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
        print('Running on ${webBrowserInfo.userAgent}');
        version = webBrowserInfo.appVersion.toString();
      }
      print("versionversion $version");
      print("devicetypeid $deviceTypeId");

      final postXmlpForMrBuilder = XmlBuilder();
      postXmlpForMrBuilder.element('MobileData', nest: () {
        postXmlpForMrBuilder.element('MobileHash', nest: devicehash);
        postXmlpForMrBuilder.element('ClientID', nest: clientId);
        postXmlpForMrBuilder.element('PNSKey', nest: pnsKey);
        postXmlpForMrBuilder.element('OS', nest: version);
        postXmlpForMrBuilder.element('UserName', nest: encryptedUsername);
        postXmlpForMrBuilder.element('Password', nest: encryptedPassword);
        postXmlpForMrBuilder.element('DeviceTypeID', nest: deviceTypeId);
        postXmlpForMrBuilder.element('SecurityModel', nest: _securityModel);
      });
      final postXmlBuilding = postXmlpForMrBuilder.buildDocument();
      String xmlString = postXmlBuilding.toString();

      print(" xml is this $xmlString");
      var response = await http.post(Uri.parse(url),
          headers: {
            "MobileHash": "134Hashs",
            'Content-type': 'text/xml',
          },
          body: xmlString);
      print("pns response" + pnsKey);
      print(" hey12 ${response.body}");

      final output = brotli.decodeToString(
          hex.decode(response.body.substring(1, response.body.length - 1)));

      print(" brotli decoded $output");
      var mJson = json.decode(output);
      mobileRegistrationDataModel = mobile_registration_model.fromJson(mJson);
      notifyListeners();
      Sharedpreferences.setStringValue(
          "mrServiceWithoutOTPResp", jsonEncode(mobileRegistrationDataModel));
      if (mJson.containsKey('ERROR')) {
        return Failure.fromJson(mJson);
      } else {
        return mobile_registration_model.fromJson(mJson);
      }
    } on Exception catch (e, s) {
      debugPrint("her in error $e ==>$s");
      List<Error> errorData = [
        Error(errorDescription: AppConstants.serverError)
      ];

      notifyListeners();
      return Failure(error: errorData);
      // DialogBox().errorMsgDialog(
      //     context, "Oops Something went wrong Please try again!");
    }
  }

  Future mrServiceWithOTP(context, String typedOtp) async {
    try {
      var url = GlobalValues.baseURL + '/MR';
      String devicehash = storage.get_device_token();

      final String userId = storage.get_user_name();
      print("shared value is $devicehash");
      String pnsKey = storage.getStorageKey("pnsKey");
      print("pnskey response" + pnsKey);
      String clientId = GlobalValues.clientId;
      storage.setStorgeKeyValue("otp", typedOtp);
      print("typed_otp=== $typedOtp");
      String password = storage.getPassword();
      print(password);
      String deviceTypeId = "";
      String osVersion = "test_version";
      String version = "";
      String encryptedUsername = total_encryption_gcm(userId);
      String encryptedPassword = total_encryption_gcm(password);
      String encryptedOtp = total_encryption_gcm(typedOtp);
      // String _randomString = getRandomString(12);
      String _randomString = getRandomString(12);
      String _securityModel = total_encryption_gcm(
          _randomString + "|" + GlobalValues.securityModel);
      // String _securityModel = total_encryption_gcm(GlobalValues.securityModel);
      print("GlobalValues.securityModel ${GlobalValues.securityModel}");
      if (Platform.isAndroid) {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        print('Running on ${androidInfo.fingerprint.toString()}'); // e.g. "
        version = "Android" + androidInfo.version.release.toString();
        deviceTypeId = "4";
      } else if (Platform.isIOS) {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        print('Running on ${iosInfo.utsname.machine}');
        version = "IOS" + iosInfo.systemVersion.toString();
        deviceTypeId = "5";
      } else {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
        print('Running on ${webBrowserInfo.userAgent}');
        version = webBrowserInfo.appVersion.toString();
      }
      print(version);
      final postXmlpForMrBuilder = XmlBuilder();
      postXmlpForMrBuilder.element('MobileData', nest: () {
        postXmlpForMrBuilder.element('MobileHash', nest: devicehash);
        postXmlpForMrBuilder.element('ClientID', nest: clientId);
        postXmlpForMrBuilder.element('PNSKey', nest: pnsKey);
        postXmlpForMrBuilder.element('OS', nest: version);
        postXmlpForMrBuilder.element('UserName', nest: encryptedUsername);
        postXmlpForMrBuilder.element('Password', nest: encryptedPassword);
        postXmlpForMrBuilder.element('OTP', nest: encryptedOtp);
        postXmlpForMrBuilder.element('DeviceTypeID', nest: deviceTypeId);
        postXmlpForMrBuilder.element('SecurityModel', nest: _securityModel);
      });
      final postXmlBuilding = postXmlpForMrBuilder.buildDocument();
      String xmlString = postXmlBuilding.toString();

      print(" xml is this $xmlString");
      var response = await http.post(Uri.parse(url),
          headers: {
            'Content-type': 'text/xml',
          },
          body: xmlString);
      print(" hey12 ${response.body}");

      final output = brotli.decodeToString(
          hex.decode(response.body.substring(1, response.body.length - 1)));

      print(" hi $output");

      var mJson = json.decode(output);
      print("======>>>>>>>mJson  $mJson");
      print(model_to_otp_mr.fromJson(mJson));
      getModelToOtpMr = model_to_otp_mr.fromJson(mJson);
      notifyListeners();
      if (mJson.containsKey('ERROR')) {
        return Failure.fromJson(mJson);
      } else {
        return model_to_otp_mr.fromJson(mJson);
      }
    } on Exception catch (e, s) {
      debugPrint("her in error $e ==>$s");
      List<Error> errorData = [
        Error(errorDescription: AppConstants.serverError)
      ];

      return Failure(error: errorData);
    }
  }

  Future idrServiceToGetToken(context) async {
    try {
      var url = GlobalValues.baseURL + '/IDR';
      _cassLocalDatabase =
          Provider.of<CaasLocalDatabase>(context, listen: false);

      final postXmlpForMrBuilder = XmlBuilder();
      String devicehash = storage.get_device_token();

      postXmlpForMrBuilder.element('DeviceRegistration', nest: () {
        postXmlpForMrBuilder.element('DeviceHash', nest: devicehash);
      });
      final postXmlBuilding = postXmlpForMrBuilder.buildDocument();
      String xmlString = postXmlBuilding.toString();

      print(" xml is this $xmlString");
      var response = await http
          .post(Uri.parse(url),
              headers: {
                'Content-type': 'text/xml',
              },
              body: xmlString)
          .timeout((const Duration(seconds: 10)));
      print(" idr respnse ${response.body}");

      final output = brotli.decodeToString(
          hex.decode(response.body.substring(1, response.body.length - 1)));

      print(" brotli decoded $output");
      Map<String, dynamic> mJson = json.decode(output);
      idrResponseModel = idr_data_model.fromJson(mJson);
      await Sharedpreferences.setStringValue(
          "idrServiceResponse", jsonEncode(idrResponseModel));
      if (idrResponseModel?.dEVICEUSER != null) {
        Sharedpreferences.setStringValue(
            "userID", idrResponseModel?.dEVICEUSER![0].userName);
        GlobalValues.userID = idrResponseModel?.dEVICEUSER![0].userName ?? "";
        _batchRun(idrResponseModel?.dEVICEUSER![0]);
      }
      print(idrResponseModel);
      notifyListeners();
      return idrResponseModel;
    } on Exception catch (e, s) {
      debugPrint("her in error $e ==>$s");
      List<Error> errorData = [
        Error(errorDescription: AppConstants.serverError)
      ];

      return Failure(error: errorData);
    }
  }

  void _batchRun(DEVICEUSER? _deviceData) {
    GlobalValues.uuId = _deviceData?.uUID ?? "";
    _cassLocalDatabase.delete_all_tokens().then((value) {
      _cassLocalDatabase
          .insert_client_credentials_tokens(user_related_tokensCompanion(
        client_token: const drift.Value("test1"),
        device_hash: drift.Value(_deviceData?.deviceToken ?? ""),
        uuid: drift.Value(_deviceData?.uUID ?? ""),
        android_id: drift.Value(storage.get_device_token()),
        pns_key: const drift.Value("test5"),
        some_another_key: const drift.Value("test6"),
        some_another_value: const drift.Value("test7"),
      ));
    }).then((value) =>
        storage.set_idr_result_token(_deviceData?.deviceToken ?? ""));
    storage.set_party_id_number(_deviceData?.partyID?.toString() ?? '');
  }

  Uint8List convertStringToUint8List(String str) {
    final List<int> codeUnits = str.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);
    return unit8List;
  }

  Future<List<user_ui_detail>> getlocallyStoreData() {
    return _cassLocalDatabase.fetch_user_data();
  }
}
