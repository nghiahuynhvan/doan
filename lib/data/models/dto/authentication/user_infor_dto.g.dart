part of 'user_infor_dto.dart';

UserInfoDTO _$UserInfoDTOFromJson(Map<String, dynamic> json) => UserInfoDTO(
      accessToken: json['accessToken'] as String,
      username: json['username'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$UserInfoDTOToJson(UserInfoDTO instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'username': instance.username,
      'id': instance.id,
    };
