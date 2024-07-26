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
  YoutubePlayerController? currentYoutubeController;

  HomeCubit(
    this.fetchNewsUseCase,
  ) : super(HomeInitial());

  void fetchNews({bool resetPageCount = false}) async {
    resetPageCount ? page = 1 : page++;
    emit(page == 1 ? NewsFetchInitialState() : MoreNewsFetchingState(newsList));
    final result = await fetchNewsUseCase(page: page, categoryId: categoryId);
    result.fold((list) {
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
