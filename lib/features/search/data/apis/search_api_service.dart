import 'package:dio/dio.dart';
import 'package:newsouq/core/api/api_constants.dart';
import 'package:newsouq/features/home/data/models/products_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'search_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SearchApiService {
  factory SearchApiService(Dio dio) = _SearchApiService;

  @GET(ApiConstants.products)
  Future<ProductsResponseModel> getProducts();
}
