
enum EStatusApply {
  cancel,
  rejected,
  pending,
  confirmed;
  static EStatusApply init(String? statusString) {
    switch (statusString?.toUpperCase()) {
      case "CANCEL":
        return EStatusApply.cancel;
      case "REJECTED":
        return EStatusApply.rejected;
      case "PENDING":
        return EStatusApply.pending;
      case "CONFIRMED":
        return EStatusApply.confirmed;
      default:
        throw Exception("Invalid status: $statusString");
    }
}
  String get title {
    switch (this) {
      case EStatusApply.cancel:
        return 'CANCEL';
      case EStatusApply.rejected:
        return 'REJECTED';
      case EStatusApply.pending:
        return 'PENDING';
      case EStatusApply.confirmed:
        return 'CONFIRMED';
    }
  }

}

