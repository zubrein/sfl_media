class News {
  final String title;
  final String subTitle;
  final String description;
  final String thumbnailImage;
  final String author;
  final String date;
  final String? videoUrl;

  News({
    required this.title,
    required this.subTitle,
    required this.description,
    required this.thumbnailImage,
    required this.author,
    required this.date,
    this.videoUrl,
  });

  News copyWith({
    String? title,
    String? subTitle,
    String? description,
    String? thumbnailImage,
    String? author,
    String? date,
    String? videoUrl,
  }) {
    return News(
        title: title ?? this.title,
        subTitle: subTitle ?? this.subTitle,
        description: description ?? this.description,
        thumbnailImage: thumbnailImage ?? this.thumbnailImage,
        author: author ?? this.author,
        date: date ?? this.date,
        videoUrl: videoUrl ?? this.videoUrl);
  }
}
