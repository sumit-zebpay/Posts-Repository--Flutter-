import '../index.dart';
import 'package:http/http.dart' as http;

class PostDataProvider with ChangeNotifier {
  PostModel? post = PostModel();
  List<Rows>? posts = <Rows>[];
  List<Rows> foundPosts = <Rows>[];
  BuildContext? context;
  bool loading = false;
  bool _enableSearch = false;
  bool get enableSearch => _enableSearch;
  TextEditingController? controller;
  ApiService? api;

  PostDataProvider() {
    api = ApiService(http.Client());
    controller = TextEditingController();
    getPostData();
  }

  set toggleSearch(bool value) {
    if (!value) {
      foundPosts.clear();
      controller!.text = "";
    }
    _enableSearch = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> getPostData() async {
    isLoading = true;
    post = await api?.getAllPosts();
    if (post?.rows != null) {
      posts = post?.rows;
    }
    isLoading = false;
    notifyListeners();
  }

  onSearchTextChanged(String text) async {
    foundPosts.clear();
    if (text.isEmpty) {
      notifyListeners();
      return;
    }

    for (var userDetail in posts!) {
      if (userDetail.title != null) {
        if (userDetail.title!.toLowerCase().contains(text.toLowerCase())) {
          foundPosts.add(userDetail);
        }
      }
    }
    notifyListeners();
  }
}
