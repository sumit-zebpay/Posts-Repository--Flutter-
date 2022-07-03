import '../index.dart';

Widget body(BuildContext context) {
  final postPRO = context.watch<PostDataProvider>.call();
  return Column(
    children: <Widget>[
      Expanded(
        child: ListView.builder(
          itemCount: postPRO.posts.length,
          itemBuilder: (context, index) {
            return CustomListItem(postPRO.posts[index]);
          },
        ),
      ),
    ],
  );
}
