part of '../import_path/import_path.dart';

final productControllerProvider =
    StateNotifierProvider<Productcontroller, bool>((ref) {
  final productServices = ref.watch(productServicesProvider);
  return Productcontroller(productServices: productServices, ref: ref);
});
final getRealetedProductprovider =
    StreamProviderFamily((ref, String categoryname) {
  return ref
      .watch(productControllerProvider.notifier)
      .getRealetedProductprovider(categoryname);
});
final getProductbycategry = StreamProviderFamily((ref, String categoryname) {
  return ref
      .watch(productControllerProvider.notifier)
      .getRealetedProductprovider(categoryname);
});

final getsearchProductProvider = StreamProviderFamily((ref, String search) {
  return ref.watch(productControllerProvider.notifier).searchProduct(search);
});

class Productcontroller extends StateNotifier<bool> {
  final ProductServices _productServices;
  final Ref _ref;

  Productcontroller(
      {required ProductServices productServices, required Ref ref})
      : _productServices = productServices,
        _ref = ref,
        super(false);

  Stream<List<Productmodel>> getProducts() {
    return _productServices.getProducts();
  }

  Stream<Productmodel> getProductById(String productId) {
    return _productServices.getProductById(productId);
  }

  Stream<List<Productmodel>> getRealetedProductprovider(String categoryname) {
    return _productServices.getRealetedProduct(categoryname);
  }

  Stream<List<Productmodel>> getProductbycategryprovider(String categoryname) {
    return _productServices.getProductbycategry(categoryname);
  }

  Stream<List<Productmodel>> searchProduct(String search) {
    return _productServices.searchProduct(search);
  }
}
