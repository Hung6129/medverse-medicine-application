class CompareDrugModel {
  String product_name;
  String drug_description;
  String drug_state;
  String drug_indication;
  String pharmacodynamics;
  String mechanism;
  String toxicity;
  String metabolism;
  String half_life;
  String route_of_elimination;
  String clearance;
  CompareDrugModel({
    this.product_name,
    this.drug_description,
    this.drug_state,
    this.drug_indication,
    this.pharmacodynamics,
    this.mechanism,
    this.toxicity,
    this.metabolism,
    this.half_life,
    this.route_of_elimination,
    this.clearance,
  });

  // CompareDrugModel.fromJson(Map<String, dynamic> json) {
  //   product_name = json['product_name'];
  //   drug_description = json['drug_description'];
  //   drug_state = json['drug_state'];
  //   drug_indication = json['drug_indication'];
  //   pharmacodynamics = json['pharmacodynamics'];
  //   mechanism = json['mechanism'];
  //   toxicity = json['toxicity'];
  //   mechanism = json['mechanism'];
  //   half_life = json['half_life'];
  //   route_of_elimination = json['route_of_elimination'];
  //   clearance = json['clearance'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['product_name'] = this.product_name;
  //   data['drug_description'] = this.drug_description;
  //   data['drug_state'] = this.drug_state;
  //   data['drug_indication'] = this.drug_indication;
  //   data['pharmacodynamics'] = this.pharmacodynamics;
  //   data['mechanism'] = this.mechanism;
  //   data['toxicity'] = this.toxicity;
  //   data['mechanism'] = this.mechanism;
  //   data['half_life'] = this.half_life;
  //   data['route_of_elimination'] = this.route_of_elimination;
  //   data['clearance'] = this.clearance;
  //   return data;
  }

