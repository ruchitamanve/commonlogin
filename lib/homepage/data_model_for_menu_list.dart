class data_model_for_menu_list {
  List<Table>? table;

  data_model_for_menu_list({this.table});

  data_model_for_menu_list.fromJson(Map<String, dynamic> json) {
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
  String? menuName;
  int? enumID;
  int? orderIndex;

  Table({this.menuName, this.enumID, this.orderIndex});

  Table.fromJson(Map<String, dynamic> json) {
    menuName = json['MenuName'];
    enumID = json['EnumID'];
    orderIndex = json['OrderIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MenuName'] = this.menuName;
    data['EnumID'] = this.enumID;
    data['OrderIndex'] = this.orderIndex;
    return data;
  }
}
