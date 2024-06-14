import 'package:footballmanager/common/enum/e_skillLevel.dart';
import 'package:footballmanager/domain/models/team/team_by_user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../common/enum/e_status.dart';
import '../../mapper_domain.dart';

part 'team_by_user_dto.g.dart';

/// {@template user_info_dto}
/// This class returns a [UserInfoDTO] instance from remote.
/// {@endtemplate}
@JsonSerializable(explicitToJson: false)
class TeamByUserDTO extends MapperDomain<TeamByUserModel> {
  late String? id;
  late String? ownerId;
  late String? teamName;
  late String? shortname;
  late String? description;
  late String? region;
  late String? status;
  late String? code;
  late String? urlImage;
  late String? ruleTeam;
  late String? playingStyle;
  late String? skillLevel;
  late String? contactInformation;
  late String? achievements;

  /// {@macro user_info_dto}

  TeamByUserDTO({
    required this.id,
    required this.ownerId,
    required this.teamName,
    required this.shortname,
    required this.description,
    required this.region,
    required this.status,
    required this.code,
    required this.urlImage,
    required this.ruleTeam,
    required this.playingStyle,
    required this.skillLevel,
    required this.contactInformation,
    required this.achievements,
  });

  ///Creating a new [UserInfoDTO] instance from a map structure.
  factory TeamByUserDTO.fromJson(Map<String, dynamic> json) =>
      _$TeamByUserDTOFromJson(json);

  /// Convert dart object to json.
  Map<String, dynamic> toJson() => _$TeamByUserDTOToJson(this);

  @override
  TeamByUserModel toDomain() => TeamByUserModel(
        id: id,
        ownerId: ownerId,
        teamName: teamName ?? '',
        shortname: shortname,
        description: description,
        region: region,
        status: EStatus.init(status),
        code: code,
        urlImage: urlImage,
        ruleTeam: ruleTeam,
        playingStyle: playingStyle,
        skillLevel: SkillLevel.init(skillLevel!),
        contactInformation: contactInformation ?? '',
        achievements: achievements,
      );
}
