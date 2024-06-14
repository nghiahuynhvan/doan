class AddressModel {
  String? region;
  String? district;
  String? city;

  AddressModel({
    this.region,
    this.district,
    this.city,
});

  Map<String, dynamic> toJson() => {
    'region' : this.region,
    'district' : this.district,
    'city' : this.city,
  };

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    region: json['region'] as String?,
    district: json['district'] as String?,
    city: json['city'] as String?,
  );
}

