class DistrictModel {
  int? id;
  int? parentId;
  String? name;
  String? divisionType;
  DistrictModel({
    this.id,
    this.parentId,
    this.name,
    this.divisionType,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) {
    return DistrictModel(
      id: json['id'] as int?,
      parentId: json['parentId'] as int?,
      name: json['name'] as String?,
      divisionType: json['divisionType'] as String?,
    );
  }


}