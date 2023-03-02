import 'dart:convert';
import '/client_id/common_url_data_model.dart';
import '/comman/failure_reponse_model.dart';
import '/comman/global_var.dart';
import '/comman/sharedpreferences.dart';
import '/comman/utils.dart';
import '/core/app_constants.dart';
import '/core/app_theme/theme_generator.dart';
import '/data_models/idr_data_model.dart';
import '/extras/cryptString.dart';
import '/local_db/moor_db.dart';
import '/logs/termsandcondition.dart';
import '/registration/mobile_registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:xml/xml.dart';
import 'package:brotli/brotli.dart';
import 'package:convert/convert.dart';
import 'package:drift/drift.dart' as drift;

class CommonUrlServiceProvider extends ChangeNotifier {
  GetClientBaseURLResult? commonUrlDataModel;
  Failure? commonUrlFailure;
  late CaasLocalDatabase _caasLocalDatabase;
  idr_data_model? _idrModel;

  Future<void> getData(context, String clientId) async {
    try {
      var url =
          "https://aombaseprimary.arms.aero/CAAS/RestCommonURLService.svc/GetDataGCM";
      // 'https://aombaseprimary.arms.aero/RestCommonURLService.svc/GetClientBaseURL/New';

      final _xmlBuilder = XmlBuilder();
      _xmlBuilder.element('UserData', nest: () {
        _xmlBuilder.element('ClientId', nest: total_encryption_gcm(clientId));
      });
      final postXmlBuilding = _xmlBuilder.buildDocument();
      String xmlString = postXmlBuilding.toString();

      // String body = json.encode({
      //   "ClientId": clientId,
      // });

      var response = await http.post(Uri.parse(url), body: xmlString);

      var _tojson = jsonDecode(response.body);

      final output =
          brotli.decodeToString(hex.decode(_tojson['GetDataGCMResult']));

      commonUrlDataModel = GetClientBaseURLResult.fromJson(jsonDecode(output));
      Sharedpreferences.setCommonUrlDataValue(
          "common_url_data", jsonEncode(commonUrlDataModel));

      ThemeGenerator.init(context, commonUrlDataModel);
      _caasLocalDatabaseStorage(context, clientId);

      /// Re-Initializing the [ThemeGenerator] again to update the color codes and font family from the api
      notifyListeners();
    } on Exception catch (e) {
      Navigator.of(context).pop();
      print(e);
      commonUrlFailure =
          Failure(error: [Error(errorDescription: AppConstants.serverError)]);
      DialogBox().clientErrorMsgDialog(context, AppConstants.serverError);
    }
  }

  Future<void> getDummyCommonData(context, String clientId) async {
    try {
      var url =
          "https://aombaseprimary.arms.aero/CAAS/RestCommonURLService.svc/GetDataGCM";
      // 'https://aombaseprimary.arms.aero/RestCommonURLService.svc/GetClientBaseURL/New';

      final _xmlBuilder = XmlBuilder();
      _xmlBuilder.element('UserData', nest: () {
        _xmlBuilder.element('ClientId', nest: total_encryption_gcm(clientId));
      });
      final postXmlBuilding = _xmlBuilder.buildDocument();
      String xmlString = postXmlBuilding.toString();

      // String body = json.encode({
      //   "ClientId": clientId,
      // });

      var response = await http.post(Uri.parse(url), body: xmlString);

      var _tojson = jsonDecode(response.body);

      final output =
          brotli.decodeToString(hex.decode(_tojson['GetDataGCMResult']));
      debugPrint('dummy common data updated');
      commonUrlDataModel = GetClientBaseURLResult.fromJson(jsonDecode(output));
      // _caasLocalDatabaseStorage(context, clientId);
      /// Re-Initializing the [ThemeGenerator] again to update the color codes and font family from the api
      // Navigator.of(context).pop();
      ThemeGenerator.init(context, commonUrlDataModel);
      notifyListeners();
    } on Exception catch (e) {
      Navigator.of(context).pop();
      commonUrlFailure = Failure(error: [
        Error(errorDescription: "Oops Something went wrong Please try again!")
      ]);
      print(e);
      DialogBox().errorMsgDialog(
          context, "Oops Something went wrong Please try again!");
    }
  }

