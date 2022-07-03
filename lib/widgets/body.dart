import '../index.dart';

Widget body(BuildContext context) {
  final postPRO = context.watch<PostDataProvider>.call();
  return Column(
    children: <Widget>[
      postPRO.enableSearch
          ? ListTile(
              title: TextField(
                controller: postPRO.controller,
                decoration: const InputDecoration(
                  hintText: Strings.searchHint,
                ),
                onChanged: postPRO.onSearchTextChanged,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  postPRO.controller!.clear();
                  postPRO.onSearchTextChanged('');
                },
              ),
            )
          : Container(),
      Expanded(
        child:
            postPRO.foundPosts.isNotEmpty || postPRO.controller!.text.isNotEmpty
                ? ListView.builder(
                    itemCount: postPRO.foundPosts.length,
                    itemBuilder: (context, i) {
                      return CustomListItem(postPRO.foundPosts[i]);
                    },
                  )
                : ListView.builder(
                    itemCount: postPRO.posts.length,
                    itemBuilder: (context, index) {
                      return CustomListItem(postPRO.posts[index]);
                    },
                  ),
      ),
    ],
  );
}
