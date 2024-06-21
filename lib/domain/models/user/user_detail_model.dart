import '../../../common/enum/e_gender.dart';
import '../../../common/enum/e_status.dart';

class UserModel {
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? phoneNumber;
  final String? fullName;
  final String? nickName;
  final String? favoritePosition;
  final String? description;
  final Gender? gender;
  final String? birthday;
  final EStatus? status;
  final String? avatarUrl;
  final String? username;
  final String? email;
  final bool? verifyEmail;

  UserModel({
     this.id,
      this.createdAt,
     this.updatedAt,
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


}
