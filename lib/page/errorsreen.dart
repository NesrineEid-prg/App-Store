part of '../import_path/import_path.dart';

class ErrorText extends StatefulWidget {
  final String error;
  const ErrorText({super.key, required this.error});

  @override
  State<ErrorText> createState() => _ErrorTeextState();
}

class _ErrorTeextState extends State<ErrorText> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: (Text(widget.error)),
    );
  }
}
