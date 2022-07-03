import '../index.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postPRO = context.watch<PostDataProvider>.call();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: postPRO.getPostData, icon: const Icon(Icons.refresh)),
        title: Text(postPRO.post.title ?? ""),
        actions: [
          IconButton(
              onPressed: () => postPRO.enableSearch
                  ? postPRO.toggleSearch = false
                  : postPRO.toggleSearch = true,
              icon: postPRO.enableSearch
                  ? const Icon(Icons.close)
                  : const Icon(Icons.search_outlined))
        ],
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
