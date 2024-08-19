import 'package:flutter/material.dart';
import 'package:rider_app/values/colors.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({
    Key? key,
    required this.onTap,
    required this.btnText,
    this.color,
    this.border,
    this.textStyle,
    this.customHeight,
    this.customWidth,
    this.icon,
    this.loading = false,
    this.loadingText = '',
    this.disabled = false,
    this.borderRadius,
  }) : super(key: key);

  final Function onTap;
  final String btnText;
  final String loadingText;
  final Color? color;
  final BoxBorder? border;
  final TextStyle? textStyle;
  final double? customHeight;
  final double? customWidth;
  final Widget? icon;
  final bool loading;
  final bool disabled;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.primaryColor.withOpacity(0.5),
      onTap: disabled ? () {} : () => onTap(),
      child: Container(
        height: customHeight ?? 54,
        width: customWidth,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: disabled ? color!.withOpacity(.5) : color,
          borderRadius: borderRadius ?? BorderRadius.circular(4.0),
          border: border ?? Border.all(color: AppColors.primaryColor),
        ),
        child: loading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    loadingText,
                    style: textStyle ?? TextStyle(color: AppColors.white),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: AppColors.secondary,
                      strokeWidth: 3,
                    ),
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon ?? Container(),
                  Text(
                    btnText,
                    style: textStyle ?? TextStyle(color: AppColors.white),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
      ),
    );
  }
}
