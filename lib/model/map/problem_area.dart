// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProblemLocation welcomeFromJson(String str) =>
    ProblemLocation.fromJson(json.decode(str));

String welcomeToJson(ProblemLocation data) => json.encode(data.toJson());

class ProblemLocation {
  ProblemLocation({
    required this.type,
    required this.features,
  });

  String type;
  List<Feature> features;

  factory ProblemLocation.fromJson(Map<String, dynamic> json) =>
      ProblemLocation(
        type: json["type"],
        features: List<Feature>.from(
            json["features"].map((x) => Feature.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
      };
}

class Feature {
  Feature({
    required this.id,
    required this.type,
    required this.properties,
    required this.geometry,
  });

  String id;
  String type;
  Properties properties;
  Geometry geometry;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        id: json["id"],
        type: json["type"],
        properties: Properties.fromJson(json["properties"]),
        geometry: Geometry.fromJson(json["geometry"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "properties": properties.toJson(),
        "geometry": geometry.toJson(),
      };
}

class Geometry {
  Geometry({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<List<List<double>>> coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates: List<List<List<double>>>.from(json["coordinates"].map(
            (x) => List<List<double>>.from(
                x.map((x) => List<double>.from(x.map((x) => x?.toDouble())))))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) =>
            List<dynamic>.from(
                x.map((x) => List<dynamic>.from(x.map((x) => x)))))),
      };
}

class Properties {
  Properties({
    this.addSoluti,
    required this.area,
    this.closeDate,
    required this.createDat,
    this.createYea,
    required this.detail,
    required this.district,
    required this.lat,
    required this.long,
    required this.month,
    required this.month1,
    required this.month2,
    required this.month3,
    required this.no,
    required this.numberCom,
    required this.numberFem,
    required this.paCode,
    this.paGroup,
    required this.paStatus,
    required this.pName,
    required this.percentSc,
    required this.radiusM,
    this.remark,
    required this.score,
    required this.siteCodep,
    this.sitecodeN,
    required this.solution,
    required this.statusUpd,
    required this.targetDat,
    required this.typeProbl,
  });

  dynamic addSoluti;
  String area;
  dynamic closeDate;
  DateTime createDat;
  dynamic createYea;
  dynamic detail;
  String district;
  double lat;
  double long;
  int month;
  int month1;
  int month2;
  int month3;
  int no;
  int numberCom;
  int numberFem;
  String paCode;
  dynamic paGroup;
  String paStatus;
  String pName;
  double percentSc;
  int radiusM;
  dynamic remark;
  double score;
  dynamic siteCodep;
  dynamic sitecodeN;
  String solution;
  dynamic statusUpd;
  String targetDat;
  String typeProbl;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        addSoluti: json["Add_Soluti"],
        area: json["Area"],
        closeDate: json["Close_Date"],
        createDat: DateTime.parse(json["Create_Dat"]),
        createYea: json["Create_Yea"],
        detail: json["Detail"],
        district: json["District"],
        lat: json["Lat"]?.toDouble(),
        long: json["Long"]?.toDouble(),
        month: json["Month"],
        month1: json["Month1"],
        month2: json["Month2"],
        month3: json["Month3"],
        no: json["No"],
        numberCom: json["Number_Com"],
        numberFem: json["Number_Fem"],
        paCode: json["PA_Code"],
        paGroup: json["PA_Group"],
        paStatus: json["PA_Status"],
        pName: json["P_Name"],
        percentSc: json["Percent_Sc"],
        radiusM: json["Radius_m_"],
        remark: json["Remark"],
        score: json["Score"]?.toDouble(),
        siteCodep: json["Site_codep"],
        sitecodeN: json["Sitecode_n"],
        solution: json["Solution"],
        statusUpd: json["Status_Upd"],
        targetDat: json["Target_Dat"],
        typeProbl: json["Type_Probl"],
      );

  Map<String, dynamic> toJson() => {
        "Add_Soluti": addSoluti,
        "Area": area,
        "Close_Date": closeDate,
        "Create_Dat":
            "${createDat.year.toString().padLeft(4, '0')}-${createDat.month.toString().padLeft(2, '0')}-${createDat.day.toString().padLeft(2, '0')}",
        "Create_Yea": createYea,
        "Detail": detail,
        "District": district,
        "Lat": lat,
        "Long": long,
        "Month": month,
        "Month1": month1,
        "Month2": month2,
        "Month3": month3,
        "No": no,
        "Number_Com": numberCom,
        "Number_Fem": numberFem,
        "PA_Code": paCode,
        "PA_Group": paGroup,
        "PA_Status": paStatus,
        "P_Name": pName,
        "Percent_Sc": percentSc,
        "Radius_m_": radiusM,
        "Remark": remark,
        "Score": score,
        "Site_codep": siteCodep,
        "Sitecode_n": sitecodeN,
        "Solution": solution,
        "Status_Upd": statusUpd,
        "Target_Dat": targetDat,
        "Type_Probl": typeProbl,
      };
}
