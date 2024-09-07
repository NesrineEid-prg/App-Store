part of '../import_path/import_path.dart';

class ErrorText extends StatelessWidget {
  String error;
  ErrorText({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (Text(error)),
    );
  }
}
