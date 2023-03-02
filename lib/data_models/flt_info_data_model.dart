class flt_info_data_model {
  bool? status;
  FltInfoData? fltInfoData;
  List<AirCrewData>? airCrewData;
  Remarks? remarks;

  flt_info_data_model(
      {this.status, this.fltInfoData, this.airCrewData, this.remarks});

  flt_info_data_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    fltInfoData = json['flt_info_data'] != null
        ? new FltInfoData.fromJson(json['flt_info_data'])
        : null;
    if (json['air_crew_data'] != null) {
      airCrewData = <AirCrewData>[];
      json['air_crew_data'].forEach((v) {
        airCrewData!.add(new AirCrewData.fromJson(v));
      });
    }
    remarks =
        json['remarks'] != null ? new Remarks.fromJson(json['remarks']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status'] = this.status;
  //   if (this.fltInfoData != null) {
  //     data['flt_info_data'] = this.fltInfoData!.toJson();
  //   }
  //   if (this.airCrewData != null) {
  //     data['air_crew_data'] = this.airCrewData!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.remarks != null) {
  //     data['remarks'] = this.remarks!.toJson();
  //   }
  //   return data;
  // }
}

class FltInfoData {
  String? date;
  String? flightId;
  String? reportingTime;
  String? aCRedg;
  String? departureStation;
  String? departureStationCode;
  String? departureTerminal;
  String? departureBayNumber;
  String? departureTime;
  String? departureTimeWithTimeZone;
  String? arrivalStation;
  String? arrivalStationCode;
  String? arrivalTerminal;
  String? arrivalBayNumber;
  String? arrivalTime;
  String? arrivaleTimeWithTimeZone;
  String? blockTime;

  FltInfoData(
      {this.date,
      this.flightId,
      this.reportingTime,
      this.aCRedg,
      this.departureStation,
      this.departureStationCode,
      this.departureTerminal,
      this.departureBayNumber,
      this.departureTime,
      this.departureTimeWithTimeZone,
      this.arrivalStation,
      this.arrivalStationCode,
      this.arrivalTerminal,
      this.arrivalBayNumber,
      this.arrivalTime,
      this.arrivaleTimeWithTimeZone,
      this.blockTime});

  FltInfoData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    flightId = json['flight_id'];
    reportingTime = json['reporting_time'];
    aCRedg = json['a/c_redg'];
    departureStation = json['departure_station'];
    departureStationCode = json['departure_station_code'];
    departureTerminal = json['departure_terminal'];
    departureBayNumber = json['departure_bay_number'];
    departureTime = json['departure_time'];
    departureTimeWithTimeZone = json['departure_time_with_time_zone'];
    arrivalStation = json['arrival_station'];
    arrivalStationCode = json['arrival_station_code'];
    arrivalTerminal = json['arrival_terminal'];
    arrivalBayNumber = json['arrival_bay_number'];
    arrivalTime = json['arrival_time'];
    arrivaleTimeWithTimeZone = json['arrivale_time_with_time_zone'];
    blockTime = json['block_time'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['date'] = this.date;
  //   data['flight_id'] = this.flightId;
  //   data['reporting_time'] = this.reportingTime;
  //   data['a/c_redg'] = this.aCRedg;
  //   data['departure_station'] = this.departureStation;
  //   data['departure_station_code'] = this.departureStationCode;
  //   data['departure_terminal'] = this.departureTerminal;
  //   data['departure_bay_number'] = this.departureBayNumber;
  //   data['departure_time'] = this.departureTime;
  //   data['departure_time_with_time_zone'] = this.departureTimeWithTimeZone;
  //   data['arrival_station'] = this.arrivalStation;
  //   data['arrival_station_code'] = this.arrivalStationCode;
  //   data['arrival_terminal'] = this.arrivalTerminal;
  //   data['arrival_bay_number'] = this.arrivalBayNumber;
  //   data['arrival_time'] = this.arrivalTime;
  //   data['arrivale_time_with_time_zone'] = this.arrivaleTimeWithTimeZone;
  //   data['block_time'] = this.blockTime;
  //   return data;
  // }
}

class AirCrewData {
  String? memberPosition;
  String? memberName;
  String? memberNumber;

  AirCrewData({this.memberPosition, this.memberName, this.memberNumber});

  AirCrewData.fromJson(Map<String, dynamic> json) {
    memberPosition = json['member_position'];
    memberName = json['member_name'];
    memberNumber = json['member_number'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['member_position'] = this.memberPosition;
  //   data['member_name'] = this.memberName;
  //   data['member_number'] = this.memberNumber;
  //   return data;
  // }
}

class Remarks {
  String? hotac;
  String? refNo;
  String? status;
  String? from;
  String? to;

  Remarks({this.hotac, this.refNo, this.status, this.from, this.to});

  Remarks.fromJson(Map<String, dynamic> json) {
    hotac = json['hotac'];
    refNo = json['ref_no'];
    status = json['status'];
    from = json['from'];
    to = json['to'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['hotac'] = this.hotac;
  //   data['ref_no'] = this.refNo;
  //   data['status'] = this.status;
  //   data['from'] = this.from;
  //   data['to'] = this.to;
  //   return data;
  // }
}
