import 'package:dio/dio.dart';
import 'package:newsouq/core/api/api_constants.dart';
import 'package:newsouq/features/home/data/models/category_model.dart';
import 'package:newsouq/features/home/data/models/products_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(ApiConstants.categories)
  Future<List<CategoryModel>> getCategories();

  @GET("${ApiConstants.category}/{categoryName}")
  Future<ProductsResponseModel> getProductsFromCategory(
    @Path() String categoryName,
  );
}
