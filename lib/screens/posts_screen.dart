import '../index.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postPRO = context.watch<PostDataProvider>.call();
    return Scaffold(
      appBar: AppBar(
        title: Text(postPRO.post.title ?? ""),
      ),
      body: RefreshIndicator(
          onRefresh: postPRO.getPostData,
          child: Container(
              padding: const EdgeInsets.all(20),
              child: postPRO.loading
                  ? const Center(child: CircularProgressIndicator())
                  : postPRO.post.rows == null
                      ? const Center(child: Text(Strings.noRows))
                      : body(context))),
    );
  }
}
