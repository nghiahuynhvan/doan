/// [PrefsConstants] file contains the variables default variables
/// or key of shared prefs in app.
class PrefsConstants {
  static const String prefAuthToken = 'token';
  static const String prefAccessToken = 'accessToken';
  static const String prefRefreshToken = 'refreshToken';
  static const String prefLanguageUserSetting = 'PREF_LANGUAGE_USER_SETTING';
  static const String prefPhoneNumber = 'phoneNumber';
  static const String prefDisplayName = 'displayName';
  static const String isFirstTimeLogin = 'isFirstTimeLogin';
  static const String userName = 'userName';
  static const String faceBook = 'faceBook';
  static const String dateBorn = 'dateBorn';
  static const String numberPhone = 'numberPhone';
  static const String decrib = 'decrib';
  static const String idUser = 'id';
  static const String idTeam = 'idTeam';


  /// Shared Preference key
  /// keys of language code first save Shared Preference
  ///
  /// It is only used for Android below TIRAMISU version
  /// Because Android below TIRAMISU does not support pref-language selection,
  /// but it is expected that the default language when starting the app for
  /// the first time is vi, instead of en as the default system language
  static const keyLanguageFirstSaveSharedPref =
      "language_first_save_shared_pref";

  /// keys of language code Shared Preference
  static const keyLanguageCodeSharedPref = "language_code_shared_pref";
}
