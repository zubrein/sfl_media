import 'package:intl/intl.dart';

class NewsModel {
  final String subTitle;
  final String description;
  final String videoUrl;

  NewsModel(this.subTitle, this.description, this.videoUrl);

  static NewsModel processData(String htmlString) {
    String subTitle = _processSubTitle(htmlString);
    String description = _processDescription(htmlString);
    String videoUrl = _processVideoUrl(htmlString);

    return NewsModel(subTitle, description, videoUrl);
  }

  static String _processDescription(String htmlString) {
    return Bidi.stripHtmlIfNeeded(htmlString).trim();
  }

  static String _processVideoUrl(String htmlString) {
    String data = '';
    RegExp regex = RegExp(r'<iframe.*?src=["\"](.*?)["\"]');

    Match? match = regex.firstMatch(htmlString);

    if (match != null) {
      String? url = match.group(1);

      if (url != null) {
        if (url.contains('youtube.com') || url.contains('youtu.be')) {
          return url;
        }
      }
    }
    return data;
  }

  static String _processSubTitle(String htmlString) {
    String data = '';
    RegExp regex = RegExp(r'<h2><strong>(.*?)<\/strong><\/h2>');

    Match? match = regex.firstMatch(htmlString);

    if (match != null) {
      return match.group(1) ?? '';
    }
    return data;
  }
}
