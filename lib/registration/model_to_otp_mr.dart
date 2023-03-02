class model_to_otp_mr {
  List<STATUS>? sTATUS;
  model_to_otp_mr({this.sTATUS});

  model_to_otp_mr.fromJson(Map<String, dynamic> json) {
    if (json['STATUS'] != null) {
      sTATUS = <STATUS>[];
      json['STATUS'].forEach((v) {
        sTATUS!.add(new STATUS.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sTATUS != null) {
      data['STATUS'] = this.sTATUS!.map((v) => v.toJson()).toList();
    }
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
    data['StatusCode'] = this.statusCode;
    data['StatusDescription'] = this.statusDescription;
    data['Method'] = this.method;
    data['LineNumber'] = this.lineNumber;
    data['FileName'] = this.fileName;
    data['TodaysDate'] = this.todaysDate;
    return data;
  }
}