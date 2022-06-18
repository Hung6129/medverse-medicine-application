class TrendListImage {
  String trendPillID;
  String trendId;
  String pillRxNavImageObjectId;
  String pillOverviewData;
  String rxnavImageFilename;

  TrendListImage(
      {this.trendPillID,
      this.trendId,
      this.pillRxNavImageObjectId,
      this.pillOverviewData,
      this.rxnavImageFilename});

  TrendListImage.fromJson(Map<String, dynamic> json) {
    trendPillID = json['trendPillID'];
    trendId = json['trendId'];
    pillRxNavImageObjectId = json['pillRxNavImageObjectId'];
    pillOverviewData = json['pillOverviewData'];
    rxnavImageFilename = json['rxnavImageFilename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trendPillID'] = this.trendPillID;
    data['trendId'] = this.trendId;
    data['pillRxNavImageObjectId'] = this.pillRxNavImageObjectId;
    data['pillOverviewData'] = this.pillOverviewData;
    data['rxnavImageFilename'] = this.rxnavImageFilename;
    return data;
  }
}
