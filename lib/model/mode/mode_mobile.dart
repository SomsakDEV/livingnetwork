// To parse this JSON data, do
//
//     final mobileModel = mobileModelFromJson(jsonString);

import 'dart:convert';

MobileModel mobileModelFromJson(String str) => MobileModel.fromJson(json.decode(str));

String mobileModelToJson(MobileModel data) => json.encode(data.toJson());

class MobileModel {
  MobileModel({
    required this.msisdn,
    required this.mode5G,
    required this.packageName,
    required this.packageState,
    required this.maxQuota,
    required this.remainingQuota,
    required this.startDate,
    required this.expireDate,
    required this.currentMode,
    required this.policy,
  });

  String msisdn;
  String mode5G;
  String packageName;
  String packageState;
  String maxQuota;
  String remainingQuota;
  DateTime startDate;
  DateTime expireDate;
  String currentMode;
  List<Policy> policy;

  factory MobileModel.fromJson(Map<String, dynamic> json) => MobileModel(
    msisdn: json["msisdn"],
    mode5G: json["mode5G"],
    packageName: json["packageName"],
    packageState: json["packageState"],
    maxQuota: json["maxQuota"],
    remainingQuota: json["remainingQuota"],
    startDate: DateTime.parse(json["startDate"]),
    expireDate: DateTime.parse(json["expireDate"]),
    currentMode: json["currentMode"],
    policy: List<Policy>.from(json["policy"].map((x) => Policy.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msisdn": msisdn,
    "mode5G": mode5G,
    "packageName": packageName,
    "packageState": packageState,
    "maxQuota": maxQuota,
    "remainingQuota": remainingQuota,
    "startDate": startDate.toIso8601String(),
    "expireDate": expireDate.toIso8601String(),
    "currentMode": currentMode,
    "policy": List<dynamic>.from(policy.map((x) => x.toJson())),
  };
}

class Policy {
  Policy({
    required this.mode,
    required this.startDate,
    required this.expireDate,
    required this.spentTimePerDay,
    required this.count,
    required this.bandwidthRemainging,
  });

  String mode;
  DateTime startDate;
  DateTime expireDate;
  String spentTimePerDay;
  String count;
  String bandwidthRemainging;

  factory Policy.fromJson(Map<String, dynamic> json) => Policy(
    mode: json["mode"],
    startDate: DateTime.parse(json["startDate"]),
    expireDate: DateTime.parse(json["expireDate"]),
    spentTimePerDay: json["spentTimePerDay"],
    count: json["count"],
    bandwidthRemainging: json["bandwidthRemainging"],
  );

  Map<String, dynamic> toJson() => {
    "mode": mode,
    "startDate": startDate.toIso8601String(),
    "expireDate": expireDate.toIso8601String(),
    "spentTimePerDay": spentTimePerDay,
    "count": count,
    "bandwidthRemainging": bandwidthRemainging,
  };
}
