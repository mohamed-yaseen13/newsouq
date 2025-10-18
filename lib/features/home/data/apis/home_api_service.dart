import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsouq/core/constants/database_constants.dart';
import 'package:newsouq/features/home/data/models/product_model.dart';
import 'package:newsouq/features/home/data/models/products_response_model.dart';

class HomeApiService {
  final FirebaseFirestore firestore;

  HomeApiService({required this.firestore});

  Future<List<String>> getCategories() async {
    final snapshot = await firestore
        .collection(DatabaseConstants.merchantsCollection)
        .get();

    final Set<String> allCategories = {};

    for (var doc in snapshot.docs) {
      final data = doc.data();
      final List<dynamic>? categories =
          data[DatabaseConstants.categoriesCollection];
      if (categories != null) {
        allCategories.addAll(categories.cast<String>());
      }
    }

    return allCategories.toList();
  }

  QueryDocumentSnapshot? lastDocument;
  bool hasMore = true;

  Future<ProductsResponseModel> getProducts() async {
    final snapshot = await firestore
        .collectionGroup('products')
        .limit(25)
        .get();

    if (snapshot.docs.isNotEmpty) {
      lastDocument = snapshot.docs.last;
      hasMore = snapshot.docs.length == 25;
    } else {
      hasMore = false;
    }

    final products = snapshot.docs.map((doc) {
      final id = doc.reference.parent.parent!.id;
      return ProductModel.fromJson(doc.data()).copyWithId(id);
    }).toList();

    return ProductsResponseModel(products: products, hasMore: hasMore);
  }

  Future<ProductsResponseModel> getMoreProducts() async {
    if (lastDocument == null || !hasMore) {
      return ProductsResponseModel(products: [], hasMore: hasMore);
    }

    final snapshot = await firestore
        .collectionGroup('products')
        .startAfterDocument(lastDocument!)
        .limit(25)
        .get();

    if (snapshot.docs.isNotEmpty) {
      lastDocument = snapshot.docs.last;
      hasMore = snapshot.docs.length == 25;
    } else {
      hasMore = false;
    }

    final products = snapshot.docs.map((doc) {
      final id = doc.reference.parent.parent!.id;
      return ProductModel.fromJson(doc.data()).copyWithId(id);
    }).toList();

    return ProductsResponseModel(products: products, hasMore: hasMore);
  }

  Future<ProductsResponseModel> getProductsFromCategory(String category) async {
    final snapshot = await firestore
        .collectionGroup('products')
        .where('category', isEqualTo: category)
        .limit(25)
        .get();

    if (snapshot.docs.isEmpty) {
      return ProductsResponseModel(products: [], hasMore: false);
    }

    final products = snapshot.docs.map((doc) {
      final id = doc.reference.parent.parent!.id;

      return ProductModel.fromJson(doc.data()).copyWithId(id);
    }).toList();

    final hasMore = snapshot.docs.length == 25;

    return ProductsResponseModel(products: products, hasMore: hasMore);
  }

  //Future<ProductsResponseModel> getMoreProductsFromCategory(
  //  String category,
  //) async {
  //  if (lastDocument == null || !hasMore) {
  //    return ProductsResponseModel(products: [], hasMore: hasMore);
  //  }
  //
  //  final snapshot = await firestore
  //      .collectionGroup('products')
  //      .where('category', isEqualTo: category)
  //      .startAfterDocument(lastDocument!)
  //      .limit(10)
  //      .get();
  //
  //  if (snapshot.docs.isNotEmpty) {
  //    lastDocument = snapshot.docs.last;
  //    hasMore = snapshot.docs.length == 10;
  //  } else {
  //    hasMore = false;
  //  }
  //
  //  final products = snapshot.docs.map((doc) {
  //    final id = doc.reference.parent.parent!.id;
  //    return NewProductModel.fromJson(doc.data()).copyWithId(id);
  //  }).toList();
  //
  //  return ProductsResponseModel(products: products, hasMore: hasMore);
  //}
}
