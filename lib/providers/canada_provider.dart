import '../index.dart';
import 'package:http/http.dart' as http;

class PostDataProvider with ChangeNotifier {
  PostModel post = PostModel();
  List<Rows> posts = <Rows>[];
  BuildContext? context;
  bool loading = false;
  ApiService? api;

  PostDataProvider() {
    api = ApiService(http.Client());
    getPostData();
  }

  set isLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> getPostData() async {
    isLoading = true;
    post = (await api?.getAllPosts())!;
    if (post.rows != null) {
      posts = post.rows!;
    }
    isLoading = false;
    notifyListeners();
  }
}
