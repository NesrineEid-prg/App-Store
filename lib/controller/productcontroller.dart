part of '../import_path/import_path.dart';

final ProductControllerProvider =
    StateNotifierProvider<Productcontroller, bool>((ref) {
  final ProductServices = ref.watch(ProductServicesProvider);
  return Productcontroller(productServices: ProductServices, ref: ref);
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

  Stream<Productmodel> getProductById(String ProductId) {
    return _productServices.getProductById(ProductId);
  }
}
