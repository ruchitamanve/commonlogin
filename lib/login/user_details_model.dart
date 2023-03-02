class UserDetailsModel {
  List<PARTYDETAILS>? pARTYDETAILS;

  UserDetailsModel({this.pARTYDETAILS});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['PARTYDETAILS'] != null) {
      pARTYDETAILS = <PARTYDETAILS>[];
      json['PARTYDETAILS'].forEach((v) {
        pARTYDETAILS!.add(new PARTYDETAILS.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pARTYDETAILS != null) {
      data['PARTYDETAILS'] = this.pARTYDETAILS!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PARTYDETAILS {
  int? userID;
  String? userName;
  dynamic gAHash;
  String? employeeName;
  int? partyID;
  int? partyTypeID;
  String? emailAddress;
  String? mobileNumber;
  String? securityHash;

  PARTYDETAILS(
      {this.userID,
      this.userName,
      this.gAHash,
      this.employeeName,
      this.partyID,
      this.partyTypeID,
      this.emailAddress,
      this.mobileNumber,this.securityHash});

  PARTYDETAILS.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    userName = json['UserName'];
    gAHash = json['GAHash'];
    employeeName = json['EmployeeName'];
    partyID = json['PartyID'];
    partyTypeID = json['PartyTypeID'];
    emailAddress = json['EmailAddress'];
    mobileNumber = json['MobileNumber'];
    securityHash =json["SecurityHash"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserID'] = this.userID;
    data['UserName'] = this.userName;
    data['GAHash'] = this.gAHash;
    data['EmployeeName'] = this.employeeName;
    data['PartyID'] = this.partyID;
    data['PartyTypeID'] = this.partyTypeID;
    data['EmailAddress'] = this.emailAddress;
    data['MobileNumber'] = this.mobileNumber;
    data["SecurityHash"] =this.securityHash;
    return data;
  }
}
