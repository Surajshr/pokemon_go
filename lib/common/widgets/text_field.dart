import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_go/common/ui/text_styles.dart';

import '../ui/app_color.dart';

class PokemonTextField extends StatelessWidget {
  const PokemonTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.labelText,
    this.errorText,
    this.suffixIcon,
    this.keyBoardType,
    this.borderColor,
    this.obscureText: false,
    this.minLines: 1,
    this.labelTextStyle,
    this.focusNode,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.readOnly,
    this.onTap,
    this.fillColor,
    this.scrollController,
  });

  final TextEditingController? controller;
  final ScrollController? scrollController;
  final bool obscureText;
  final Function(String latestString)? onChanged;
  final String? labelText;
  final String? errorText;
  final Widget? suffixIcon;
  final TextInputType? keyBoardType;
  final TextStyle? labelTextStyle;
  final Color? borderColor;
  final int minLines;
  final FocusNode? focusNode;
  final Function(dynamic value)? onFieldSubmitted;
  final Function()? onTap;
  final bool? readOnly;
  final Widget? prefixIcon;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final maxLines = minLines;
    return TextFormField(
      scrollController: scrollController,
      onTap: onTap,
      controller: controller,
      keyboardType: keyBoardType,
      obscureText: obscureText,
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      style: TextStyles.labelLarge,
      minLines: minLines,
      maxLines: maxLines,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        fillColor: fillColor,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: borderColor ?? ColorAssets.primary,
            width: .5,
          ),
        ),
        labelText: labelText,
        labelStyle: labelTextStyle ?? TextStyles.labelSmall,
        errorText: errorText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: borderColor ?? ColorAssets.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: ColorAssets.error),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: ColorAssets.disabledContainer,
            width: .5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: ColorAssets.primary),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: ColorAssets.error,
            width: 2,
          ),
        ),
        errorStyle: TextStyles.labelMedium.copyWith(
          color: ColorAssets.error,
          letterSpacing: 0.1,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 16.w,
        ),
      ),
    );
  }
}