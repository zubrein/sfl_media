import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/category.dart';
import '../../domain/usecases/fetch_category_usecase.dart';

part 'category_state.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  final FetchCategoryUseCase fetchCategoryUseCase;

  CategoryCubit(this.fetchCategoryUseCase) : super(CategoryInitial());

  Future<void> fetchCategory() async {
    emit(CategoryFetchInitialState());
    final result = await fetchCategoryUseCase();
    result.fold((categoryList) {
      emit(CategoryFetchSuccessState(categoryList));
    }, (error) => emit(CategoryFetchFailedState(error.toString())));
  }
}
