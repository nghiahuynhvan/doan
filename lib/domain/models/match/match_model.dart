import 'package:footballmanager/common/enum/e_status_apply.dart';
import 'package:footballmanager/common/enum/e_type_court.dart';

import '../team/team_by_user_model.dart';

class MatchModel {
  String? id;
  String? userCreateId;
  TeamByUserModel? team;
  List<String>? addressList;
  List<ETypeCourt>? skillLevelList;
  String? expiryTime;
  String? description;
  EStatusApply? status;
  int? timeMatch;
  List<String>? timeMatchList;
  bool? isAutoMap;

  MatchModel({
    this.id,
    this.userCreateId,
    this.team,
    this.addressList,
    this.skillLevelList,
    this.expiryTime,
    this.description,
    this.status,
    this.timeMatch,
    this.isAutoMap,
    this.timeMatchList,
  });
}
