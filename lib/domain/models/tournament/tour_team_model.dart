import 'package:footballmanager/domain/models/team/team_by_user_model.dart';

class TourTeamModel {
   String? id;
   String? teamId;
   String? tournamentId;
   String? registrationDate;
   String? status;
   String? type;
   String? note;
   String? group;
   TeamByUserModel? teamDTO;

  TourTeamModel({
     this.id,
     this.teamId,
     this.tournamentId,
     this.registrationDate,
     this.status,
     this.type,
    this.note,
     this.group,
     this.teamDTO,
  });

  factory TourTeamModel.fromJson(Map<String, dynamic> json) {
    return TourTeamModel(
      id: json['id'] as String?,
      teamId: json['teamId']as String?,
      tournamentId: json['tournamentId']as String?,
      registrationDate: json['registrationDate']as String?,
      status: json['status']as String?,
      type: json['type']as String?,
      note: json['note']as String?,
      group: json['group']as String?,
      teamDTO: TeamByUserModel.fromJson(json['teamDTO'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'teamId': teamId,
      'tournamentId': tournamentId,
      'registrationDate': registrationDate,
      'status': status,
      'type': type,
      'note': note,
      'group': group,
      'teamDTO': teamDTO?.toJson(),
    };
  }
}
