class MemberData {
  final String? id;
  final String? teamId;
  final MemberInfo? member;
  final String? dateJoin;
  final String? status;
  final String? role;
  final String? joinMethod;
  final String? position;

  MemberData({
    this.id,
    this.teamId,
    this.member,
    this.dateJoin,
    this.status,
    this.role,
    this.joinMethod,
    this.position,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'teamId': teamId,
      'member': member?.toJson(),
      'dateJoin': dateJoin,
      'status': status,
      'role': role,
      'joinMethod': joinMethod,
      'position': position,
    };
  }

  factory MemberData.fromJson(Map<String, dynamic> json) {
    return MemberData(
      id: json['id'] as String?,
      teamId: json['teamId'] as String,
      member: json['member'] != null
          ? MemberInfo.fromJson(json['member'] as Map<String, dynamic>)
          : null,
      dateJoin: json['dateJoin'] as String,
      status: json['status'] as String?,
      role: json['role'] as String?,
      joinMethod: json['joinMethod'] as String?,
      position: json['position'] as String?,
    );
  }
}

class MemberInfo {
  final String? createAt;
  final String? updateAt;
  final String id;
  final String? phoneNumber;
  final String? fullName;
  final String? nickName;
  final String? favoritePosition;
  final String? description;
  final String? gender;
  final String? birthday;
  final String? signInMethod;
  final String? status;
  final String? avatarUrl;
  final String? username;
  final String? email;
  final bool? verifyEmail;

  MemberInfo({
    this.createAt,
    this.updateAt,
    required this.id,
    this.phoneNumber,
    this.fullName,
    this.nickName,
    this.favoritePosition,
    this.description,
    this.gender,
    this.birthday,
    this.signInMethod,
    this.status,
    this.avatarUrl,
    this.username,
    this.email,
    this.verifyEmail,
  });

  @override
  MemberInfo toDomain() {
    return MemberInfo(
      createAt: createAt,
      updateAt: updateAt,
      id: id,
      phoneNumber: phoneNumber,
      fullName: fullName,
      nickName: nickName,
      favoritePosition: favoritePosition,
      description: description,
      gender: gender,
      birthday: birthday,
      signInMethod: signInMethod,
      status: status,
      avatarUrl: avatarUrl,
      username: username,
      email: email,
      verifyEmail: verifyEmail,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createAt': createAt,
      'updateAt': updateAt,
      'id': id,
      'phoneNumber': phoneNumber,
      'fullName': fullName,
      'nickName': nickName,
      'favoritePosition': favoritePosition,
      'description': description,
      'gender': gender,
      'birthday': birthday,
      'signInMethod': signInMethod,
      'status': status,
      'avatarUrl': avatarUrl,
      'username': username,
      'email': email,
      'verifyEmail': verifyEmail,
    };
  }

  factory MemberInfo.fromJson(Map<String, dynamic> json) {
    return MemberInfo(
      createAt:
         json['createAt'] as String,

      updateAt:
         json['updateAt'] as String,

      id: json['id'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      fullName: json['fullName'] as String?,
      nickName: json['nickName'] as String?,
      favoritePosition: json['favoritePosition'] as String?,
      description: json['description'] as String?,
      gender: json['gender'] as String?,
      signInMethod: json['signInMethod'] as String?,
      status: json['status'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      email: json['email'] as String?,
      verifyEmail: json['verifyEmail'] as bool?,
    );
  }
}
