import 'dart:typed_data';
import '/comman/failure_reponse_model.dart';
import '/comman/global_var.dart';
import '/core/app_constants.dart';
import '/core/utils/common_functions.dart';
import '/registration/mobile_registration_model.dart';
import '/registration/model_to_otp_mr.dart';
import '/login/user_details_model.dart';
import '/extras/cryptString.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'package:brotli/brotli.dart';
import 'package:convert/convert.dart';
import 'package:get_storage/get_storage.dart';
import '/extras/storage.dart';

class LoginPageServiceProvider extends ChangeNotifier {
  mobile_registration_model? mobileRegistrationDataModel;
  model_to_otp_mr? getModelToOtpMr;
  Failure? failure;

  final box = GetStorage();
  // final sharedPreferences =  SharedPreferences.getInstance();
  /// TODO: return boolean in order to handle the password change fn from backend if admin changes the password
  /// output of password change from admin panel
  /// brotli decoded login validation {
  ///  "PARTYDETAILS": []
  /// }
  Future userLoginService(context, String userName, String passWord, String otp,
      String _securityModel) async {
    // final prefs = await SharedPreferences.getInstance();
    ////////////////////////////////////////////
    try {
      var url = GlobalValues.baseURL + '/VU';
      storage.set_user_name(userName);
      storage.setPassword(passWord);
      String encryptedUsername = total_encryption_gcm(userName);
      String encryptedPassword = total_encryption_gcm(passWord);
      print("login info: userName: $userName & password: $passWord");
      print("otp $otp");
      String _securityHash = getRandomString(20);
      print("_securityHash_securityHash $_securityHash");
      final postXmlpForMrBuilder = XmlBuilder();
      postXmlpForMrBuilder.element('UserData', nest: () {
        postXmlpForMrBuilder.element('UserHash', nest: 'arms');
        postXmlpForMrBuilder.element('UserName', nest: encryptedUsername);
        postXmlpForMrBuilder.element('Password', nest: encryptedPassword);
        postXmlpForMrBuilder.element('OTP', nest: otp);
        postXmlpForMrBuilder.element('SecurityModel', nest: _securityModel);
        postXmlpForMrBuilder.element('SecurityHash',
            nest: total_encryption_gcm(_securityHash));
      });
      final postXmlBuilding = postXmlpForMrBuilder.buildDocument();
      String xmlString = postXmlBuilding.toString();
      print(GlobalValues.securityModel);
      print(" xml is this $xmlString");
      var response = await http.post(Uri.parse(url),
          headers: {
            "MobileHash": "134Hashs",
            'Content-type': 'text/xml',
          },
          body: xmlString);
      print(" login validation encoded ${response.body}");
      final output = brotli.decodeToString(
          hex.decode(response.body.substring(1, response.body.length - 1)));
      print(" brotli decoded login validation $output");
      Map<String, dynamic> mJson = json.decode(output);
      notifyListeners();

      if (mJson.containsKey('ERROR')) {
        // print("error in json response in ga otp error");
        return Failure.fromJson(mJson);
      } else {
        if (mJson.containsKey('PARTYDETAILS')) {
          List partyDetails = mJson['PARTYDETAILS'] as List;
          if (partyDetails.isNotEmpty) {
            if (mJson['PARTYDETAILS'][0].containsKey('PartyID')) {
              storage.set_party_id_number(
                  (mJson['PARTYDETAILS'][0]['PartyID']).toString());
            }
            if (mJson['PARTYDETAILS'][0].containsKey('RoleID')) {
              storage
                  .setRoleId((mJson['PARTYDETAILS'][0]['RoleID']).toString());
            }
            if (_securityHash !=
                mJson['PARTYDETAILS'][0]['SecurityHash'].toString()) {
              List<Error> errorData = [
                Error(errorDescription: AppConstants.serverError)
              ];
              failure = Failure(error: errorData);
              notifyListeners();
              return failure;
            }
          } else {
            List<Error> errorData = [
              Error(errorDescription: AppConstants.passwordChangedByAdmin)
            ];
            failure = Failure(error: errorData);
            notifyListeners();
            return failure;
          }
        }

        return UserDetailsModel.fromJson(mJson);
      }
    } on Exception catch (e, s) {
      debugPrint("her in error $e ==>$s");
      List<Error> errorData = [
        Error(errorDescription: AppConstants.serverError)
      ];
      failure = Failure(error: errorData);
      notifyListeners();
      return failure;
    }
  }

  Uint8List convertStringToUint8List(String str) {
    final List<int> codeUnits = str.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);
    return unit8List;
  }

  String total_encryption(String normalString) {
    String encriptionResultString = cryptString(normalString);
// String encription_result_base64_encoded =base64.encode(createUint8ListFromString(encription_result_string));

    List<int> bytes = utf8.encode(encriptionResultString);
    String output = hex.encode(bytes);
//print("totel encryption has been performed eg. for user_name,_password, OTP and returned ${output}");
    return output;
  }

  String totalEncryptionGcm(String normalString) {
    String encriptionResultString = cryptString_GCM(normalString);
    List<int> bytes = utf8.encode(encriptionResultString);
    String output = hex.encode(bytes);
// String encription_result_base64_encoded =base64.encode(bytes);
    print("GCM encrypted value is ${output}");
    return output;
  }
}
