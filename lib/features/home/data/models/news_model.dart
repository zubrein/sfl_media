import 'package:intl/intl.dart';

class NewsModel {
  final String subTitle;
  final String description;
  final String? videoUrl;

  NewsModel(this.subTitle, this.description, this.videoUrl);

  static NewsModel processData(String htmlString) {
    String subTitle = _processSubTitle(htmlString);
    String description = _processDescription(htmlString);
    String? videoUrl = _processVideoUrl(htmlString);

    return NewsModel(subTitle, description, videoUrl);
  }

  static String _processDescription(String htmlString) {
    // Define the regex pattern to match iframe tags
    RegExp iframeRegExp = RegExp(r'<iframe[^>]*>.*?</iframe>',
        multiLine: true, caseSensitive: false);

    // Remove the iframe tags from the HTML content
    return htmlString.replaceAll(iframeRegExp, '');
  }

  static String? _processVideoUrl(String htmlString) {
    String? data;
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
    RegExp regex = RegExp(r'<strong>(.*?)<\/strong>');

    Match? match = regex.firstMatch(htmlString);

    if (match != null) {

      return Bidi.stripHtmlIfNeeded(match.group(1) ?? '');
    }
    return data;
  }
}
