
import 'package:footballmanager/common/enum/e_status_apply.dart';
import 'package:footballmanager/domain/models/home/address_model.dart';
import '../team/team_by_user_model.dart';

class MatchCriteriaModel {
  String? id;
  String? userCreateId;
  TeamByUserModel? team;
  List<AddressModel>? addressList;
  List<String>? skillLevelList;
  List<String>? courtTypeList;
  String? expiryTime;
  String? description;
  EStatusApply? status;
  int? timeMatch;
  List<String>? timeMatchList;
  bool? isAutoMap;

  MatchCriteriaModel({
    this.id,
    this.userCreateId,
    this.team,
    this.addressList,
    this.skillLevelList,
    this.courtTypeList,
    this.expiryTime,
    this.description,
    this.status,
    this.timeMatch,
    this.isAutoMap,
    this.timeMatchList,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'userCreateId': userCreateId,
        'team': team?.toJson(),
        'addressList': addressList,
        'skillLevelList': skillLevelList,
        'courtTypeList' : courtTypeList,
        'expiryTime': expiryTime,
        'description': description,
        'status': status?.title,
        'timeMatch': timeMatch,
        'isAutoMap': isAutoMap,
        'timeMatchList': timeMatchList,
      };

  factory MatchCriteriaModel.fromJson(Map<String, dynamic> json) =>
      MatchCriteriaModel(
        id: json['id'],
        userCreateId: json['userCreateId'],
        team: json['team'] != null
            ? TeamByUserModel.fromJson(json['team'])
            : null,
        addressList: (json['addressList'] as List<dynamic>?)
            ?.map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        courtTypeList: (json['courtTypeList'] as List).map((e) => e.toString()).toList(),// Khởi tạo addressList từ JSON
        skillLevelList: (json['skillLevelList'] as List).map((e) => e.toString()).toList(),
        expiryTime: json['expiryTime'] as String,
        description: json['description'],
        status : EStatusApply.init(json['status']),
        timeMatch: json['timeMatch'] as int ?,
        isAutoMap: json['isAutoMap'] as bool ?,
        timeMatchList:
            (json['timeMatchList'] as List).map((e) => e.toString()).toList()
            ,
      );
}
