class PostModel {
  Exception? error;
  String? title;
  List<Rows>? rows;

  PostModel({title, rows});

  PostModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    error = json['error'];

    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['error'] = error;
    if (rows != null) {
      data['rows'] = rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  String? title;
  String? description;
  String? imageHref;

  Rows({title, description, imageHref});

  Rows.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    imageHref = json['imageHref'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['imageHref'] = imageHref;
    return data;
  }

  static List<Rows> listFromJson(List<dynamic> json) {
    // ignore: unnecessary_null_comparison
    return json == null
        ? <Rows>[]
        : json.map((value) => Rows.fromJson(value)).toList();
  }
}
