class drugDB {
  String drugbankID;
  String drugName;
  String drugDescription;
  String drugState;
  String drugIndication;
  String drugPharmaco;
  String drugMechan;
  String drugToxicity;
  String drugMetabolism;
  String drugHalflife;
  String drugElimination;
  String drugClearance;

  drugDB({
    this.drugbankID,
    this.drugName,
    this.drugDescription,
    this.drugState,
    this.drugIndication,
    this.drugPharmaco,
    this.drugMechan,
    this.drugToxicity,
    this.drugMetabolism,
    this.drugHalflife,
    this.drugElimination,
    this.drugClearance,
  });

  factory drugDB.fromJson(Map<String, dynamic> json) {
    return drugDB(
      drugbankID: json['drugbank_ID'],
      drugName: json['drugName'],
      drugDescription: json['drugDescription'],
      drugState: json['drugState'],
      drugIndication: json['drugIndication'],
      drugPharmaco: json['drugPharmaco'],
      drugMechan: json['drugMechan'],
      drugToxicity: json['drugToxicity'],
      drugMetabolism: json['drugMetabolism'],
      drugHalflife: json['drugHalflife'],
      drugElimination: json['drugElimination'],
      drugClearance: json['drugClearance'],
    );
  }
}
