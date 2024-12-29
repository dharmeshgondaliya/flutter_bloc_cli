import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    this.height = 40,
    this.width = double.infinity,
    this.autofocus = false,
    this.controller,
    this.enabled,
    this.focusNode,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.maxLines,
    this.minLines = 1,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,
    this.readOnly = false,
    this.style,
    this.textInputAction,
    this.validator,
    this.fillColor,
    this.errorStyle,
    this.hintStyle,
    this.hintText,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.textFieldErrorborder,
    this.textFieldborder,
  });
  final double width;
  final double height;
  final bool autofocus;
  final TextEditingController? controller;
  final bool? enabled;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int minLines;
  final int? maxLines;
  final int? maxLength;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final void Function(String?)? onSaved;
  final void Function(String)? onFieldSubmitted;
  final bool readOnly;
  final TextStyle? style;
  final TextStyle? errorStyle;
  final TextStyle? hintStyle;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final String? hintText;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final InputBorder? textFieldborder;
  final InputBorder? textFieldErrorborder;

  final InputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: Colors.black54, width: 0.8),
  );
  final InputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: Colors.red, width: 0.8),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        autofocus: autofocus,
        controller: controller,
        cursorColor: Theme.of(context).colorScheme.primary,
        enabled: enabled,
        focusNode: focusNode,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        maxLength: maxLength,
        maxLines: maxLines,
        minLines: minLines,
        obscureText: obscureText,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onSaved: onSaved,
        onFieldSubmitted: onFieldSubmitted,
        onTap: onTap,
        readOnly: readOnly,
        style: style,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: textInputAction,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          counterText: "",
          errorStyle: errorStyle,
          fillColor: fillColor,
          filled: false,
          hintStyle: hintStyle,
          hintText: hintText,
          prefix: prefix,
          prefixIcon: prefixIcon,
          suffix: suffix,
          suffixIcon: suffixIcon,
          border: textFieldborder ?? border,
          enabledBorder: textFieldborder ?? border,
          focusedBorder: textFieldborder ?? border,
          disabledBorder: textFieldborder ?? border,
          errorBorder: textFieldErrorborder ?? errorBorder,
          focusedErrorBorder: textFieldErrorborder ?? errorBorder,
        ),
      ),
    );
  }
}