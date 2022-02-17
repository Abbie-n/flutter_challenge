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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage.assetNetwork(
            image: image!,
            fit: BoxFit.cover,
            placeholder: Constants.empty,
            height: 163,
            width: 200,
          ),
        ),
        const YMargin(10),
        Styles.semiBold(
          title!,
          fontSize: 14,
          color: AppColors.white,
          maxLines: 2,
        ),
      ],
    );
  }
}
