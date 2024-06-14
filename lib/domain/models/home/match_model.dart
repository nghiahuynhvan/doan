import '../team/team_by_user_model.dart';

class MatchModel {
  String? id;
  String? tournamentId;
  TeamByUserModel? homeTeam;
  TeamByUserModel? awayTeam;
  int? playingTime;
  String? status;
  String? matchDate;
  String? typeCourt;
  String? skillLevel;
  String? address;
  String? matchCriterialId;

  MatchModel({
    this.id,
    this.tournamentId,
    this.homeTeam,
    this.awayTeam,
    this.playingTime,
    this.status,
    this.matchDate,
    this.typeCourt,
    this.skillLevel,
    this.address,
    this.matchCriterialId,
});

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      id: json['id'] as String?,
      tournamentId: json['tournamentId'] as String?,
      homeTeam: json['homeTeam'] != null
          ? TeamByUserModel.fromJson(json['homeTeam'] as Map<String, dynamic>)
          : null,
      awayTeam: json['awayTeam'] != null
          ? TeamByUserModel.fromJson(json['awayTeam'] as Map<String, dynamic>)
          : null,
      playingTime: json['playingTime'] as int?,
      status: json['status'] as String?,
      matchDate: json['matchDate'] as String?,
      typeCourt: json['typeCourt'] as String?,
      skillLevel: json['skillLevel'] as String?,
      address: json['address'] as String?,
      matchCriterialId: json['matchCriterialId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tournamentId': tournamentId,
      'homeTeam': homeTeam?.toJson(),
      'awayTeam': awayTeam?.toJson(),
      'playingTime': playingTime,
      'status': status,
      'matchDate': matchDate,
      'typeCourt': typeCourt,
      'skillLevel': skillLevel,
      'address': address,
      'matchCriterialId': matchCriterialId,
    };
  }


}