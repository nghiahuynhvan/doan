
/// {@template app_error}
/// [AppError] is interface for different other errors in app.
/// {@endtemplate}
abstract class AppError{
  /// log error to Firebase Logger
  void logErrorToLogger();
}