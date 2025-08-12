
import 'package:package_info_plus/package_info_plus.dart';

String versionName='';
class AppVersionInfo {
  static Future<Map<String, String>> getVersionInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    // Retrieve version code and version name
    String versionCode = packageInfo.buildNumber; // This is the version code
    versionName = packageInfo.version; // This is the version name

    return {
      'versionCode': versionCode,
      'versionName': versionName,
    };
  }
}