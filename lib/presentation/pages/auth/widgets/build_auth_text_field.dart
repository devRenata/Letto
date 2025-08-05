import 'package:flutter/material.dart';
import '../../../themes/app_colors.dart';

class BuildAuthTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final bool enabled;
  final bool obscureText;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final Widget? suffixIcon;

  const BuildAuthTextField({
    super.key,
    this.obscureText = false,
    required this.controller,
    required this.labelText,
    required this.enabled,
    this.hintText,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  State<BuildAuthTextField> createState() => _BuildAuthTextFieldState();
}

class _BuildAuthTextFieldState extends State<BuildAuthTextField> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.085,
      child: TextFormField(
        obscureText: widget.obscureText,
        enabled: widget.enabled,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        keyboardAppearance: Brightness.light,
        decoration: InputDecoration(
          prefix: widget.prefixIcon != null
              ? Icon(
                  widget.prefixIcon,
                  color: AppColors.lightGray,
                  size: 18,
                )
              : null,
          labelText: widget.labelText,
          hintText: widget.prefixIcon != null
              ? '  ${widget.hintText}'
              : widget.hintText,
          errorStyle: const TextStyle(color: AppColors.error),
        ),
      ),
    );
  }
}
