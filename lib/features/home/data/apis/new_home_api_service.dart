import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsouq/features/home/data/models/new_product_model.dart';
import 'package:newsouq/features/home/data/models/products_response_model.dart';

class NewHomeApiService {
  NewHomeApiService();

  QueryDocumentSnapshot? lastDocument;
  bool hasMore = true;

  Future<ProductsResponseModel> getProducts() async {
    final snapshot = await FirebaseFirestore.instance
        .collectionGroup('products')
        .limit(10)
        .get();

    if (snapshot.docs.isNotEmpty) {
      lastDocument = snapshot.docs.last;
      hasMore = snapshot.docs.length == 10;
    } else {
      hasMore = false;
    }

    final products = snapshot.docs.map((doc) {
      final id = doc.reference.parent.parent!.id;
      return NewProductModel.fromJson(doc.data()).copyWithId(id);
    }).toList();

    return ProductsResponseModel(products: products, hasMore: hasMore);
  }

  Future<ProductsResponseModel> getMoreProducts() async {
    if (lastDocument == null || !hasMore) {
      return ProductsResponseModel(products: [], hasMore: hasMore);
    }

    final snapshot = await FirebaseFirestore.instance
        .collectionGroup('products')
        .startAfterDocument(lastDocument!)
        .limit(10)
        .get();

    if (snapshot.docs.isNotEmpty) {
      lastDocument = snapshot.docs.last;
      hasMore = snapshot.docs.length == 10;
    } else {
      hasMore = false;
    }

    final products = snapshot.docs.map((doc) {
      final id = doc.reference.parent.parent!.id;
      return NewProductModel.fromJson(doc.data()).copyWithId(id);
    }).toList();

    return ProductsResponseModel(products: products, hasMore: hasMore);
  }
}
