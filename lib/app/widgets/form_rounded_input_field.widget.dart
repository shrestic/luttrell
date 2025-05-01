import 'package:flutter/material.dart';
import 'package:luttrell/app/theme/theme.dart';

class FormRoundedInputField extends StatelessWidget {
  const FormRoundedInputField({
    super.key,
    this.controller,
    this.initialValue,
    this.style,
    this.fillColor,
    this.iconPrefix,
    this.suffixIcon,
    this.labelText,
    this.hintText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.errorStyle,
    this.radius = 10,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 10),
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.labelInput = '',
    this.required = true,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final IconData? iconPrefix;
  final IconData? suffixIcon;
  final TextStyle? style;
  final Color? fillColor;
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final double radius;
  final EdgeInsetsGeometry contentPadding;
  final TextStyle? errorStyle;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(String)? onFieldSubmitted;
  final bool readOnly;
  final String labelInput;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Text(labelInput), if (required) const Text('*', style: TextStyle(color: kErrorColor))],
        ),
        const SizedBox(height: 5),
        TextFormField(
          key: key,
          controller: controller,
          initialValue: initialValue,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            errorStyle: errorStyle,
            contentPadding: contentPadding,
            prefixIcon: iconPrefix != null ? Icon(iconPrefix, size: 20) : null,
            suffixIcon: suffixIcon != null ? Icon(suffixIcon, size: 17) : null,
            filled: true,
            fillColor: fillColor ?? kLightBackground,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kErrorColor),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kErrorColor),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
            ),
          ),
          keyboardType: keyboardType,
          style: style,
          readOnly: readOnly,
          obscureText: obscureText,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          validator: validator,
        ),
      ],
    );
  }
}
