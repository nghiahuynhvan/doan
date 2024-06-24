import 'package:footballmanager/domain/models/tournament/tour_team_model.dart';
import 'package:footballmanager/domain/models/tournament/tournament_model.dart';

import '../home/match_model.dart';
import 'group_team_list_model.dart';

class TourDetailModel {
  TournamentModel? tournament;
  List<TourTeamModel>? tournamentTeamConfirm;
  List<MatchModel>? matchFootballs;
  List<GroupTeamListModel>? groupTeamDTOList;

  TourDetailModel({
    this.tournament,
    this.tournamentTeamConfirm,
    this.matchFootballs,
    this.groupTeamDTOList,
  });

  factory TourDetailModel.fromJson(Map<String, dynamic> json) {
    return TourDetailModel(
      tournament: json['tournament'] != null
          ? TournamentModel.fromJson(json['tournament'] as Map<String, dynamic>)
          : null,
      tournamentTeamConfirm: (json['tournamentTeamConfirm'] as List<dynamic>?)
          ?.map((e) => TourTeamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      matchFootballs: (json['matchFootballs'] as List<dynamic>?)
          ?.map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupTeamDTOList: (json['groupTeamDTOList'] as List<dynamic>?)
          ?.map((e) => GroupTeamListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
