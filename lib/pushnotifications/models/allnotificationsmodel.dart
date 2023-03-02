import 'dart:convert';

class AllNotifition {
  List<NotificationTable>? table;

  AllNotifition({this.table});

  AllNotifition.fromJson(Map<String, dynamic> json) {
    if (json['Table'] != null) {
      table = <NotificationTable>[];
      json['Table'].forEach((v) {
        table!.add(new NotificationTable.fromJson(v));
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

class NotificationTable {
  int? recordID;
  String? pushNotificationData;
  int? notificationLogAttributes;

  NotificationTable(
      {this.recordID,
      this.pushNotificationData,
      this.notificationLogAttributes});

  NotificationTable.fromJson(Map<String, dynamic> json) {
    recordID = json['RecordID'];
    pushNotificationData = json['PushNotificationData'];
    notificationLogAttributes = json['NotificationLogAttributes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RecordID'] = this.recordID;
    data['PushNotificationData'] = this.pushNotificationData;
    data['NotificationLogAttributes'] = this.notificationLogAttributes;
    return data;
  }
}
