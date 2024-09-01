import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:inshort_clone/model/news_model.dart';
import 'package:inshort_clone/services/news/news_service.dart';
import 'search_feed_event.dart';
import 'search_feed_state.dart';

class SearchFeedBloc extends Bloc<SearchFeedEvent, SearchFeedState> {
  final NewsFeedRepository repository;

  // Constructor with the initialState as a parameter
  SearchFeedBloc({required this.repository}) : super(SearchFeedInitialState());

  // @override
  Stream<SearchFeedState> mapEventToState(SearchFeedEvent event) async* {
    if (event is FetchNewsBySearchQueryEvent) {
      yield SearchFeedLoadingState();
      try {
        List<Articles> news =
            await repository.getNewsBySearchQuery(event.query);
        yield SearchFeedLoadedState(news: news);
      } catch (e) {
        yield SearchFeedErrorState(message: e.toString());
      }
    }
  }
}
