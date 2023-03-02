class model_for_atcol {
  List<Table>? table;

  model_for_atcol({this.table});

  model_for_atcol.fromJson(Map<String, dynamic> json) {
    if (json['Table'] != null) {
      table = <Table>[];
      json['Table'].forEach((v) {
        table!.add(new Table.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.table != null) {
      data['Table'] = this.table!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Table {
  int? licenseTypeID;
  String? licenseNumber;
  int? partyID;
  String? rating;
  String? issueDate;

  Table(
      {this.licenseTypeID,
      this.licenseNumber,
      this.partyID,
      this.rating,
      this.issueDate});

  Table.fromJson(Map<String, dynamic> json) {
    licenseTypeID = json['LicenseTypeID'];
    licenseNumber = json['LicenseNumber'];
    partyID = json['PartyID'];
    rating = json['Rating'];
    issueDate = json['IssueDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LicenseTypeID'] = this.licenseTypeID;
    data['LicenseNumber'] = this.licenseNumber;
    data['PartyID'] = this.partyID;
    data['Rating'] = this.rating;
    data['IssueDate'] = this.issueDate;
    return data;
  }
}
