import 'package:flutter_challenge/shared/shared.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text,
    this.icon,
    this.buttonColor,
    this.function,
    this.hasIcon = false,
    this.hasText = false,
    this.textColor,
    this.fontSize,
    this.loading = false,
    this.height,
    this.width,
    this.verticalPadding = 0,
    this.horizontalPadding = 0,
  }) : super(key: key);

  final String? text;
  final String? icon;
  final Color? buttonColor;
  final void Function()? function;
  final bool? hasIcon;
  final bool? hasText;
  final Color? textColor;
  final double? fontSize;
  final bool loading;
  final double? height;
  final double? width;

  final double? verticalPadding;
  final double? horizontalPadding;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding!,
          horizontal: horizontalPadding!,
        ),
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.lightPurple,
          borderRadius: BorderRadius.circular(90),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (hasIcon!)
                Image.asset(
                  icon!,
                  scale: 3.5,
                ),
              if (hasText!)
                Styles.bold(
                  text!,
                  fontSize: 16,
                  color: textColor ?? AppColors.neutrals,
                ),
              hasIcon! ? const Spacer() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
