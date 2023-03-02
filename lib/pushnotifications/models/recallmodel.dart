class RecallAlert {
  List<Table>? table;

  RecallAlert({this.table});

  RecallAlert.fromJson(Map<String, dynamic> json) {
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
  int? result;
  Null? alertMessage;

  Table({this.result, this.alertMessage});

  Table.fromJson(Map<String, dynamic> json) {
    result = json['Result'];
    alertMessage = json['AlertMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Result'] = this.result;
    data['AlertMessage'] = this.alertMessage;
    return data;
  }
}
