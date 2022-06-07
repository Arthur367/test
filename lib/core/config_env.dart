import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Sets propriate environment depending for app
/// depending on whether its on release mode or debug
class Env {
  static String get config => kReleaseMode ? 'prod' : 'dev';
  static String get fileName => kReleaseMode ? '.env.prod' : '.env.dev';
  static String get apiUrl => dotenv.env['API_URL'] ?? '';
}
