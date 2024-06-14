
/// [AppFontFamily] Get font family using in app based on device type, OS type
class AppFontFamily {
  /// Nunito font family
  late final String nunito;

  /// {@macro app_font_family}
  AppFontFamily() {
    nunito = "Nunito";
  }

  /// Get font family based on device type, OS type
  String getFontFamily() {
    return nunito;
  }
}
