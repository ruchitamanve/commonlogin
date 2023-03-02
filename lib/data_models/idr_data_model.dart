class idr_data_model {
  List<STATUS>? sTATUS;

  List<DEVICEUSER>? dEVICEUSER;

  idr_data_model({this.dEVICEUSER, this.sTATUS});

  idr_data_model.fromJson(Map<String, dynamic> json) {
    if (json['DEVICEUSER'] != null) {
      dEVICEUSER = <DEVICEUSER>[];
      json['DEVICEUSER'].forEach((v) {
        dEVICEUSER!.add(new DEVICEUSER.fromJson(v));
      });
    }
    if (json['STATUS'] != null) {
      sTATUS = <STATUS>[];
      json['STATUS'].forEach((v) {
        sTATUS!.add(new STATUS.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (dEVICEUSER != null) {
      data['DEVICEUSER'] = dEVICEUSER!.map((v) => v.toJson()).toList();
    }
    if (sTATUS != null) {
      data['STATUS'] = sTATUS!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DEVICEUSER {
  int? userStatus;
  int? employeeCategory;
  int? registerType;
  int? partyID;
  String? deviceToken;
  String? userName;
  String? errorMessage;
  String? uUID;
  String? deviceGUID;
  String? airFieldList;
  int? oTPExpiryMin;

  DEVICEUSER(
      {this.userStatus,
      this.employeeCategory,
      this.registerType,
      this.partyID,
      this.deviceToken,
      this.userName,
      this.errorMessage,
      this.uUID,
      this.deviceGUID,
      this.airFieldList,
      this.oTPExpiryMin});

  DEVICEUSER.fromJson(Map<String, dynamic> json) {
    userStatus = json['UserStatus'];
    employeeCategory = json['EmployeeCategory'];
    registerType = json['RegisterType'];
    partyID = json['PartyID'];
    deviceToken = json['DeviceToken'];
    userName = json['UserName'];
    errorMessage = json['ErrorMessage'];
    uUID = json['UUID'];
    deviceGUID = json['DeviceGUID'];
    airFieldList = json['AirFieldList'];
    oTPExpiryMin = json['OTPExpiryMin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserStatus'] = userStatus;
    data['EmployeeCategory'] = employeeCategory;
    data['RegisterType'] = registerType;
    data['PartyID'] = partyID;
    data['DeviceToken'] = deviceToken;
    data['UserName'] = userName;
    data['ErrorMessage'] = errorMessage;
    data['UUID'] = uUID;
    data['DeviceGUID'] = deviceGUID;
    data['AirFieldList'] = airFieldList;
    data['OTPExpiryMin'] = oTPExpiryMin;
    return data;
  }
}

class STATUS {
  int? statusCode;
  String? statusDescription;
  String? method;
  String? lineNumber;
  String? fileName;
  String? todaysDate;

  STATUS(
      {this.statusCode,
      this.statusDescription,
      this.method,
      this.lineNumber,
      this.fileName,
      this.todaysDate});

  STATUS.fromJson(Map<String, dynamic> json) {
    statusCode = json['StatusCode'];
    statusDescription = json['StatusDescription'];
    method = json['Method'];
    lineNumber = json['LineNumber'];
    fileName = json['FileName'];
    todaysDate = json['TodaysDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StatusCode'] = statusCode;
    data['StatusDescription'] = statusDescription;
    data['Method'] = method;
    data['LineNumber'] = lineNumber;
    data['FileName'] = fileName;
    data['TodaysDate'] = todaysDate;
    return data;
  }
}
