import 'package:html_unescape/html_unescape.dart';

class NewsModel {
  final String title;
  final String subTitle;
  final String description;

  NewsModel(this.title, this.subTitle, this.description);

  static NewsModel processData(String htmlTitle, String htmlString) {
    String title = _processTitle(htmlTitle);
    String subTitle = _processSubTitle(htmlString);
    String description = _processDescription(htmlString);

    return NewsModel(title, subTitle, description);
  }

  static String _processDescription(String htmlString) {
    // Define the regex pattern to match iframe tags
    RegExp iframeRegExp = RegExp(r'<iframe[^>]*>.*?</iframe>', multiLine: true, caseSensitive: false);

    // Remove the iframe tags from the HTML content
    return htmlString.replaceAll(iframeRegExp, '');
  }

  static String _processTitle(String htmlString) {
    return HtmlUnescape().convert(htmlString);
  }

  static String _processSubTitle(String htmlString) {
    String data = '';
    RegExp regex = RegExp(r'<strong>(.*?)<\/strong>');

    Match? match = regex.firstMatch(htmlString);

    if (match != null) {
      return HtmlUnescape().convert(match.group(1) ?? '');
    }
    return data;
  }
}
