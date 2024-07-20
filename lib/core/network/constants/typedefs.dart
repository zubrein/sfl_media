import 'package:dartz/dartz.dart';

typedef JsonMap = Map<String, dynamic>;
typedef JsonMapList = List<dynamic>;
typedef Result<T extends Object> = Either<T, String>;
typedef AsyncResult<T extends Object> = Future<Result<T>>;
