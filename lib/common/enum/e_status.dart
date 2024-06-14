import 'package:flutter/material.dart';

enum EStatus {
  active,
  inactive,
  pending,
  blocked,
  deleted,
  playing,
  training,
  resting,
  traveling,
  apply,
  other;

  static EStatus init(String? statusString) {
  switch (statusString?.toUpperCase()) {
    case "ACTIVE":
      return  EStatus.active;
    case "INACTIVE":
      return  EStatus.inactive;
    case "PENDING":
      return  EStatus.pending;
    case "BLOCKED":
      return  EStatus.blocked;
    case "DELETED":
      return  EStatus.deleted;
    case "PLAYING":
      return  EStatus.playing;
    case "TRAINING":
      return  EStatus.training;
    case "RESTING":
      return  EStatus.resting;
    case "TRAVELING":
      return  EStatus.traveling;
    case "APPLY":
      return  EStatus.apply;
    default:
      return  EStatus.other;
  }




}

  String get title {
    switch (this) {
      case EStatus.active:
        return 'ACTIVE';
      case EStatus.inactive:
        return 'INACTIVE';
      case EStatus.pending:
        return 'PENDING';
      case EStatus.blocked:
        return 'BLOCKED';
      case EStatus.deleted:
        return 'DELETED';
      case EStatus.playing:
        return 'PLAYING';
      case EStatus.training:
        return 'TRAINING';
      case EStatus.resting:
        return 'RESTING';
      case EStatus.traveling:
        return 'TRAVELING';
      case EStatus.apply:
        return 'APPLY';
      case EStatus.other:
        return 'OTHER';
    }
  }
}