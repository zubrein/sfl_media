import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sfl_media/core/logger.dart';
import 'package:sfl_media/features/home/domain/entities/news.dart';

import '../../domain/usecases/fetch_news_usecase.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final FetchNewsUseCase fetchNewsUseCase;

  HomeCubit(
    this.fetchNewsUseCase,
  ) : super(HomeInitial());

  void fetchNews() async {
    emit(NewsFetchInitialState());
    final result = await fetchNewsUseCase('');
    result.fold((list) {
      emit(NewsFetchSuccessState(list));
    }, (error) {
      emit(NewsFetchFailureState(error.toString()));
    });
  }
}
