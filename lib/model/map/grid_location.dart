// To parse this JSON data, do
//
//     final gridLocation = gridLocationFromJson(jsonString);

import 'dart:convert';

GridLocation gridLocationFromJson(String str) => GridLocation.fromJson(json.decode(str));

String gridLocationToJson(GridLocation data) => json.encode(data.toJson());

class GridLocation {
  GridLocation({
    required this.type,
    required this.crs,
    required this.features,
  });

  String type;
  Crs crs;
  List<Feature> features;

  factory GridLocation.fromJson(Map<String, dynamic> json) => GridLocation(
    type: json["type"],
    crs: Crs.fromJson(json["crs"]),
    features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "crs": crs.toJson(),
    "features": List<dynamic>.from(features.map((x) => x.toJson())),
  };
}

class Crs {
  Crs({
    required this.type,
    required this.properties,
  });

  String type;
  CrsProperties properties;

  factory Crs.fromJson(Map<String, dynamic> json) => Crs(
    type: json["type"],
    properties: CrsProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "properties": properties.toJson(),
  };
}

class CrsProperties {
  CrsProperties({
    required this.name,
  });

  String name;

  factory CrsProperties.fromJson(Map<String, dynamic> json) => CrsProperties(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class Feature {
  Feature({
    required this.type,
    required this.id,
    required this.geometry,
    required this.properties,
  });

  String type;
  int id;
  Geometry geometry;
  FeatureProperties properties;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    type: json["type"],
    id: json["id"],
    geometry: Geometry.fromJson(json["geometry"]),
    properties: FeatureProperties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "geometry": geometry.toJson(),
    "properties": properties.toJson(),
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
    coordinates: List<List<List<double>>>.from(json["coordinates"].map((x) => List<List<double>>.from(x.map((x) => List<double>.from(x.map((x) => x?.toDouble())))))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => List<dynamic>.from(x.map((x) => List<dynamic>.from(x.map((x) => x)))))),
  };
}

class FeatureProperties {
  FeatureProperties({
    required this.objectid,
    required this.gridId,
    required this.gridNameEn,
    required this.gridNameTh,
    required this.gridNameEnFull,
    required this.gridNameThFull,
    required this.geoSubDistrictId,
    required this.geoDistrictId,
    required this.geoProvinceId,
    required this.geoSubRegionId,
    required this.geoRegionId,
    required this.geoSubDistrictNameEn,
    required this.geoDistrictNameEn,
    required this.geoProvinceNameEn,
    required this.geoSubRegionNameEn,
    required this.geoRegionNameEn,
    required this.geoSubDistrictNameTh,
    required this.geoDistrictNameTh,
    required this.geoProvinceNameTh,
    required this.mktSubRegionId,
    required this.mktSubRegionNameEn,
    required this.mktRegionNameEn,
    required this.gridNameSource,
    required this.cenLat,
    required this.cenLong,
    required this.nwLat,
    required this.nwLong,
    required this.neLat,
    required this.neLong,
    required this.swLat,
    required this.swLong,
    required this.seLat,
    required this.seLong,
  });

  int objectid;
  String gridId;
  String gridNameEn;
  String gridNameTh;
  String gridNameEnFull;
  String gridNameThFull;
  String geoSubDistrictId;
  String geoDistrictId;
  String geoProvinceId;
  String geoSubRegionId;
  String geoRegionId;
  String geoSubDistrictNameEn;
  String geoDistrictNameEn;
  String geoProvinceNameEn;
  String geoSubRegionNameEn;
  String geoRegionNameEn;
  String geoSubDistrictNameTh;
  String geoDistrictNameTh;
  String geoProvinceNameTh;
  String mktSubRegionId;
  String mktSubRegionNameEn;
  String mktRegionNameEn;
  String gridNameSource;
  double cenLat;
  double cenLong;
  double nwLat;
  double nwLong;
  double neLat;
  double neLong;
  double swLat;
  double swLong;
  double seLat;
  double seLong;

