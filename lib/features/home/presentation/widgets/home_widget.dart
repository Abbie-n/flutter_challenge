import 'package:flutter/material.dart';
import 'package:flutter_challenge/shared/shared.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
    this.image,
    this.title,
  }) : super(key: key);

  final String? image;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 163,
          width: 163,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(image!),
            ),
          ),
        ),
        const YMargin(10),
        Styles.semiBold(
          title!,
          fontSize: 14,
          color: AppColors.white,
        ),
      ],
    );
  }
}
