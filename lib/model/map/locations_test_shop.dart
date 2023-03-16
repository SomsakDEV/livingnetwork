class LocationTestShop {
  String? type;
  List<Features>? features;

  LocationTestShop({this.type, this.features});

  LocationTestShop.fromJson(Map<String, dynamic> json) {
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
  String? lMPROVCODE;
  String? lMAMPCODE;
  String? lMTAMCODE;
  String? lMPROVNAMT;
  String? lMAMPNAMT;
  String? lMTAMNAMT;
  String? lMPROVNAME;
  String? lMAMPNAME;
  String? lMTAMNAME;
  String? cCSMLOCATIONCODE;
  String? cCSMPARTNERNAME;
  String? cCSMPARTNERTYPECODE;
  String? cCSMPARTNERSUBTYPECODE;
  String? cCSMREGION;
  String? cCSMADDRESSNUMBER;
  String? cCSMBUILDINGNAME;
  String? cCSMFLOOR;
  String? cCSMROOM;
  String? cCSMMOOBAN;
  String? cCSMSOI;
  String? cCSMSTREET;
  String? cCSMSTATUS;
  String? cCSMSUBREGION;
  double? lMLAT;
  double? lMLONG;
  String? lMPARTNERTYPE;
  String? cCSMDISTRIBUTIONCHANNELCODE;
  String? cCSMDISTRIBUTIONCHANNELNAME;
  String? cCSMCHANNELSALEGROUPCODE;
  String? cCSMSHOPTYPE;
  String? cCSMRETAILSHOP;
  String? cCSMCHANNELTYPE;
  String? cCSMSHOPFLAG;
  String? cCSMPOSTCODE;
  String? cCSMADDRESSLANDMARKEN;
  String? cCSMADDRESSLANDMARK;
  String? cCSMADDRESSNUMBEREN;
  String? cCSMBUILDINGNAMEEN;
  String? cCSMCHANNELSALEGROUPNAME;
  String? cCSMFLOOREN;
  String? cCSMPARTNERNAMEEN;
  String? cCSMMOO;
  String? cCSMMOOEN;
  String? cCSMMOOBANEN;
  String? cCSMROOMEN;
  String? cCSMSHOPAREA;
  String? cCSMSHOPSIZE;
  String? cCSMSOIEN;
  String? cCSMSTREETEN;

  Properties(
      {this.lMPROVCODE,
      this.lMAMPCODE,
      this.lMTAMCODE,
      this.lMPROVNAMT,
      this.lMAMPNAMT,
      this.lMTAMNAMT,
      this.lMPROVNAME,
      this.lMAMPNAME,
      this.lMTAMNAME,
      this.cCSMLOCATIONCODE,
      this.cCSMPARTNERNAME,
      this.cCSMPARTNERTYPECODE,
      this.cCSMPARTNERSUBTYPECODE,
      this.cCSMREGION,
      this.cCSMADDRESSNUMBER,
      this.cCSMBUILDINGNAME,
      this.cCSMFLOOR,
      this.cCSMROOM,
      this.cCSMMOOBAN,
      this.cCSMSOI,
      this.cCSMSTREET,
      this.cCSMSTATUS,
      this.cCSMSUBREGION,
      this.lMLAT,
      this.lMLONG,
      this.lMPARTNERTYPE,
      this.cCSMDISTRIBUTIONCHANNELCODE,
      this.cCSMDISTRIBUTIONCHANNELNAME,
      this.cCSMCHANNELSALEGROUPCODE,
      this.cCSMSHOPTYPE,
      this.cCSMRETAILSHOP,
      this.cCSMCHANNELTYPE,
      this.cCSMSHOPFLAG,
      this.cCSMPOSTCODE,
      this.cCSMADDRESSLANDMARKEN,
      this.cCSMADDRESSLANDMARK,
      this.cCSMADDRESSNUMBEREN,
      this.cCSMBUILDINGNAMEEN,
      this.cCSMCHANNELSALEGROUPNAME,
      this.cCSMFLOOREN,
      this.cCSMPARTNERNAMEEN,
      this.cCSMMOO,
      this.cCSMMOOEN,
      this.cCSMMOOBANEN,
      this.cCSMROOMEN,
      this.cCSMSHOPAREA,
      this.cCSMSHOPSIZE,
      this.cCSMSOIEN,
      this.cCSMSTREETEN});

  Properties.fromJson(Map<String, dynamic> json) {
    lMPROVCODE = json['LM_PROV_CODE'];
    lMAMPCODE = json['LM_AMP_CODE'];
    lMTAMCODE = json['LM_TAM_CODE'];
    lMPROVNAMT = json['LM_PROV_NAMT'];
    lMAMPNAMT = json['LM_AMP_NAMT'];
    lMTAMNAMT = json['LM_TAM_NAMT'];
    lMPROVNAME = json['LM_PROV_NAME'];
    lMAMPNAME = json['LM_AMP_NAME'];
    lMTAMNAME = json['LM_TAM_NAME'];
    cCSMLOCATIONCODE = json['CCSM_LOCATION_CODE'];
    cCSMPARTNERNAME = json['CCSM_PARTNERNAME'];
    cCSMPARTNERTYPECODE = json['CCSM_PARTNER_TYPE_CODE'];
    cCSMPARTNERSUBTYPECODE = json['CCSM_PARTNER_SUBTYPE_CODE'];
    cCSMREGION = json['CCSM_REGION'];
    cCSMADDRESSNUMBER = json['CCSM_ADDRESS_NUMBER'];
    cCSMBUILDINGNAME = json['CCSM_BUILDING_NAME'];
    cCSMFLOOR = json['CCSM_FLOOR'];
    cCSMROOM = json['CCSM_ROOM'];
    cCSMMOOBAN = json['CCSM_MOOBAN'];
    cCSMSOI = json['CCSM_SOI'];
    cCSMSTREET = json['CCSM_STREET'];
    cCSMSTATUS = json['CCSM_STATUS'];
    cCSMSUBREGION = json['CCSM_SUB_REGION'];
    lMLAT = json['LM_LAT'];
    lMLONG = json['LM_LONG'];
    lMPARTNERTYPE = json['LM_PARTNER_TYPE'];
    cCSMDISTRIBUTIONCHANNELCODE = json['CCSM_DISTRIBUTION_CHANNEL_CODE'];
    cCSMDISTRIBUTIONCHANNELNAME = json['CCSM_DISTRIBUTION_CHANNEL_NAME'];
    cCSMCHANNELSALEGROUPCODE = json['CCSM_CHANNEL_SALE_GROUP_CODE'];
    cCSMSHOPTYPE = json['CCSM_SHOP_TYPE'];
    cCSMRETAILSHOP = json['CCSM_RETAIL_SHOP'];
    cCSMCHANNELTYPE = json['CCSM_CHANNEL_TYPE'];
    cCSMSHOPFLAG = json['CCSM_SHOP_FLAG'];
    cCSMPOSTCODE = json['CCSM_POSTCODE'];
    cCSMADDRESSLANDMARKEN = json['CCSM_ADDRESS_LANDMARK_EN'];
    cCSMADDRESSLANDMARK = json['CCSM_ADDRESS_LANDMARK'];
    cCSMADDRESSNUMBEREN = json['CCSM_ADDRESS_NUMBER_EN'];
    cCSMBUILDINGNAMEEN = json['CCSM_BUILDING_NAME_EN'];
    cCSMCHANNELSALEGROUPNAME = json['CCSM_CHANNEL_SALE_GROUP_NAME'];
    cCSMFLOOREN = json['CCSM_FLOOR_EN'];
    cCSMPARTNERNAMEEN = json['CCSM_PARTNERNAME_EN'];
    cCSMMOO = json['CCSM_MOO'];
    cCSMMOOEN = json['CCSM_MOO_EN'];
    cCSMMOOBANEN = json['CCSM_MOOBAN_EN'];
    cCSMROOMEN = json['CCSM_ROOM_EN'];
    cCSMSHOPAREA = json['CCSM_SHOP_AREA'];
    cCSMSHOPSIZE = json['CCSM_SHOP_SIZE'];
    cCSMSOIEN = json['CCSM_SOI_EN'];
    cCSMSTREETEN = json['CCSM_STREET_EN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LM_PROV_CODE'] = this.lMPROVCODE;
    data['LM_AMP_CODE'] = this.lMAMPCODE;
    data['LM_TAM_CODE'] = this.lMTAMCODE;
    data['LM_PROV_NAMT'] = this.lMPROVNAMT;
    data['LM_AMP_NAMT'] = this.lMAMPNAMT;
    data['LM_TAM_NAMT'] = this.lMTAMNAMT;
    data['LM_PROV_NAME'] = this.lMPROVNAME;
    data['LM_AMP_NAME'] = this.lMAMPNAME;
    data['LM_TAM_NAME'] = this.lMTAMNAME;
    data['CCSM_LOCATION_CODE'] = this.cCSMLOCATIONCODE;
    data['CCSM_PARTNERNAME'] = this.cCSMPARTNERNAME;
    data['CCSM_PARTNER_TYPE_CODE'] = this.cCSMPARTNERTYPECODE;
    data['CCSM_PARTNER_SUBTYPE_CODE'] = this.cCSMPARTNERSUBTYPECODE;
    data['CCSM_REGION'] = this.cCSMREGION;
    data['CCSM_ADDRESS_NUMBER'] = this.cCSMADDRESSNUMBER;
    data['CCSM_BUILDING_NAME'] = this.cCSMBUILDINGNAME;
    data['CCSM_FLOOR'] = this.cCSMFLOOR;
    data['CCSM_ROOM'] = this.cCSMROOM;
    data['CCSM_MOOBAN'] = this.cCSMMOOBAN;
    data['CCSM_SOI'] = this.cCSMSOI;
    data['CCSM_STREET'] = this.cCSMSTREET;
    data['CCSM_STATUS'] = this.cCSMSTATUS;
    data['CCSM_SUB_REGION'] = this.cCSMSUBREGION;
    data['LM_LAT'] = this.lMLAT;
    data['LM_LONG'] = this.lMLONG;
    data['LM_PARTNER_TYPE'] = this.lMPARTNERTYPE;
    data['CCSM_DISTRIBUTION_CHANNEL_CODE'] = this.cCSMDISTRIBUTIONCHANNELCODE;
    data['CCSM_DISTRIBUTION_CHANNEL_NAME'] = this.cCSMDISTRIBUTIONCHANNELNAME;
    data['CCSM_CHANNEL_SALE_GROUP_CODE'] = this.cCSMCHANNELSALEGROUPCODE;
    data['CCSM_SHOP_TYPE'] = this.cCSMSHOPTYPE;
    data['CCSM_RETAIL_SHOP'] = this.cCSMRETAILSHOP;
    data['CCSM_CHANNEL_TYPE'] = this.cCSMCHANNELTYPE;
    data['CCSM_SHOP_FLAG'] = this.cCSMSHOPFLAG;
    data['CCSM_POSTCODE'] = this.cCSMPOSTCODE;
    data['CCSM_ADDRESS_LANDMARK_EN'] = this.cCSMADDRESSLANDMARKEN;
    data['CCSM_ADDRESS_LANDMARK'] = this.cCSMADDRESSLANDMARK;
    data['CCSM_ADDRESS_NUMBER_EN'] = this.cCSMADDRESSNUMBEREN;
    data['CCSM_BUILDING_NAME_EN'] = this.cCSMBUILDINGNAMEEN;
    data['CCSM_CHANNEL_SALE_GROUP_NAME'] = this.cCSMCHANNELSALEGROUPNAME;
    data['CCSM_FLOOR_EN'] = this.cCSMFLOOREN;
    data['CCSM_PARTNERNAME_EN'] = this.cCSMPARTNERNAMEEN;
    data['CCSM_MOO'] = this.cCSMMOO;
    data['CCSM_MOO_EN'] = this.cCSMMOOEN;
    data['CCSM_MOOBAN_EN'] = this.cCSMMOOBANEN;
    data['CCSM_ROOM_EN'] = this.cCSMROOMEN;
    data['CCSM_SHOP_AREA'] = this.cCSMSHOPAREA;
    data['CCSM_SHOP_SIZE'] = this.cCSMSHOPSIZE;
    data['CCSM_SOI_EN'] = this.cCSMSOIEN;
    data['CCSM_STREET_EN'] = this.cCSMSTREETEN;
    return data;
  }
}
