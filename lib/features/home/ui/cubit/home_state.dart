part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class NewsFetchInitialState extends HomeState {}

class NewsFetchSuccessState extends HomeState {
  final List<News> newsList;

  const NewsFetchSuccessState(this.newsList);

  @override
  List<Object> get props => [newsList];
}

class NewsFetchFailureState extends HomeState {}
