part of '../import_path/import_path.dart';

final ProductServicesProvider = Provider((ref) {
  return ProductServices(
      firebaseFirestore: ref.watch(firebaseFirestoreProvider));
});

final getproductProvider = StreamProvider((ref) {
  final Productcontroller = ref.watch(ProductControllerProvider.notifier);
  return Productcontroller.getProducts();
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
}
