import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscure;
  final bool showToggle;
  final String? Function(String?)? validator;

  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscure = false,
    this.showToggle = false,
    this.validator,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AuthFieldState createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator != null
          ? (value) => widget.validator!(value)
          : (value) {
              if (value!.isEmpty) {
                return '${widget.hintText} is missing';
              }
              return null;
            },
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.hintText,
        suffixIcon: widget.showToggle
            ? InkWell(
                onTap: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
                child: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
      ),
      obscureText: _isObscured,
    );
  }
}
