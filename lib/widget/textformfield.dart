part of '../import_path/import_path.dart';

class TextForm extends StatefulWidget {
  final String? hint;
  final void Function(String)? change;
  final String? Function(String?)? vali;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  const TextForm(
      {super.key,
      this.change,
      this.hint,
      this.prefixIcon,
      this.suffixIcon,
      this.textInputType,
      this.vali});

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enableSuggestions: true,
        keyboardType: widget.textInputType,
        onChanged: widget.change,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Colors.black),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            alignLabelWithHint: true),
        validator: widget.vali);
  }
}
