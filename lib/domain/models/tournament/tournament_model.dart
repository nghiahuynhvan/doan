class TournamentModel {
   String? id;
   String? status;
   bool? splitGroup;
   String? name;
   String? district;
   String? city;
   String? address;
   String? description;
   List<String>? sponsorList;
   List<String>? imageList;
   String? startTime;
   String? endTime;
   int? maxTeam;
   String? type;
   String? levelRequire;
   String? emailContact;
   String? personContact;
   String? phoneContact;
   String? joinCode;
   bool? public;

   TournamentModel({
     this.id,
     this.status,
     this.splitGroup,
     this.name,
     this.district,
     this.city,
     this.address,
     this.description,
     this.sponsorList,
     this.imageList,
     this.startTime,
     this.endTime,
     this.maxTeam,
     this.type,
     this.levelRequire,
     this.emailContact,
     this.personContact,
     this.phoneContact,
    this.joinCode,
     this.public,
  });

  factory TournamentModel.fromJson(Map<String, dynamic> json) {
    return TournamentModel(
      id: json['id'] as String?,
      status: json['status']as String?,
      splitGroup: json['splitGroup'],
      name: json['name'] as String?,
      district: json['district'] as String?,
      city: json['city']as String? ,
      address: json['address']as String?,
      description: json['description']as String?,
      sponsorList: (json['sponsorList'] as List).map((e) => e.toString()).toList(),
      imageList:  (json['imageList'] as List).map((e) => e.toString()).toList(),
      startTime: json['startTime']as String?,
      endTime: json['endTime']as String?,
      maxTeam: json['maxTeam']as int?,
      type: json['type']as String?,
      levelRequire: json['levelRequire']as String?,
      emailContact: json['emailContact']as String?,
      personContact: json['personContact']as String?,
      phoneContact: json['phoneContact']as String?,
      joinCode: json['joinCode']as String?,
      public: json['public']as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'splitGroup': splitGroup,
      'name': name,
      'district': district,
      'city': city,
      'address': address,
      'description': description,
      'sponsorList': sponsorList,
      'imageList': imageList,
      'startTime': startTime,
      'endTime': endTime,
      'maxTeam': maxTeam,
      'type': type,
      'levelRequire': levelRequire,
      'emailContact': emailContact,
      'personContact': personContact,
      'phoneContact': phoneContact,
      'joinCode': joinCode,
      'public': public,
    };
  }
}