part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class NewsFetchInitialState extends HomeState {}

class SuccessState extends HomeState {
  final List<News> newsList;

  const SuccessState(this.newsList);

  @override
  List<Object> get props => [newsList];
}

class MoreNewsFetchingState extends SuccessState {
  const MoreNewsFetchingState(super.newsList);
}

class NewsFetchSuccessState extends SuccessState {
  const NewsFetchSuccessState(super.newsList);
}

class NewsFetchFailureState extends HomeState {
  final String message;

  const NewsFetchFailureState(this.message);
}
