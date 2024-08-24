import 'package:flutter/material.dart';
import 'package:rider_app/values/colors.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.onChanged,
    required this.hintText,
    this.keyboardType,
    this.initialValue,
    this.controller,
    this.readOnly = false,
    this.hasError = false,
    this.isRequired = false,
    this.maxLength,
    this.validator,
    this.isLast = false,
    this.isFirst = false,
    this.obscureText = false,
    this.changePasswordVisibility,
    this.passwordVisible = false,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.onTap,
  }) : super(key: key);

  final String hintText;
  final Function onChanged;
  final TextInputType? keyboardType;
  final String? initialValue;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool readOnly;
  final bool hasError;
  final bool isRequired;
  final int? maxLength;
  final bool isLast;
  final bool isFirst;
  final bool obscureText;
  final bool passwordVisible;
  final Function? changePasswordVisibility;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final Color? fillColor;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: width * 1,
          child: TextFormField(
            maxLength: maxLength,
            onTap: onTap as void Function()?,
            cursorColor: AppColors.primaryColor,
            controller: controller,
            readOnly: readOnly,
            initialValue: initialValue,
            keyboardType: keyboardType ?? TextInputType.text,
            obscureText: obscureText ? !passwordVisible : false,
            onChanged: (value) => onChanged(value),
            decoration: InputDecoration(
              fillColor: fillColor ?? AppColors.white,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: hasError ? AppColors.error : AppColors.fieldGray,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: hasError ? AppColors.error : AppColors.fieldGray,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(
                  color: hasError ? AppColors.error : AppColors.fieldGray,
                ),
              ),
              isDense: true,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: AppColors.gray,
                fontSize: 16,
              ),
              suffixIcon: suffixIcon ??
                  (obscureText
                      ? IconButton(
                          onPressed: () {
                            changePasswordVisibility!();
                          },
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        )
                      : null),
              prefixIcon: prefixIcon != null ? prefixIcon : null,
            ),
          ),
        ),
      ],
    );
  }
}
