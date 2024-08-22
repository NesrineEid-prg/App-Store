part of '../import_path/import_path.dart';

class AuthChec extends ConsumerWidget {
  const AuthChec({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(autStateProvidr);
    return authState.when(
        data: (data) {
          if (data != null) {
            return const HomePage();
          } else {
            return const SignIn();
          }
        },
        error: (e, trace) => ErrorSreen(
              e: e,
              trace: trace,
            ),
        loading: () => const LoadingScreen());
  }
}
