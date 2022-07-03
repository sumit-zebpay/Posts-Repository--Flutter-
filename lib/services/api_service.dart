import 'package:http/http.dart' as http;
import '../index.dart';

class ApiService {
  late final http.Client client;

  ApiService(this.client);

  Future<PostModel> getAllPosts() async {
    try {
      final response = await client.get(Uri.parse(Constants.url));
      if (response.statusCode == 200) {
        // assert();
        return PostModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(Strings.errorMessage);
      }
    } catch (e) {
      throw Exception(Strings.errorMessage);
    }
  }
}
