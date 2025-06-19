import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_x_structure/src/app/core/constants/urls.dart';
class AppConfig {
  // final String imageUrl;

  AppConfig({
    required this.flavor,
    required this.url,
  });

  factory AppConfig.dev() => AppConfig(flavor: 'dev', url: 'https://dummyjson.com/'
        // url: "http://restapi.adequateshop.com/api/", // live url
        //imageUrl: "https://api.workfinder.shtibel.com//assets/",
        );

  factory AppConfig.stag() => AppConfig(flavor: 'stag', url: 'https://dummyjson.com/'
        // url: "http://restapi.adequateshop.com/api/", // local url
        // imageUrl: "http://182.70.118.201:3002/assets/",
        );

  factory AppConfig.prod() => AppConfig(flavor: 'prod', url: 'https://dummyjson.com/'
        // url: "http://restapi.adequateshop.com/api/", // live url
        //  imageUrl: "https://api.workfinder.shtibel.com//assets/",
        );

  final String flavor;
  final String url;

  static Future<void> initializeAppConfig(BuildContext context) async {
    final String? flavor =
        await const MethodChannel('flavor').invokeMethod<String>('getFlavor');
    switch (flavor) {
      case 'dev':
        AppConfigManager.setAppConfig(AppConfig.dev());
        break;
      case 'stag':
        AppConfigManager.setAppConfig(AppConfig.stag());
        break;
      case 'prod':
        AppConfigManager.setAppConfig(AppConfig.prod());
        break;
      default:
        AppConfigManager.setAppConfig(AppConfig.dev());
        break;
    }
    (context as Element).markNeedsBuild();

  }
}

class AppConfigManager {
  static AppConfig? _appConfig;

  static AppConfig? get appConfig => _appConfig;

  static void setAppConfig(AppConfig appConfig) {
    _appConfig = appConfig;
    URLs.baseURL = appConfig.url;
    //  URLs.imageBaseURL = appConfig.imageUrl;
    URLs.isProduction = appConfig.flavor == 'prod';
  }
}
