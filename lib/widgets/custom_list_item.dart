import 'package:postapp/models/post_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  final Rows _post;
  const CustomListItem(this._post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_post.imageHref == null &&
        _post.title == null &&
        _post.description == null) {
      return Container();
    } else {
      return ListTile(
        leading: _post.imageHref == null
            ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
              )
            : CachedNetworkImage(
                width: MediaQuery.of(context).size.width * 0.2,
                imageUrl: _post.imageHref!,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
        title: Text(_post.title ?? ""),
        subtitle: Text(_post.description ?? ""),
      );
    }
  }
}
