class GroupTeamModel {
   String? groupNamel;
   String? teamName;
   String? tournamentTeamId;
   String? teamId;
   String? img;
   int? win;
   int? loss;
   int ?draw;
   int? point;
   int? goalsFor;
   int? goalsAgainst;
   int? matchesPlayed;

  GroupTeamModel({
     this.teamName,
     this.tournamentTeamId,
     this.teamId,
     this.img,
     this.win,
     this.loss,
     this.draw,
     this.point,
     this.goalsFor,
     this.goalsAgainst,
     this.matchesPlayed,
  });

  factory GroupTeamModel.fromJson(Map<String, dynamic> json) {
    return GroupTeamModel(
      teamName: json['teamName'] as String?,
      tournamentTeamId: json['tournamentTeamId'] as String?,
      teamId: json['teamId'] as String?,
      img: json['img'] as String?,
      win: json['win'] as int?,
      loss: json['loss'] as int?,
      draw: json['draw'] as int?,
      point: json['point'] as int?,
      goalsFor: json['goalsFor'] as int?,
      goalsAgainst: json['goalsAgainst'] as int?,
      matchesPlayed: json['matchesPlayed'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'teamName': teamName,
      'tournamentTeamId': tournamentTeamId,
      'teamId': teamId,
      'img': img,
      'win': win,
      'loss': loss,
      'draw': draw,
      'point': point,
      'goalsFor': goalsFor,
      'goalsAgainst': goalsAgainst,
      'matchesPlayed': matchesPlayed,
    };
  }
}