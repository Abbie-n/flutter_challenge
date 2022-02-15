import 'package:flutter/material.dart';
import 'package:flutter_challenge/shared/colors.dart';

class CustomIndicator extends StatelessWidget {
  final int? index;
  final int? length;

  const CustomIndicator({
    Key? key,
    this.index,
    this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildPageIndicator(length!, index!),
    );
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 150),
      height: 4,
      width: isActive ? 24 : 12,
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        shape: BoxShape.rectangle,
        color: isActive ? AppColors.white : AppColors.neutrals.withOpacity(0.5),
      ),
    );
  }

  List<Widget> _buildPageIndicator(int length, int index) {
    List<Widget> list = [];
    for (int i = 0; i < length; i++) {
      list.add(i == index ? indicator(true) : indicator(false));
    }
    return list;
  }
}
