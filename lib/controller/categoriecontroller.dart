part of '../import_path/import_path.dart';

final categoriesControllerProvider =
    StateNotifierProvider<CategoriesController, bool>((ref) {
  final categoriesServices = ref.watch(categoryServicesprovider);
  return CategoriesController(categoryServices: categoriesServices, ref: ref);
});
final getcategorieProvider = StreamProvider((ref) {
  final categoriesController = ref.watch(categoriesControllerProvider.notifier);
  return categoriesController.getCategories();
});

class CategoriesController extends StateNotifier<bool> {
  final CategoryServices _categoryServices;
  final Ref _ref;
  CategoriesController(
      {required CategoryServices categoryServices, required Ref ref})
      : _categoryServices = categoryServices,
        _ref = ref,
        super(false);

  Stream<List<Category>> getCategories() {
    return _categoryServices.getcategories();
  }
}
