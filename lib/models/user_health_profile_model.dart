class UserHealthProfileModel {
  String uid;
  String DBP;
  String SBP;
  String SP02;
  String bloodGroup;
  String bmi;
  String height;
  String weight;

  UserHealthProfileModel({
    this.uid,
    this.DBP,
    this.SBP,
    this.SP02,
    this.bloodGroup,
    this.bmi,
    this.height,
    this.weight,
  });

  /// Receiving data from server
  factory UserHealthProfileModel.fromMap(map) {
    return UserHealthProfileModel(
      uid: map['uid'],
      DBP: map['DBP'],
      SBP: map['SBP'],
      SP02: map['SP02'],
      bloodGroup: map['bloodGroup'],
      bmi: map['bmi'],
      height: map['height'],
      weight: map['weight'],
    );
  }

  /// Sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'DBP': DBP,
      'SBP': SBP,
      'SP02': SP02,
      'bloodGroup': bloodGroup,
      'bmi': bmi,
      'height': height,
      'weight': weight,
    };
  }

  /// Update height data to our server
  Map<String, dynamic> updateHeight() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['height'] = this.height;

    return data;
  }
  /// Update weight data to our server
  Map<String, dynamic> updateWeight() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['weight'] = this.weight;

    return data;
  }

  /// Update bmi data to our server
  Map<String, dynamic> updateBMI() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['bmi'] = this.bmi;

    return data;
  }

  /// Update blood pressure data to our server
  Map<String, dynamic> updateBloodPressure() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['DBP'] = this.DBP;
    data['SBP'] = this.SBP;

    return data;
  }

  /// Update sp02 data to our server
  Map<String, dynamic> updateSP02() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['SP02'] = this.SP02;

    return data;
  }

  /// Update blood group data to our server
  Map<String, dynamic> updateBloodGroup() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['bloodGroup'] = this.bloodGroup;

    return data;
  }
}
