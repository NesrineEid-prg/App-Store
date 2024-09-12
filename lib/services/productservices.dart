part of '../import_path/import_path.dart';

final productServicesProvider = Provider((ref) {
  return ProductServices(
      firebaseFirestore: ref.watch(firebaseFirestoreProvider));
});

final getproductProvider = StreamProvider((ref) {
  final productcontroller = ref.watch(productControllerProvider.notifier);
  return productcontroller.getProducts();
});

class ProductServices {
  final FirebaseFirestore _fireStore;

  ProductServices({required FirebaseFirestore firebaseFirestore})
      : _fireStore = firebaseFirestore;

  CollectionReference get _products =>
      _fireStore.collection(FirebaseConstant.product);

  Stream<List<Productmodel>> getProducts() {
    return _products.snapshots().map((event) {
      List<Productmodel> products = [];
      for (var doc in event.docs) {
        products.add(Productmodel.fromMap(doc.data() as Map<String, dynamic>));
      }
      return products;
    });
  }

  Stream<Productmodel> getProductById(String productId) {
    return _products.doc(productId).snapshots().map((event) =>
        Productmodel.fromMap((event.data() as Map<String, dynamic>)));
  }

  Stream<List<Productmodel>> getProductbycategry(String categoryName) {
    return _products
        .where("categoryName", isEqualTo: categoryName)
        .snapshots()
        .map((event) {
      List<Productmodel> products = [];
      for (var doc in event.docs) {
        products.add(Productmodel.fromMap(doc.data() as Map<String, dynamic>));
      }
      return products;
    });
  }

  Stream<List<Productmodel>> getRealetedProduct(String category) {
    return _products
        .where("categoryName", isEqualTo: category)
        .snapshots()
        .map((event) {
      List<Productmodel> products = [];
      for (var doc in event.docs) {
        products.add(Productmodel.fromMap(doc.data() as Map<String, dynamic>));
      }
      return products;
    });
  }

  Stream<List<Productmodel>> searchProduct(String search) {
    return _products
        .orderBy('name')
        .startAt([search])
        .endAt(['$search\uff8ff'])
        .limit(10)
        .snapshots()
        .map((event) {
          List<Productmodel> products = [];
          for (var doc in event.docs) {
            products
                .add(Productmodel.fromMap(doc.data() as Map<String, dynamic>));
          }
          return products;
        });
  }
}
