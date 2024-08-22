part of '../import_path/import_path.dart';

class ErrorSreen extends StatelessWidget {
  final Object e;
  final StackTrace? trace;
  const ErrorSreen({super.key, required this.e, this.trace});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(e.toString()),
          Text(trace.toString()),
        ],
      ),
    );
  }
}
