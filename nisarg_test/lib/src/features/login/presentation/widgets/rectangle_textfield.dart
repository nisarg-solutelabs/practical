import 'package:flutter/material.dart';
import 'package:nisarg_test/src/core/extensions/context_extension.dart';
import 'package:nisarg_test/src/core/theme/dimensions.dart';

class RectangularInputTextField extends StatelessWidget {
  const RectangularInputTextField(
      {super.key,
      this.hintText,
      this.validator,
      this.onChanged,
      this.obscureText = false,
      this.suffixIcon,
      this.textEditingController,
      this.keyboardType,
      this.maxLines = 1,
      this.fillColor,
      this.filled,
      this.enabled,
      this.textCapitalization = TextCapitalization.none,
      this.prefix,
      this.focusNode,
      this.maxLength});
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final int maxLines;
  final Color? fillColor;
  final bool? filled;
  final bool? enabled;
  final Widget? prefix;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.m,
        ),
        child: TextFormField(
          obscureText: obscureText,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefix,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: context.colorScheme.primary, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      );
}
