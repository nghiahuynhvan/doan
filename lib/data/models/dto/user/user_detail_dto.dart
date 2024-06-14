import 'package:json_annotation/json_annotation.dart';

import '../../../../common/enum/e_gender.dart';

import '../../../../common/enum/e_status.dart';
import '../../../../domain/models/user/user_detail_model.dart';
import '../../mapper_domain.dart';

part 'user_detail_dto.g.dart';

@JsonSerializable(explicitToJson: false)
class UserDTO extends MapperDomain<UserModel> {
  String? id;
  String? createAt;
  String? updateAt;
  String? phoneNumber;
  String? fullName;
  String? nickName;
  String? favoritePosition;
  String? description;
  String? gender;
  String? birthday;
  String? status;
  String? avatarUrl;
  String? username;
  String? email;
  bool? verifyEmail;

  /// {@macro user_dto}
  UserDTO({
    this.id,
    this.createAt,
    this.updateAt,
    this.phoneNumber,
    this.fullName,
    this.nickName,
    this.favoritePosition,
    this.description,
    this.gender,
    this.birthday,
    this.status,
    this.avatarUrl,
    this.username,
    this.email,
    this.verifyEmail,
  });

  ///Creating a new [UserDTO] instance from a map structure.
  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  /// Convert dart object to json.
  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

  @override
  UserModel toDomain() => UserModel(
        id: id,
        createdAt: createAt,
        updatedAt: updateAt,
        phoneNumber: phoneNumber,
        fullName: fullName,
        nickName: nickName,
        favoritePosition: favoritePosition,
        description: description,
        gender: Gender.init(gender),
        birthday: birthday,
        status: EStatus.init(status),
        avatarUrl: avatarUrl,
        username: username,
        email: email,
        verifyEmail: verifyEmail,
      );
}
