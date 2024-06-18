class AddressCityModel {
  int? id;
  int? parentId;
  String? name;
  String? divisionType;
  AddressCityModel({
    this.id,
    this.parentId,
    this.name,
    this.divisionType,
});

  factory AddressCityModel.fromJson(Map<String, dynamic> json) {
    return AddressCityModel(
      id: json['id'] as int?,
      parentId: json['parentId'] as int?,
      name: json['name'] as String?,
      divisionType: json['divisionType'] as String?,
    );
  }


}