import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:postapp/index.dart';

import 'myapp_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('Fetch Posts', () {
    test('returns List of Posts if the http call completes successfully',
        () async {
      final client = MockClient();
      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse('http://localhost:8080/')))
          .thenAnswer((_) async => http.Response('''{
	"title": "About",
	"rows": [{
		"title": "Beavers",
		"description": "Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony",
		"imageHref": "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"
	}]
}''', 200));
      ApiService api = ApiService(client);
      expect(await api.getAllPosts(), isA<PostModel>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse('http://localhost:8080/')))
          .thenAnswer((_) async => http.Response("Not Found", 404));
      ApiService api = ApiService(client);

      expect(api.getAllPosts(), throwsException);
    });
  });
}
