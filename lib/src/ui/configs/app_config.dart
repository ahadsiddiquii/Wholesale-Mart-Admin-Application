import 'dart:io';

import 'application_platforms.dart';
import 'environment_flavours.dart';

class AppConfig {
  static late final EnvironmentFlavours _environment;
  static late final String _serverUrl;
  static late final String _serverApiUrl;
  static late final String _serverImageUrl;
  static late final String _serverSocketUrl;
  static const String _baseUrlProduction = 'http://10.0.2.2:3000/';
  static const String _baseUrlStaging = 'http://10.0.2.2:3000/';
  static const String _baseUrlDevelopment = 'http://10.0.2.2:3000/';
  static const String _baseUrlNotFound = 'none';

  static const String _apiUrlExtension = 'api/';
  static const String _imageUrlExtension = 'https://localhost:3000/uploads/';
  static const String _socketUrlExtension = 'socket';

  static late final String _appVersionToShow;
  static const String _appNameBeta = 'V: BetaDev-';
  static const String _appNameStaging = 'V: Beta-';
  static const String _appNameProduction = 'V: ';

  static late final ApplicationPlatforms _appOperatingSystem;

  static void init({
    required EnvironmentFlavours environment,
    required String appVersionToShow,
  }) {
    _environment = environment;
    if (_environment == EnvironmentFlavours.development) {
      _appVersionToShow = _appNameBeta + appVersionToShow;
      _serverUrl = _baseUrlDevelopment;
    } else if (_environment == EnvironmentFlavours.staging) {
      _appVersionToShow = _appNameStaging + appVersionToShow;
      _serverUrl = _baseUrlStaging;
    } else if (_environment == EnvironmentFlavours.production) {
      _appVersionToShow = _appNameProduction + appVersionToShow;
      _serverUrl = _baseUrlProduction;
    } else {
      _appVersionToShow = appVersionToShow;
      _serverUrl = _baseUrlNotFound;
    }

    _serverApiUrl = _serverUrl + _apiUrlExtension;
    _serverImageUrl = _imageUrlExtension;
    // _serverImageUrl = _serverUrl + _imageUrlExtension;
    _serverSocketUrl = _serverUrl + _socketUrlExtension;
    try {
      if (Platform.isAndroid) {
        _appOperatingSystem = ApplicationPlatforms.ANDROID;
      } else if (Platform.isIOS) {
        _appOperatingSystem = ApplicationPlatforms.IOS;
      } else if (Platform.isFuchsia ||
          Platform.isLinux ||
          Platform.isMacOS ||
          Platform.isWindows) {
        _appOperatingSystem = ApplicationPlatforms.WEB;
      } else {
        _appOperatingSystem = ApplicationPlatforms.OTHER;
      }
    } catch (e) {
      _appOperatingSystem = ApplicationPlatforms.WEB;
    }
  }

  static EnvironmentFlavours getEnvironment() {
    return _environment;
  }

  static ApplicationPlatforms getAppPlatform() {
    return _appOperatingSystem;
  }

  static String getAppVersionToShow() {
    return _appVersionToShow;
  }

  static String getImageUrl() {
    return _serverImageUrl;
  }

  static String getApiUrl() {
    return _serverApiUrl;
  }

  static String getSocketUrl() {
    return _serverSocketUrl;
  }
}
