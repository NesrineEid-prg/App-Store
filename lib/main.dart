import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'import_path/import_path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyClO8tff41N-JNBli1vYUT3n93GDsR428g",
    authDomain: "appstore-52b5c.firebaseapp.com",
    databaseURL: "https://appstore-52b5c-default-rtdb.firebaseio.com",
    projectId: "appstore-52b5c",
    storageBucket: "appstore-52b5c.appspot.com",
    messagingSenderId: "403188129235",
    appId: '1:403188129235:android:5fd5a1d8dcece693d2a326',
  ));

  runApp(const ProviderScope(child: MyApp()));
}

final firebaseinitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return Firebase.initializeApp();
});

// app@gmail.com
// app123
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inialize = ref.watch(firebaseinitializerProvider);
    return MaterialApp(
        title: 'Store App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SignIn()
//          inialize.when(
//             data: (data) {
//               return const AuthChec();
//             },
//             error: (e, stackTrace) => ErrorSreen(
//                   e: e,
//                   trace: stackTrace,
//                 ),
//             loading: () => const LoadingScreen()));
        );
  }
}
