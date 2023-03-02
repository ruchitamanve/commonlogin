class dtl_recency_data_model {
  List<Null>? table;
  List<Table1>? table1;
  List<Null>? table2;
  List<Table3>? table3;
  List<Null>? table4;

  dtl_recency_data_model(
      {this.table, this.table1, this.table2, this.table3, this.table4});

  dtl_recency_data_model.fromJson(Map<String, dynamic> json) {
    if (json['Table'] != null) {
      table = <Null>[];
      // json['Table'].forEach((v) {
      //   table!.add(new Null.fromJson(v));
      // });
    }
    if (json['Table1'] != null) {
      table1 = <Table1>[];
      json['Table1'].forEach((v) {
        table1!.add(new Table1.fromJson(v));
      });
    }
    if (json['Table2'] != null) {
      table2 = <Null>[];
      // json['Table2'].forEach((v) {
      //   table2!.add(new Null.fromJson(v));
      // });
    }
    if (json['Table3'] != null) {
      table3 = <Table3>[];
      json['Table3'].forEach((v) {
        table3!.add(new Table3.fromJson(v));
      });
    }
    if (json['Table4'] != null) {
      table4 = <Null>[];
      // json['Table4'].forEach((v) {
      //   table4!.add(new Null.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.table != null) {
    //   data['Table'] = this.table!.map((v) => v.toJson()).toList();
    // }
    if (this.table1 != null) {
      data['Table1'] = this.table1!.map((v) => v.toJson()).toList();
    }
    // if (this.table2 != null) {
    //   data['Table2'] = this.table2!.map((v) => v.toJson()).toList();
    // }
    if (this.table3 != null) {
      data['Table3'] = this.table3!.map((v) => v.toJson()).toList();
    }
    // if (this.table4 != null) {
    //   data['Table4'] = this.table4!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Table1 {
  String? shortName;
  int? ratingID;
  int? partyID;
  int? watchTime;
  String? watchHour;
  int? colorValue;

  Table1(
      {this.shortName,
      this.ratingID,
      this.partyID,
      this.watchTime,
      this.watchHour,
      this.colorValue});

  Table1.fromJson(Map<String, dynamic> json) {
    shortName = json['ShortName'];
    ratingID = json['RatingID'];
    partyID = json['PartyID'];
    watchTime = json['WatchTime'];
    watchHour = json['WatchHour'];
    colorValue = json['ColorValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ShortName'] = this.shortName;
    data['RatingID'] = this.ratingID;
    data['PartyID'] = this.partyID;
    data['WatchTime'] = this.watchTime;
    data['WatchHour'] = this.watchHour;
    data['ColorValue'] = this.colorValue;
    return data;
  }
}

class Table3 {
  int? partyID;
  String? skillGroup;
  int? ratingID;
  int? skillGroupID;
  int? watchTime;
  String? watchHour;
  String? dutyStations;
  int? colorValue;

  Table3(
      {this.partyID,
      this.skillGroup,
      this.ratingID,
      this.skillGroupID,
      this.watchTime,
      this.watchHour,
      this.dutyStations,
      this.colorValue});

  Table3.fromJson(Map<String, dynamic> json) {
    partyID = json['PartyID'];
    skillGroup = json['Skill Group'];
    ratingID = json['RatingID'];
    skillGroupID = json['SkillGroupID'];
    watchTime = json['WatchTime'];
    watchHour = json['WatchHour'];
    dutyStations = json['DutyStations'];
    colorValue = json['ColorValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PartyID'] = this.partyID;
    data['Skill Group'] = this.skillGroup;
    data['RatingID'] = this.ratingID;
    data['SkillGroupID'] = this.skillGroupID;
    data['WatchTime'] = this.watchTime;
    data['WatchHour'] = this.watchHour;
    data['DutyStations'] = this.dutyStations;
    data['ColorValue'] = this.colorValue;
    return data;
  }
}
