class model_for_tqd_2_8 {
  List<Table>? table;

  model_for_tqd_2_8({this.table});

  model_for_tqd_2_8.fromJson(Map<String, dynamic> json) {
    if (json['Table'] != null) {
      table = <Table>[];
      json['Table'].forEach((v) {
        table!.add(Table.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (table != null) {
      data['Table'] = table!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Table {
  int? serialNo;
  String? issueDate;
  int? partyID;
  String? licenseName;
  String? validityUnit;
  String? validity;
  String? expiryThresholdUnit;
  String? unit;
  String? licenseNumber;
  String? validUpto;
  String? doneDate;
  String? daysToExpire;
  int? colorValue;
  int? percentage;
  int? isLifeTimeValidity;
  int? sortOrder;

  Table(
      {this.serialNo,
      this.issueDate,
      this.partyID,
      this.licenseName,
      this.validityUnit,
      this.validity,
      this.expiryThresholdUnit,
      this.unit,
      this.licenseNumber,
      this.validUpto,
      this.doneDate,
      this.daysToExpire,
      this.colorValue,
      this.percentage,
      this.isLifeTimeValidity,
      this.sortOrder});

  Table.fromJson(Map<String, dynamic> json) {
    serialNo = json['SerialNo'];
    issueDate = json['IssueDate'];
    partyID = json['PartyID'];
    licenseName = json['LicenseName'];
    validityUnit = json['ValidityUnit'];
    validity = json['Validity'];
    expiryThresholdUnit = json['ExpiryThresholdUnit'];
    unit = json['Unit'];
    licenseNumber = json['LicenseNumber'];
    validUpto = json['ValidUpto'];
    doneDate = json['DoneDate'];
    daysToExpire = json['DaysToExpire'].toString();
    colorValue = json['ColorValue'];
    percentage = json['Percentage'];
    isLifeTimeValidity = json['IsLifeTimeValidity'];
    sortOrder = json['SortOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['SerialNo'] = serialNo;
    data['IssueDate'] = issueDate;
    data['PartyID'] = partyID;
    data['LicenseName'] = licenseName;
    data['ValidityUnit'] = validityUnit;
    data['Validity'] = validity;
    data['ExpiryThresholdUnit'] = expiryThresholdUnit;
    data['Unit'] = unit;
    data['LicenseNumber'] = licenseNumber;
    data['ValidUpto'] = validUpto;
    data['DoneDate'] = doneDate;
    data['DaysToExpire'] = daysToExpire;
    data['ColorValue'] = colorValue;
    data['Percentage'] = percentage;
    data['IsLifeTimeValidity'] = isLifeTimeValidity;
    data['SortOrder'] = sortOrder;
    return data;
  }
}