  void _caasLocalDatabaseStorage(context, clientId) {
    _caasLocalDatabase = Provider.of<CaasLocalDatabase>(context, listen: false);
    if (commonUrlDataModel?.errorNumber == "1") {
      _caasLocalDatabase.delete_all_rows().then((value) async {
        Sharedpreferences.setStringValue(
            "clientId", commonUrlDataModel!.clientID!.toString());
        GlobalValues.clientId = commonUrlDataModel!.clientID!.toString();
        Sharedpreferences.setStringValue(
            "clientName", commonUrlDataModel!.clientName!.toString());
        GlobalValues.coOrgName = commonUrlDataModel!.clientName!.toString();
        Sharedpreferences.setStringValue(
            "BaseURL", commonUrlDataModel!.baseURL1!.toString());
        GlobalValues.baseURL = "http://192.168.16.139:8085/apghlocal/IMDO";
        //commonUrlDataModel!.baseURL1!.toString();

        Sharedpreferences.setStringValue(
            "securityModel", commonUrlDataModel!.securityModel!.toString());
        Sharedpreferences.setStringValue("aOMFeedbackFromEmailId",
            commonUrlDataModel?.aOMFeedbackFromEmailId?.toString());
        Sharedpreferences.setStringValue("aOMFeedbackEmailId",
            commonUrlDataModel?.aOMFeedbackEmailId?.toString());
        Sharedpreferences.setStringValue("termsOfUseContent",
            commonUrlDataModel?.termsOfUseContent?.toString());
        GlobalValues.securityModel =
            commonUrlDataModel!.securityModel!.toString();

        saveDataComingFromUi(
          commonUrlDataModel!.aOMFeedbackEmailId!.toString(),
          commonUrlDataModel!.aOMFeedbackFromEmailId!.toString(),
          commonUrlDataModel!.baseURL1!.toString(),
          commonUrlDataModel!.baseURL2!.toString(),
          commonUrlDataModel!.buttoncolor!.toString(),
          commonUrlDataModel!.clientID!.toString(),
          commonUrlDataModel!.clientLogo!.toString(),
          commonUrlDataModel!.clientName!.toString(),
          commonUrlDataModel!.dottedLineColour!.toString(),
          commonUrlDataModel!.errorNumber!.toString(),
          commonUrlDataModel!.fontFamily!.toString(),
          commonUrlDataModel!.fontFilesName!.toString(),
          commonUrlDataModel!.fontPath!.toString(),
          commonUrlDataModel!.headerColour!.toString(),
          commonUrlDataModel!.headerTextcolour!.toString(),
          commonUrlDataModel!.iconColour!.toString(),
          commonUrlDataModel!.isDownloadAndroid!.toString(),
          commonUrlDataModel!.isDownloadIOS!.toString(),
          commonUrlDataModel!.isDownloadWindows!.toString(),
          commonUrlDataModel!.securityModel!.toString(),
          commonUrlDataModel!.subHeadercolour!.toString(),
          commonUrlDataModel!.subHeadercolourdark!.toString(),
          commonUrlDataModel!.subHeadercolourlight!.toString(),
          commonUrlDataModel!.subscriberSessionGUID!.toString(),
          commonUrlDataModel!.termsOfUseContent!.toString(),
          commonUrlDataModel!.termsOfUseFileName!.toString(),
        );
      }).then((value) async {
        await MobileRegistrationProvider()
            .idrServiceToGetToken(context)
            .then((value) async {
          Navigator.of(context).pop();

          if (value is idr_data_model) {
            _idrModel = value;
            Sharedpreferences.setStringValue(
                "last_route_Name", "TermsandCondition");
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TermsandCondition(
                      idrResponse: _idrModel,
                    )));
          } else {
            DialogBox().clientErrorMsgDialog(context, AppConstants.serverError);
          }
        });
      });
    } else {
      Navigator.of(context).pop();

      DialogBox()
          .clientErrorMsgDialog(context, "Please enter a valid client ID");
    }
  }

  int saveDataComingFromUi(
      getAOMFeedbackEmailId,
      getAOMFeedbackFromEmailId,
      getBaseURL1,
      getBaseURL2,
      getButtoncolor,
      getClientID,
      getClientLogo,
      getClientName,
      getDottedLineColour,
      getErrorNumber,
      getFontFamily,
      getFontFilesName,
      getFontPath,
      getHeaderColour,
      getHeaderTextcolour,
      getIconColour,
      getIsDownloadAndroid,
      getIsDownloadIOS,
      getIsDownloadWindows,
      getSecurityModel,
      getSubHeadercolour,
      getSubHeadercolourdark,
      getSubHeadercolourlight,
      getSubscriberSessionGUID,
      getTermsOfUseContent,
      getTermsOfUseFileName) {
    _caasLocalDatabase.insert_user_data(user_ui_detailsCompanion(
      aOMFeedbackEmailId: drift.Value(getAOMFeedbackEmailId),
      aOMFeedbackFromEmailId: drift.Value(getAOMFeedbackFromEmailId),
      baseURL1: drift.Value(getBaseURL1),
      baseURL2: drift.Value(getBaseURL2),
      buttoncolor: drift.Value(getButtoncolor),
      clientID: drift.Value(getClientID),
      clientLogo: drift.Value(getClientLogo),
      clientName: drift.Value(getClientName),
      dottedLineColour: drift.Value(getDottedLineColour),
      errorNumber: drift.Value(getErrorNumber),
      fontFamily: drift.Value(getFontFamily),
      fontFilesName: drift.Value(getFontFilesName),
      fontPath: drift.Value(getFontPath),
      headerColour: drift.Value(getHeaderColour),
      headerTextcolour: drift.Value(getHeaderTextcolour),
      iconColour: drift.Value(getIconColour),
      isDownloadAndroid: drift.Value(getIsDownloadAndroid),
      isDownloadIOS: drift.Value(getIsDownloadIOS),
      isDownloadWindows: drift.Value(getIsDownloadWindows),
      securityModel: drift.Value(getSecurityModel),
      subHeadercolour: drift.Value(getSubHeadercolour),
      subHeadercolourdark: drift.Value(getSubHeadercolourdark),
      subHeadercolourlight: drift.Value(getSubHeadercolourlight),
      subscriberSessionGUID: drift.Value(getSubscriberSessionGUID),
      termsOfUseContent: drift.Value(getTermsOfUseContent),
      termsOfUseFileName: drift.Value(getTermsOfUseFileName),
    ));
    return 1;
  }
}
