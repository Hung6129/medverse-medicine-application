class CheckInteractionModel {
  String interactionId;
  String firstDrugId;
  String secondDrugId;
  String secondDrugName;
  String interactionDescription;

  CheckInteractionModel(
      {this.interactionId,
      this.firstDrugId,
      this.secondDrugId,
      this.secondDrugName,
      this.interactionDescription});

  CheckInteractionModel.fromJson(Map<String, dynamic> json) {
    interactionId = json['interactionId'];
    firstDrugId = json['firstDrugId'];
    secondDrugId = json['secondDrugId'];
    secondDrugName = json['secondDrugName'];
    interactionDescription = json['interactionDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['interactionId'] = this.interactionId;
    data['firstDrugId'] = this.firstDrugId;
    data['secondDrugId'] = this.secondDrugId;
    data['secondDrugName'] = this.secondDrugName;
    data['interactionDescription'] = this.interactionDescription;
    return data;
  }
}
