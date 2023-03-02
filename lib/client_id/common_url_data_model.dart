class CommonUrlDataModel {
  GetClientBaseURLResult? getClientBaseURLResult;

  CommonUrlDataModel({this.getClientBaseURLResult});

  CommonUrlDataModel.fromJson(Map<String, dynamic> json) {
    getClientBaseURLResult = json['GetClientBaseURLResult'] != null
        ? GetClientBaseURLResult.fromJson(json['GetClientBaseURLResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getClientBaseURLResult != null) {
      data['GetClientBaseURLResult'] = getClientBaseURLResult!.toJson();
    }
    return data;
  }
}

class GetClientBaseURLResult {
  String? aOMFeedbackEmailId;
  String? aOMFeedbackFromEmailId;
  String? baseURL1;
  String? baseURL2;
  String? buttoncolor;
  String? clientID;
  String? clientLogo;
  String? clientName;
  String? dottedLineColour;
  String? errorNumber;
  String? fontFamily;
  String? fontFilesName;
  String? fontPath;
  String? headerColour;
  String? headerTextcolour;
  String? iconColour;
  bool? isDownloadAndroid;
  bool? isDownloadIOS;
  bool? isDownloadWindows;
  String? securityModel;
  String? subHeadercolour;
  String? subHeadercolourdark;
  String? subHeadercolourlight;
  String? subscriberSessionGUID;
  String? termsOfUseContent;
  String? termsOfUseFileName;

  GetClientBaseURLResult(
      {this.aOMFeedbackEmailId,
      this.aOMFeedbackFromEmailId,
      this.baseURL1,
      this.baseURL2,
      this.buttoncolor,
      this.clientID,
      this.clientLogo,
      this.clientName,
      this.dottedLineColour,
      this.errorNumber,
      this.fontFamily,
      this.fontFilesName,
      this.fontPath,
      this.headerColour,
      this.headerTextcolour,
      this.iconColour,
      this.isDownloadAndroid,
      this.isDownloadIOS,
      this.isDownloadWindows,
      this.securityModel,
      this.subHeadercolour,
      this.subHeadercolourdark,
      this.subHeadercolourlight,
      this.subscriberSessionGUID,
      this.termsOfUseContent,
      this.termsOfUseFileName});

  GetClientBaseURLResult.fromJson(Map<String, dynamic> json) {
    aOMFeedbackEmailId = json['AOMFeedbackEmailId'];
    aOMFeedbackFromEmailId = json['AOMFeedbackFromEmailId'];
    baseURL1 = json['BaseURL1'];
    baseURL2 = json['BaseURL2'];
    buttoncolor = json['Buttoncolor'];
    clientID = json['ClientID'];
    clientLogo = json['ClientLogo'];
    clientName = json['ClientName'];
    dottedLineColour = json['DottedLineColour'];
    errorNumber = json['ErrorNumber'];
    fontFamily = json['FontFamily'];
    fontFilesName = json['FontFilesName'];
    fontPath = json['FontPath'];
    headerColour = json['HeaderColour'];
    headerTextcolour = json['HeaderTextcolour'];
    iconColour = json['IconColour'];
    isDownloadAndroid = json['IsDownloadAndroid'];
    isDownloadIOS = json['IsDownloadIOS'];
    isDownloadWindows = json['IsDownloadWindows'];
    securityModel = json['SecurityModel'];
    subHeadercolour = json['SubHeadercolour'];
    subHeadercolourdark = json['SubHeadercolourdark'];
    subHeadercolourlight = json['SubHeadercolourlight'];
    subscriberSessionGUID = json['SubscriberSessionGUID'];
    termsOfUseContent = json['TermsOfUseContent'];
    termsOfUseFileName = json['TermsOfUseFileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AOMFeedbackEmailId'] = aOMFeedbackEmailId;
    data['AOMFeedbackFromEmailId'] = aOMFeedbackFromEmailId;
    data['BaseURL1'] = baseURL1;
    data['BaseURL2'] = baseURL2;
    data['Buttoncolor'] = buttoncolor;
    data['ClientID'] = clientID;
    data['ClientLogo'] = clientLogo;
    data['ClientName'] = clientName;
    data['DottedLineColour'] = dottedLineColour;
    data['ErrorNumber'] = errorNumber;
    data['FontFamily'] = fontFamily;
    data['FontFilesName'] = fontFilesName;
    data['FontPath'] = fontPath;
    data['HeaderColour'] = headerColour;
    data['HeaderTextcolour'] = headerTextcolour;
    data['IconColour'] = iconColour;
    data['IsDownloadAndroid'] = isDownloadAndroid;
    data['IsDownloadIOS'] = isDownloadIOS;
    data['IsDownloadWindows'] = isDownloadWindows;
    data['SecurityModel'] = securityModel;
    data['SubHeadercolour'] = subHeadercolour;
    data['SubHeadercolourdark'] = subHeadercolourdark;
    data['SubHeadercolourlight'] = subHeadercolourlight;
    data['SubscriberSessionGUID'] = subscriberSessionGUID;
    data['TermsOfUseContent'] = termsOfUseContent;
    data['TermsOfUseFileName'] = termsOfUseFileName;
    return data;
  }
}
