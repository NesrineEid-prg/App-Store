part of '../import_path/import_path.dart';

final firebaseFirestoreProvider = Provider((ref) => FirebaseFirestore.instance);
 final firebaseAuthProvider =  Provider((ref) => FirebaseAuth.instance);
 final firebaseStorageProvider = Provider((ref) => FirebaseStorage.instance);