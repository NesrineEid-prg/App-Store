part of '../import_path/import_path.dart';

final authProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final autStateProvidr = StreamProvider<User?>((ref) {
  return ref.read(authProvider).authStateChange;
});
