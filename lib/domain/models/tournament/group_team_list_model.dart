import 'package:footballmanager/domain/models/tournament/group_team_model.dart';

class GroupTeamListModel {
   String? groupName;
   List<GroupTeamModel>? groupTeamDTOS;

   GroupTeamListModel({
     this.groupName,
     this.groupTeamDTOS,

  });

  factory GroupTeamListModel.fromJson(Map<String, dynamic> json) {
    return GroupTeamListModel(
      groupName: json['groupName'],
      groupTeamDTOS: (json['groupTeamDTOS'] as List<dynamic>?)
          ?.map((e) => GroupTeamModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'groupName': groupName,
    };
  }
}