  factory FeatureProperties.fromJson(Map<String, dynamic> json) => FeatureProperties(
    objectid: json["OBJECTID"],
    gridId: json["GRID_ID"],
    gridNameEn: json["GRID_NAME_EN"],
    gridNameTh: json["GRID_NAME_TH"],
    gridNameEnFull: json["GRID_NAME_EN_FULL"],
    gridNameThFull: json["GRID_NAME_TH_FULL"],
    geoSubDistrictId: json["GEO_SUB_DISTRICT_ID"],
    geoDistrictId: json["GEO_DISTRICT_ID"],
    geoProvinceId: json["GEO_PROVINCE_ID"],
    geoSubRegionId: json["GEO_SUB_REGION_ID"],
    geoRegionId: json["GEO_REGION_ID"],
    geoSubDistrictNameEn: json["GEO_SUB_DISTRICT_NAME_EN"],
    geoDistrictNameEn: json["GEO_DISTRICT_NAME_EN"],
    geoProvinceNameEn: json["GEO_PROVINCE_NAME_EN"],
    geoSubRegionNameEn: json["GEO_SUB_REGION_NAME_EN"],
    geoRegionNameEn: json["GEO_REGION_NAME_EN"],
    geoSubDistrictNameTh: json["GEO_SUB_DISTRICT_NAME_TH"],
    geoDistrictNameTh: json["GEO_DISTRICT_NAME_TH"],
    geoProvinceNameTh: json["GEO_PROVINCE_NAME_TH"],
    mktSubRegionId: json["MKT_SUB_REGION_ID"],
    mktSubRegionNameEn: json["MKT_SUB_REGION_NAME_EN"],
    mktRegionNameEn: json["MKT_REGION_NAME_EN"],
    gridNameSource: json["GRID_NAME_SOURCE"],
    cenLat: json["CEN_LAT"]?.toDouble(),
    cenLong: json["CEN_LONG"]?.toDouble(),
    nwLat: json["NW_LAT"]?.toDouble(),
    nwLong: json["NW_LONG"]?.toDouble(),
    neLat: json["NE_LAT"]?.toDouble(),
    neLong: json["NE_LONG"]?.toDouble(),
    swLat: json["SW_LAT"]?.toDouble(),
    swLong: json["SW_LONG"]?.toDouble(),
    seLat: json["SE_LAT"]?.toDouble(),
    seLong: json["SE_LONG"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "OBJECTID": objectid,
    "GRID_ID": gridId,
    "GRID_NAME_EN": gridNameEn,
    "GRID_NAME_TH": gridNameTh,
    "GRID_NAME_EN_FULL": gridNameEnFull,
    "GRID_NAME_TH_FULL": gridNameThFull,
    "GEO_SUB_DISTRICT_ID": geoSubDistrictId,
    "GEO_DISTRICT_ID": geoDistrictId,
    "GEO_PROVINCE_ID": geoProvinceId,
    "GEO_SUB_REGION_ID": geoSubRegionId,
    "GEO_REGION_ID": geoRegionId,
    "GEO_SUB_DISTRICT_NAME_EN": geoSubDistrictNameEn,
    "GEO_DISTRICT_NAME_EN": geoDistrictNameEn,
    "GEO_PROVINCE_NAME_EN": geoProvinceNameEn,
    "GEO_SUB_REGION_NAME_EN": geoSubRegionNameEn,
    "GEO_REGION_NAME_EN": geoRegionNameEn,
    "GEO_SUB_DISTRICT_NAME_TH": geoSubDistrictNameTh,
    "GEO_DISTRICT_NAME_TH": geoDistrictNameTh,
    "GEO_PROVINCE_NAME_TH": geoProvinceNameTh,
    "MKT_SUB_REGION_ID": mktSubRegionId,
    "MKT_SUB_REGION_NAME_EN": mktSubRegionNameEn,
    "MKT_REGION_NAME_EN": mktRegionNameEn,
    "GRID_NAME_SOURCE": gridNameSource,
    "CEN_LAT": cenLat,
    "CEN_LONG": cenLong,
    "NW_LAT": nwLat,
    "NW_LONG": nwLong,
    "NE_LAT": neLat,
    "NE_LONG": neLong,
    "SW_LAT": swLat,
    "SW_LONG": swLong,
    "SE_LAT": seLat,
    "SE_LONG": seLong,
  };
}
