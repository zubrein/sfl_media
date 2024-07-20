import 'dart:convert';

import 'package:sfl_media/core/network/constants/typedefs.dart';

abstract class BaseModel<T> {
  const BaseModel();

  JsonMap toJson();

  @override
  String toString() => json.encode(toJson());
}
