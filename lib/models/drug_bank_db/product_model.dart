class ProductModel {
  String product_id;
  String product_name;
  String product_labeller;
  String product_code;
  String product_route;
  String product_dosage;
  String product_strength;
  String product_approved;
  String product_otc;
  String product_generic;
  String product_country;
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
  ProductModel({
    this.product_id,
    this.product_name,
    this.product_labeller,
    this.product_code,
    this.product_route,
    this.product_dosage,
    this.product_strength,
    this.product_approved,
    this.product_otc,
    this.product_generic,
    this.product_country,
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

  ProductModel.fromJson(Map<String, dynamic> json) {
    product_id = json['product_id'];
    product_name = json['product_name'];
    product_labeller = json['product_labeller'];
    product_labeller = json['productImages'];
    product_code = json['product_code'];
    product_route = json['product_route'];
    product_strength = json['product_strength'];
    product_dosage = json['product_dosage'];
    product_approved = json['product_approved'];
    product_otc = json['product_otc'];
    product_generic = json['product_generic'];
    product_country = json['product_country'];
    drug_description = json['drug_description'];
    drug_state = json['drug_state'];
    drug_indication = json['drug_indication'];
    pharmacodynamics = json['pharmacodynamics'];
    mechanism = json['mechanism'];
    toxicity = json['toxicity'];
    mechanism = json['mechanism'];
    half_life = json['half_life'];
    route_of_elimination = json['route_of_elimination'];
    clearance = json['clearance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.product_id;
    data['product_name'] = this.product_name;
    data['product_labeller'] = this.product_labeller;
    data['product_code'] = this.product_code;
    data['product_route'] = this.product_route;
    data['product_strength'] = this.product_strength;
    data['product_dosage'] = this.product_dosage;
    data['product_approved'] = this.product_approved;
    data['product_otc'] = this.product_otc;
    data['product_generic'] = this.product_generic;
    data['product_country'] = this.product_country;
    data['drug_description'] = this.drug_description;
    data['drug_state'] = this.drug_state;
    data['drug_indication'] = this.drug_indication;
    data['pharmacodynamics'] = this.pharmacodynamics;
    data['mechanism'] = this.mechanism;
    data['toxicity'] = this.toxicity;
    data['mechanism'] = this.mechanism;
    data['half_life'] = this.half_life;
    data['route_of_elimination'] = this.route_of_elimination;
    data['clearance'] = this.clearance;
    return data;
  }
}
