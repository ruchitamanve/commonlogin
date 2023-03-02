class mobile_registration_model {
  List<APPLICATIONPREFERENCES>? aPPLICATIONPREFERENCES;
  List<REGISTRATIONDETAILS>? rEGISTRATIONDETAILS;

  mobile_registration_model(
      {this.aPPLICATIONPREFERENCES, this.rEGISTRATIONDETAILS});

  mobile_registration_model.fromJson(Map<String, dynamic> json) {
    if (json['APPLICATIONPREFERENCES'] != null) {
      aPPLICATIONPREFERENCES = <APPLICATIONPREFERENCES>[];
      json['APPLICATIONPREFERENCES'].forEach((v) {
        aPPLICATIONPREFERENCES!.add(new APPLICATIONPREFERENCES.fromJson(v));
      });
    }
    if (json['REGISTRATIONDETAILS'] != null) {
      rEGISTRATIONDETAILS = <REGISTRATIONDETAILS>[];
      json['REGISTRATIONDETAILS'].forEach((v) {
        rEGISTRATIONDETAILS!.add(new REGISTRATIONDETAILS.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aPPLICATIONPREFERENCES != null) {
      data['APPLICATIONPREFERENCES'] =
          this.aPPLICATIONPREFERENCES!.map((v) => v.toJson()).toList();
    }
    if (this.rEGISTRATIONDETAILS != null) {
      data['REGISTRATIONDETAILS'] =
          this.rEGISTRATIONDETAILS!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class APPLICATIONPREFERENCES {
  String? fieldValue;

  APPLICATIONPREFERENCES({this.fieldValue});

  APPLICATIONPREFERENCES.fromJson(Map<String, dynamic> json) {
    fieldValue = json['FieldValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FieldValue'] = this.fieldValue;
    return data;
  }
}

class REGISTRATIONDETAILS {
  String? deviceToken;
  String? clientID;
  String? emailID;
  String? partyID;
  String? partyTypeID;
  String? userName;
  String? password;
  String? registerType;
  String? oTP;
  int? oTPExpiryMinutes;
  String? errorNo;
  String? errorMessage;

  REGISTRATIONDETAILS(
      {this.deviceToken,
      this.clientID,
      this.emailID,
      this.partyID,
      this.partyTypeID,
      this.userName,
      this.password,
      this.registerType,
      this.oTP,
      this.oTPExpiryMinutes,
      this.errorNo,
      this.errorMessage});

  REGISTRATIONDETAILS.fromJson(Map<String, dynamic> json) {
    deviceToken = json['DeviceToken'];
    clientID = json['ClientID'];
    emailID = json['EmailID'];
    partyID = json['PartyID'];
    partyTypeID = json['PartyTypeID'];
    userName = json['UserName'];
    password = json['Password'];
    registerType = json['RegisterType'];
    oTP = json['OTP'];
    oTPExpiryMinutes = json['OTPExpiryMinutes'];
    errorNo = json['ErrorNo'];
    errorMessage = json['ErrorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DeviceToken'] = this.deviceToken;
    data['ClientID'] = this.clientID;
    data['EmailID'] = this.emailID;
    data['PartyID'] = this.partyID;
    data['PartyTypeID'] = this.partyTypeID;
    data['UserName'] = this.userName;
    data['Password'] = this.password;
    data['RegisterType'] = this.registerType;
    data['OTP'] = this.oTP;
    data['OTPExpiryMinutes'] = this.oTPExpiryMinutes;
    data['ErrorNo'] = this.errorNo;
    data['ErrorMessage'] = this.errorMessage;
    return data;
  }
}