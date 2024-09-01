// Dart imports:
import 'dart:async';

class FeedController {
  static StreamController _currentPage = StreamController<int>.broadcast();
  static StreamController _currentArticleIndex =
      StreamController<int>.broadcast();

  static Stream<int> get _currentPageStream => _currentPage.stream as Stream<int>;
  static Stream<int> get _currentArticleIndexStream =>
      _currentArticleIndex.stream as Stream<int>;

  static void addCurrentPage(int page) {
    _currentPage.sink.add(page);
  }

  static void addCurrentArticleIndex(int index) {
    _currentArticleIndex.sink.add(index);
  }

  static int getCurrentPage(Function function) {
    int page = 1;
    _currentPageStream.listen(
      (onData) {
        page = onData;
        function(onData);
            },
    );
    return page;
  }

  static int getCurrentArticleIndex(Function function) {
    int index = 0;
    _currentArticleIndexStream.listen(
      (onData) {
        index = onData;
        function(onData);
            },
    );
    return index;
  }

  static void dispos(String stream) {
    _currentArticleIndex.close();
    _currentPage.close();
  }
}
