import 'package:appstore/import_path/import_path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryServicesprovider = Provider(
    (ref) => CategoryServices(fireStore: ref.watch(firebaseFirestoreProvider)));
final getcategorieProvider = StreamProvider((ref) {
  final categoriesController = ref.watch(categoriesControllerProvider.notifier);
  return categoriesController.getCategories();
});

class CategoryServices {
  final FirebaseFirestore _fireStore;
  CategoryServices({required FirebaseFirestore fireStore})
      : _fireStore = fireStore;

  CollectionReference get _categorie =>
      _fireStore.collection(FirebaseConstant.categorie);
  Stream<List<Category>> getcategories() {
    return _categorie.snapshots().map((event) {
      List<Category> categorieList = [];
      for (var doc in event.docs) {
        categorieList.add(Category.fromMap(doc.data() as Map<String, dynamic>));
      }
      return categorieList;
    });
  }
}
