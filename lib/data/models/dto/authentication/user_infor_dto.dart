
import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/models/authentication/user_infor_model.dart';
import '../../mapper_domain.dart';

part 'user_infor_dto.g.dart';

/// {@template user_info_dto}
/// This class returns a [UserInfoDTO] instance from remote.
/// {@endtemplate}
@JsonSerializable(explicitToJson: false)
class UserInfoDTO extends MapperDomain<UserInfoModel> {
  /// [accessToken] for [UserInfoDTO].
  late final String
  accessToken;

  /// [userInfo] for [UserInfoDTO].
  late final String username;

  late final String id;

  /// {@macro user_info_dto}
  UserInfoDTO({
    required this.accessToken,
    required this.username,
    required this.id,
  });

  ///Creating a new [UserInfoDTO] instance from a map structure.
  factory UserInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDTOFromJson(json);

  /// Convert dart object to json.
  Map<String, dynamic> toJson() => _$UserInfoDTOToJson(this);

  @override
  UserInfoModel toDomain() =>
      UserInfoModel(accessToken: accessToken, username: username,id: id);
}
