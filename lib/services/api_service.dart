import 'package:http/http.dart' as http;
import '../index.dart';

class ApiService {
  late final http.Client client;

  ApiService(this.client);
}
