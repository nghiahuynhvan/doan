class UserInfoModel {
  late final String id;
  late final String accessToken;
  late final String username;

  UserInfoModel({
    required this.id,
    required this.accessToken,
    required this.username,
});

  String? get Id => id?? '';
}
