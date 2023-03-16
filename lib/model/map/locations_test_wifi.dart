class LocationTestWifi {
  String? type;
  List<Features>? features;

  LocationTestWifi({this.type, this.features});

  LocationTestWifi.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(new Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.features != null) {
      data['features'] = this.features!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Features {
  String? type;
  Geometry? geometry;
  Properties? properties;

  Features({this.type, this.geometry, this.properties});

  Features.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    return data;
  }
}

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({this.type, this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Properties {
  int? oBJECTID;
  String? lMPROVCODE;
  String? lMAMPCODE;
  String? lMTAMCODE;
  String? lMPROVNAMT;
  String? lMAMPNAMT;
  String? lMTAMNAMT;
  String? lMPROVNAME;
  String? lMAMPNAME;
  String? lMTAMNAME;
  int? lMUPDDATE;
  String? sLMAPNAME;
  String? sLMAPLOCATION;
  String? sLMAPMACADDRESS;
  String? sLMZONE;
  String? sLMFLOOR;
  String? sLMBRAND;
  String? sLMMODEL;
  String? sLMAPSSID;
  String? sLMPARTNER;
  String? sLMAPSSIDSTATUS;
  double? sLMLATITUDE;
  double? sLMLONGITUDE;
  double? lMLAT;
  double? lMLONG;
  String? sLMSERVICEAREACODE;
  String? sLMSERVICEAREAID;
  String? sLMSITEAPID;
  String? sLMSITEAPSSIDID;
  String? gDBGEOMATTRDATA;

  Properties(
      {this.oBJECTID,
      this.lMPROVCODE,
      this.lMAMPCODE,
      this.lMTAMCODE,
      this.lMPROVNAMT,
      this.lMAMPNAMT,
      this.lMTAMNAMT,
      this.lMPROVNAME,
      this.lMAMPNAME,
      this.lMTAMNAME,
      this.lMUPDDATE,
      this.sLMAPNAME,
      this.sLMAPLOCATION,
      this.sLMAPMACADDRESS,
      this.sLMZONE,
      this.sLMFLOOR,
      this.sLMBRAND,
      this.sLMMODEL,
      this.sLMAPSSID,
      this.sLMPARTNER,
      this.sLMAPSSIDSTATUS,
      this.sLMLATITUDE,
      this.sLMLONGITUDE,
      this.lMLAT,
      this.lMLONG,
      this.sLMSERVICEAREACODE,
      this.sLMSERVICEAREAID,
      this.sLMSITEAPID,
      this.sLMSITEAPSSIDID,
      this.gDBGEOMATTRDATA});

  Properties.fromJson(Map<String, dynamic> json) {
    oBJECTID = json['OBJECTID'];
    lMPROVCODE = json['LM_PROV_CODE'];
    lMAMPCODE = json['LM_AMP_CODE'];
    lMTAMCODE = json['LM_TAM_CODE'];
    lMPROVNAMT = json['LM_PROV_NAMT'];
    lMAMPNAMT = json['LM_AMP_NAMT'];
    lMTAMNAMT = json['LM_TAM_NAMT'];
    lMPROVNAME = json['LM_PROV_NAME'];
    lMAMPNAME = json['LM_AMP_NAME'];
    lMTAMNAME = json['LM_TAM_NAME'];
    lMUPDDATE = json['LM_UPD_DATE'];
    sLMAPNAME = json['SLM_AP_NAME'];
    sLMAPLOCATION = json['SLM_AP_LOCATION'];
    sLMAPMACADDRESS = json['SLM_AP_MAC_ADDRESS'];
    sLMZONE = json['SLM_ZONE'];
    sLMFLOOR = json['SLM_FLOOR'];
    sLMBRAND = json['SLM_BRAND'];
    sLMMODEL = json['SLM_MODEL'];
    sLMAPSSID = json['SLM_AP_SSID'];
    sLMPARTNER = json['SLM_PARTNER'];
    sLMAPSSIDSTATUS = json['SLM_AP_SSID_STATUS'];
    sLMLATITUDE = json['SLM_LATITUDE'];
    sLMLONGITUDE = json['SLM_LONGITUDE'];
    lMLAT = json['LM_LAT'];
    lMLONG = json['LM_LONG'];
    sLMSERVICEAREACODE = json['SLM_SERVICE_AREA_CODE'];
    sLMSERVICEAREAID = json['SLM_SERVICE_AREA_ID'];
    sLMSITEAPID = json['SLM_SITE_AP_ID'];
    sLMSITEAPSSIDID = json['SLM_SITE_AP_SSID_ID'];
    gDBGEOMATTRDATA = json['GDB_GEOMATTR_DATA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OBJECTID'] = this.oBJECTID;
    data['LM_PROV_CODE'] = this.lMPROVCODE;
    data['LM_AMP_CODE'] = this.lMAMPCODE;
    data['LM_TAM_CODE'] = this.lMTAMCODE;
    data['LM_PROV_NAMT'] = this.lMPROVNAMT;
    data['LM_AMP_NAMT'] = this.lMAMPNAMT;
    data['LM_TAM_NAMT'] = this.lMTAMNAMT;
    data['LM_PROV_NAME'] = this.lMPROVNAME;
    data['LM_AMP_NAME'] = this.lMAMPNAME;
    data['LM_TAM_NAME'] = this.lMTAMNAME;
    data['LM_UPD_DATE'] = this.lMUPDDATE;
    data['SLM_AP_NAME'] = this.sLMAPNAME;
    data['SLM_AP_LOCATION'] = this.sLMAPLOCATION;
    data['SLM_AP_MAC_ADDRESS'] = this.sLMAPMACADDRESS;
    data['SLM_ZONE'] = this.sLMZONE;
    data['SLM_FLOOR'] = this.sLMFLOOR;
    data['SLM_BRAND'] = this.sLMBRAND;
    data['SLM_MODEL'] = this.sLMMODEL;
    data['SLM_AP_SSID'] = this.sLMAPSSID;
    data['SLM_PARTNER'] = this.sLMPARTNER;
    data['SLM_AP_SSID_STATUS'] = this.sLMAPSSIDSTATUS;
    data['SLM_LATITUDE'] = this.sLMLATITUDE;
    data['SLM_LONGITUDE'] = this.sLMLONGITUDE;
    data['LM_LAT'] = this.lMLAT;
    data['LM_LONG'] = this.lMLONG;
    data['SLM_SERVICE_AREA_CODE'] = this.sLMSERVICEAREACODE;
    data['SLM_SERVICE_AREA_ID'] = this.sLMSERVICEAREAID;
    data['SLM_SITE_AP_ID'] = this.sLMSITEAPID;
    data['SLM_SITE_AP_SSID_ID'] = this.sLMSITEAPSSIDID;
    data['GDB_GEOMATTR_DATA'] = this.gDBGEOMATTRDATA;
    return data;
  }
}
