part of 'team_by_user_dto.dart';

TeamByUserDTO _$TeamByUserDTOFromJson(Map<String, dynamic> json) => TeamByUserDTO(
  id: json['id'] as String?,
  ownerId: json['ownerId'] as String?,
  teamName: json['teamName'] as String?,
  shortname: json['shortname'] as String?,
  description: json['description'] as String?,
  region: json['region'] as String?,
  status: json['status'] as String?,
  code: json['code'] as String?,
  urlImage: json['urlImage'] as String?,
  ruleTeam: json['ruleTeam'] as String?,
  playingStyle: json['playingStyle'] as String?,
  skillLevel: json['skillLevel'] as String?,
  contactInformation: json['contactInformation'] as String?,
  achievements: json['achievements'] as String?,
);

Map<String, dynamic> _$TeamByUserDTOToJson(TeamByUserDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'teamName': instance.teamName,
      'shortname': instance.shortname,
      'description': instance.description,
      'region': instance.region,
      'status': instance.status,
      'code': instance.code,
      'urlImage': instance.urlImage,
      'ruleTeam': instance.ruleTeam,
      'playingStyle': instance.playingStyle,
      'skillLevel': instance.skillLevel,
      'contactInformation': instance.contactInformation,
      'achievements': instance.achievements,
    };