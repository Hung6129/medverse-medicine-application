class ProductDrugModel {
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

  ProductDrugModel(
      {this.drugbankID,
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
      this.drugClearance});

  ProductDrugModel.fromJson(Map<String, dynamic> json) {
    drugbankID = json['drugbank_ID'];
    drugName = json['drugName'];
    drugDescription = json['drugDescription'];
    drugState = json['drugState'];
    drugIndication = json['drugIndication'];
    drugPharmaco = json['drugPharmaco'];
    drugMechan = json['drugMechan'];
    drugToxicity = json['drugToxicity'];
    drugMetabolism = json['drugMetabolism'];
    drugHalflife = json['drugHalflife'];
    drugElimination = json['drugElimination'];
    drugClearance = json['drugClearance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drugbank_ID'] = this.drugbankID;
    data['drugName'] = this.drugName;
    data['drugDescription'] = this.drugDescription;
    data['drugState'] = this.drugState;
    data['drugIndication'] = this.drugIndication;
    data['drugPharmaco'] = this.drugPharmaco;
    data['drugMechan'] = this.drugMechan;
    data['drugToxicity'] = this.drugToxicity;
    data['drugMetabolism'] = this.drugMetabolism;
    data['drugHalflife'] = this.drugHalflife;
    data['drugElimination'] = this.drugElimination;
    data['drugClearance'] = this.drugClearance;
    return data;
  }
}
