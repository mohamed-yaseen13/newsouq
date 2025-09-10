import 'package:newsouq/core/api/api_error_model.dart';

sealed class ApiResult<T> {
  const ApiResult();
  factory ApiResult.success(T data) = Success<T>;
  factory ApiResult.failure(ApiErrorModel apiErrorModel) = Failure<T>;
}

class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  final ApiErrorModel apiErrorModel;
  const Failure(this.apiErrorModel);
}
