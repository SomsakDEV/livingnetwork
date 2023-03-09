// To parse this JSON data, do
//
//     final customer = customerFromJson(jsonString);

import 'dart:convert';

UserData customerFromJson(String str) => UserData.fromJson(json.decode(str));

String customerToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    required this.msisdn,
    required this.networkType,
    required this.cellId,
    required this.paymentType,
    required this.modelType,
    required this.customerState,
    required this.bssrule,
    required this.alarm,
    required this.eco,
  });

  String msisdn;
  String networkType;
  String cellId;
  String paymentType;
  String modelType;
  String customerState;
  String bssrule;
  String alarm;
  String eco;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    msisdn: json["msisdn"],
    networkType: json["networkType"],
    cellId: json["cellId"],
    paymentType: json["paymentType"],
    modelType: json["modelType"],
    customerState: json["customerState"],
    bssrule: json["bssrule"],
    alarm: json["alarm"],
    eco: json["eco"],
  );

  Map<String, dynamic> toJson() => {
    "msisdn": msisdn,
    "networkType": networkType,
    "cellId": cellId,
    "paymentType": paymentType,
    "modelType": modelType,
    "customerState": customerState,
    "bssrule": bssrule,
    "alarm": alarm,
    "eco": eco,
  };
}
