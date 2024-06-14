import 'app_orther_error.dart';

/// {@template network_error}
/// [NetworkError] is class representing Network errors.
/// Network is not available.
/// {@endtemplate}
class NetworkError extends AppOtherError {
  /// Message description about error
  late final String messageNetworkError;

  /// {@macro network_error}
  NetworkError({
    this.messageNetworkError = "Network is not available",
    super.messageError = '',
    super.exception,
  });

  @override
  void logErrorToLogger() {
    // TODO: implement logErrorToLogger
  }
}
