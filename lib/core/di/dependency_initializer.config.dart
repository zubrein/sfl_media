// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sfl_media/core/logger.dart' as _i6;
import 'package:sfl_media/core/network/client/client_provider.dart' as _i13;
import 'package:sfl_media/features/category/data/api/category_api.dart' as _i8;
import 'package:sfl_media/features/category/domain/repositories/category_repository.dart'
    as _i5;
import 'package:sfl_media/features/category/domain/usecases/fetch_category_usecase.dart'
    as _i4;
import 'package:sfl_media/features/home/data/api/news_api.dart' as _i7;
import 'package:sfl_media/features/home/data/repositories/home_repository_impl.dart'
    as _i10;
import 'package:sfl_media/features/home/domain/repositories/home_repository.dart'
    as _i9;
import 'package:sfl_media/features/home/domain/usecases/fetch_news_usecase.dart'
    as _i11;
import 'package:sfl_media/features/home/ui/cubit/home_cubit.dart' as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioClientProvider = _$DioClientProvider();
    gh.factory<_i3.Dio>(() => dioClientProvider.dioClientProvider());
    gh.factory<_i4.FetchCategoryUseCase>(() =>
        _i4.FetchCategoryUseCase(repository: gh<_i5.CategoryRepository>()));
    gh.singleton<_i6.Log>(() => _i6.Log());
    gh.factory<_i7.NewsApi>(() => _i7.NewsApi(gh<_i3.Dio>()));
    gh.factory<_i8.CategoryApi>(() => _i8.CategoryApi(gh<_i3.Dio>()));
    gh.factory<_i9.HomeRepository>(
        () => _i10.HomeRepositoryImpl(gh<_i7.NewsApi>()));
    gh.factory<_i11.FetchNewsUseCase>(
        () => _i11.FetchNewsUseCase(repository: gh<_i9.HomeRepository>()));
    gh.factory<_i12.HomeCubit>(
        () => _i12.HomeCubit(gh<_i11.FetchNewsUseCase>()));
    return this;
  }
}

class _$DioClientProvider extends _i13.DioClientProvider {}
