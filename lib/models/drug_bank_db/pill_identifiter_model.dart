class PillIdentifierModel {
  String pillDataId;
  String pillInfo;
  String pillShape;
  String pillSize;
  String pillColors;
  String pillImprints;

  PillIdentifierModel({
    this.pillDataId,
    this.pillInfo,
    this.pillShape,
    this.pillSize,
    this.pillColors,
    this.pillImprints,
  });

  PillIdentifierModel.fromJson(Map<String, dynamic> json) {
    pillDataId = json['pill_data_id'];
    pillInfo = json['pill_info'];
    pillShape = json['pill_shape'];
    pillSize = json['pill_size'];
    pillColors = json['pill_colors'];
    pillImprints = json['pill_imprints'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pill_data_id'] = this.pillDataId;
    data['pill_info'] = this.pillInfo;
    data['pill_shape'] = this.pillShape;
    data['pill_size'] = this.pillSize;
    data['pill_colors'] = this.pillColors;
    data['pill_imprints'] = this.pillImprints;
    return data;
  }
}
