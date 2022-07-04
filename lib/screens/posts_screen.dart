import '../index.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Consumer<PostDataProvider>(
              builder: (context, postDataProvider, child) => IconButton(
                  onPressed: postDataProvider.getPostData,
                  icon: const Icon(Icons.refresh))),
          title: Consumer<PostDataProvider>(
              builder: (context, postDataProvider, child) =>
                  Text(postDataProvider.post?.title ?? "")),
          actions: [
            Consumer<PostDataProvider>(
                builder: (context, postDataProvider, child) => IconButton(
                    onPressed: () => postDataProvider.enableSearch
                        ? postDataProvider.toggleSearch = false
                        : postDataProvider.toggleSearch = true,
                    icon: postDataProvider.enableSearch
                        ? const Icon(Icons.close)
                        : const Icon(Icons.search_outlined)))
          ],
        ),
        body: Consumer<PostDataProvider>(
          builder: (context, postDataProvider, child) => RefreshIndicator(
              onRefresh: postDataProvider.getPostData,
              child: Container(
                  padding: const EdgeInsets.all(20),
                  child: postDataProvider.loading
                      ? const Center(child: CircularProgressIndicator())
                      : postDataProvider.post?.error != null
                          ? somethingWentWrong
                          : postDataProvider.post?.rows == null
                              ? const Center(child: Text(Strings.noRows))
                              : body(context))),
        ));
  }
}
