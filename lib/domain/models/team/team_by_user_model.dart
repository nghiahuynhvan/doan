import 'package:footballmanager/common/enum/e_skillLevel.dart';

import '../../../common/enum/e_status.dart';

class TeamByUserModel {
  late String? id;
  late String? ownerId;
  late String? teamName;
  late String? shortname;
  late String? description;
  late String? region;
  late String? district;
  late String? city;
  late EStatus? status;
  late String? code;
  late String? urlImage;
  late String? ruleTeam;
  late String? playingStyle;
  late SkillLevel? skillLevel;
  late String? contactInformation;
  late String? achievements;

  TeamByUserModel({
    this.id,
    this.ownerId,
    this.teamName,
    this.shortname,
    this.description,
    this.region,
    this.district,
    this.city,
    this.status,
    this.code,
    this.urlImage,
    this.ruleTeam,
    this.playingStyle,
    this.skillLevel,
    this.contactInformation,
    this.achievements,
  });

  String get name => teamName ?? '';

  String get UrlImage => urlImage ?? '';


  String get skill => skillLevel?.title ?? '';

  String get statusTeam => status?.title ?? '';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ownerId': ownerId,
      'teamName': teamName,
      'shortname': shortname,
      'description': description,
      'region': region,
      'district': district,
      'city': city,
      'status': status?.title,
      'code': code,
      'urlImage': urlImage,
      'ruleTeam': ruleTeam,
      'playingStyle': playingStyle,
      'skillLevel': skillLevel?.title,
      'contactInformation': contactInformation,
      'achievements': achievements,
    };
  }

  factory TeamByUserModel.fromJson(Map<String, dynamic> json) {
    return TeamByUserModel(
      id: json['id'] as String?,
      ownerId: json['ownerId'],
      teamName: json['teamName'] ?? '',
      shortname: json['shortname'],
      description: json['description'],
      region: json['region'],
      district: json['district'],
      city: json['city'],
      status: EStatus.init(json['status']),
      code: json['code'],
      urlImage: json['urlImage'],
      ruleTeam: json['ruleTeam'],
      playingStyle: json['playingStyle'],
      skillLevel: SkillLevel.init(json['skillLevel']),
      contactInformation: json['contactInformation'] ?? '',
      achievements: json['achievements'],
    );
  }
}
