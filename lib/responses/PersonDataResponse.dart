/// personID : 0
/// name : "string"
/// birthDate : "2024-05-05T13:47:19.351Z"
/// age : 0
/// nationalityID : 0

class PersonDataResponse {
  num? personID;
  String? name;
  String? birthDate;
  num? age;
  num? nationalityID;

  PersonDataResponse({
    this.personID,
    this.name,
    this.birthDate,
    this.age,
    this.nationalityID,
  });

  PersonDataResponse.fromJson(Map<String, dynamic> json) {
    personID = json['personID'];
    name = json['name'];
    birthDate = json['birthDate'];
    age = json['age'];
    nationalityID = json['nationalityID'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['personID'] = personID;
    map['name'] = name;
    map['birthDate'] = birthDate;
    map['age'] = age;
    map['nationalityID'] = nationalityID;
    return map;
  }
}
