class PillIdentifierModel {
  String pill_data_id;
  String pill_file_name;
  String pill_overview;
  String pill_shape;
  String pill_size;
  String pill_colors;
  String pill_imprints;

  PillIdentifierModel({
    this.pill_data_id,
    this.pill_overview,
    this.pill_shape,
    this.pill_size,
    this.pill_colors,
    this.pill_imprints,
    this.pill_file_name,
  });

  PillIdentifierModel.fromJson(Map<String, dynamic> json) {
    pill_data_id = json['pill_data_id'];
    pill_file_name = json['pill_file_name'];
    pill_overview = json['pill_overview'];
    pill_shape = json['pill_shape'];
    pill_size = json['pill_size'];
    pill_colors = json['pill_colors'];
    pill_imprints = json['pill_imprints'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pill_data_id'] = this.pill_data_id;
    data['pill_image'] = this.pill_file_name;
    data['pill_info'] = this.pill_overview;
    data['pill_shape'] = this.pill_shape;
    data['pill_size'] = this.pill_size;
    data['pill_colors'] = this.pill_colors;
    data['pill_imprints'] = this.pill_imprints;
    return data;
  }
}
