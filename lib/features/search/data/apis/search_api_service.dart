import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsouq/features/home/data/models/product_model.dart';
import 'package:newsouq/features/home/data/models/products_response_model.dart';

class SearchApiService {
  final FirebaseFirestore firestore;

  SearchApiService({required this.firestore});

  Future<ProductsResponseModel> getProducts() async {
    final snapshot = await firestore.collectionGroup('products').get();

    final products = snapshot.docs.map((doc) {
      final id = doc.reference.parent.parent!.id;
      return ProductModel.fromJson(doc.data()).copyWithId(id);
    }).toList();

    return ProductsResponseModel(products: products, hasMore: false);
  }
}
