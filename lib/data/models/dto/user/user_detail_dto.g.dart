part of 'user_detail_dto.dart';

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      id: json['id'] as String?,
      createAt: json['createAt'] as String?,
      updateAt: json['updateAt'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      fullName: json['fullName'] as String?,
      nickName: json['nickName'] as String?,
      favoritePosition: json['favoritePosition'] as String?,
      description: json['description'] as String?,
      gender: json['gender'] as String?,
      birthday: json['birthday'] as String?,
      status: json['status'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      verifyEmail: json['verifyEmail'] as bool?,
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createAt,
      'updatedAt': instance.updateAt,
      'phoneNumber': instance.phoneNumber,
      'fullName': instance.fullName,
      'nickName': instance.nickName,
      'favoritePosition': instance.favoritePosition,
      'description': instance.description,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'status': instance.status,
      'avatarUrl': instance.avatarUrl,
      'username': instance.username,
      'email': instance.email,
      'verifyEmail': instance.verifyEmail,
    };
