import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sfl_media/features/home/domain/entities/news.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../domain/usecases/fetch_news_usecase.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final FetchNewsUseCase fetchNewsUseCase;
  int page = 0;
  String categoryId = '';
  List<News> newsList = [];
  bool postFetchedEnd = false;
  YoutubePlayerController? currentYoutubeController;

  HomeCubit(
    this.fetchNewsUseCase,
  ) : super(HomeInitial());

  void fetchNews({bool resetPageCount = false, int? postCount}) async {
    if (resetPageCount) {
      page = 1;
      newsList.clear();
    } else {
      page++;
    }
    emit(page == 1 ? NewsFetchInitialState() : MoreNewsFetchingState(newsList));
    final result = await fetchNewsUseCase(page: page, categoryId: categoryId != 'all' ? categoryId : '');
    result.fold((list) {
      if (list.length == 10) {
        postFetchedEnd = false;
      } else {
        postFetchedEnd = true;
      }
      newsList.addAll(list);
      emit(NewsFetchSuccessState(newsList));
    }, (error) {
      emit(NewsFetchFailureState(error.toString()));
    });
  }

  void stopPlaying() {
    if (currentYoutubeController != null) {
      currentYoutubeController!.stop();
    }
  }

  void startPlaying() {
    if (currentYoutubeController != null) {
      currentYoutubeController!.play();
    }
  }
}
