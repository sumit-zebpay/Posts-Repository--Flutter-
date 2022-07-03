import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static String get url =>
      dotenv.env['BASE_URL'] ??
      "https://run.mocky.io/v3/c4ab4c1c-9a55-4174-9ed2-cbbe0738eedf";
}
