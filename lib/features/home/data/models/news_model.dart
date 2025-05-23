import 'package:html_unescape/html_unescape.dart';
import 'package:html/parser.dart' as html;

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

  static String truncateTo20Words(String text) {
    List<String> words = text.split(' ');
    if (words.length <= 17) return text;
    return words.sublist(0, 17).join(' ');
  }

  static String _processSubTitle(String htmlString) {
    return truncateTo20Words(html.parse(htmlString).body?.text.replaceAll(RegExp(r'[\n\r]+'), ' ').trim() ?? '');
  }
}
