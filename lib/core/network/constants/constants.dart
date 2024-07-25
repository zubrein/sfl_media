class Constants {
  static const String categoriesText = 'categories';
  static const String baseUrlV2 = 'https://sfl.media/wp-json/wp/v2';
  static const String baseUrlV1 = 'https://sfl.media/wp-json/custom/v1/';
  static const String newsUrl = '$baseUrlV2/posts';
  static const String categoriesUrl = '$baseUrlV1/categories-with-posts';
}

const String defaultFailureMessage = 'Something went wrong';
const String networkFailureMessage = 'Check your internet connection';
