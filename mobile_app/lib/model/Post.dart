// ignore_for_file: sort_constructors_first

class Post {
  int id;
  String date;
  String status;
  bool changeColor;
  Links link;
  String urlHinh;
  String content;
  String excerpt;
  Post({
    this.id,
    this.date,
    this.status,
    this.link,
    this.changeColor,
    this.content,
    this.excerpt,
  });

  ////hàm lấy giá trị urlhinh

  String get setUrlHinh => urlHinh;
  set setUrlHinh(String value) {
    urlHinh = value;
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? -1,
      date: json['date'] ?? '',
      status: json['status'] ?? '',
      link: Links.fromJson(json['_links']) ?? '',
      content: json['content']['rendered'] ?? '',
      excerpt: json['excerpt']['rendered'] ?? '',
      changeColor: false,
    );
  }
  Post copyWith({
    final int id,
    final bool changeColor,
    final String date,
    final String status,
    final String content,
    final String excerpt,
  }) {
    return Post(
      id: id ?? this.id,
      changeColor: changeColor ?? this.changeColor,
      date: date ?? this.date,
      status: status ?? this.status,
      content: content ?? this.content,
      excerpt: excerpt ?? this.excerpt,
    );
  }

  Post replacePost(final Post post) {
    return Post(
      id: post.id ?? id,
      changeColor: post.changeColor ?? changeColor,
      date: post.date ?? date,
      status: post.status ?? status,
      content: post.content ?? content,
      excerpt: post.excerpt ?? excerpt,
    );
  }
}

class Links {
  Links({
    this.wpFeaturedmedia,
  });
  List<Author> wpFeaturedmedia;
  factory Links.fromJson(Map<String, dynamic> json) => Links(
        wpFeaturedmedia: List<Author>.from(
            json['wp:featuredmedia'].map((x) => Author.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'wp:featuredmedia':
            List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
      };
}

class Author {
  Author({
    this.embeddable,
    this.href,
  });

  bool embeddable;
  String href;
  factory Author.fromJson(Map<String, dynamic> json) => Author(
        embeddable: json['embeddable'],
        href: json['href'],
      );

  Map<String, dynamic> toJson() => {
        'embeddable': embeddable,
        'href': href,
      };
}
