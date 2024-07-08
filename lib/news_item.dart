class NewsItem {
  final String title;
  final String subTitle;
  final String description;
  final String thumbnailImage;
  final String author;
  final String date;
  final String? videoUrl;

  NewsItem({
    required this.title,
    required this.subTitle,
    required this.description,
    required this.thumbnailImage,
    required this.author,
    required this.date,
    this.videoUrl,
  });
}
