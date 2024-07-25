part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryFetchInitialState extends CategoryState {}

class CategoryFetchSuccessState extends CategoryState {
  final List<Category> categoryList;

  CategoryFetchSuccessState(this.categoryList);

  @override
  List<Object?> get props => [categoryList];
}

class CategoryFetchFailedState extends CategoryState {
  final String message;

  CategoryFetchFailedState(this.message);
}
