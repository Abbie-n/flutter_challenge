import 'package:flutter/material.dart';
import 'package:flutter_challenge/features/home/presentation/pages/home.dart';
import 'package:flutter_challenge/shared/shared.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({Key? key}) : super(key: key);

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  int index = 1;
  final int? minLength = 1;
  final int? maxLength = 3;

  void onNext() => setState(() {
        if (index < maxLength!) index++;
      });
  void onPrevious() => setState(() {
        if (index > minLength!) index--;
      });

  void jumpToLast() => setState(() {
        index = 3;
      });

  void navigateHome() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );

  final List<String> titles = [
    'Neque porro',
    'Quisquam est qui dolorem',
    'Ipsum quia dolor sit amet',
  ];

  final List<String> subtitles = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nisi velit, placerat et aliquet commodo, congue in risus.',
    'Duis tristique sapien non leo bibendum, nec viverra sem mollis',
    'Praesent vel accumsan augue. Praesent nec leo nulla.',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 54,
        ),
        Positioned(
          bottom: 0,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Styles.bold(
                  titles[index - 1],
                  fontSize: 40,
                  textAlign: TextAlign.center,
                ),
              ),
              const YMargin(12),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 31),
                  child: Styles.regular(
                    subtitles[index - 1],
                    fontSize: 16,
                    color: AppColors.minTextColor,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const YMargin(73),
              if (index < maxLength!)
                Container(
                  width: 154,
                  height: 64,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 110),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.darkPurple,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => onPrevious(),
                        child: Image.asset(
                          Constants.leftIcon,
                          scale: 3.5,
                          color: index == 1 ? AppColors.purple : null,
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.purple,
                        ),
                      ),
                      InkWell(
                        onTap: () => onNext(),
                        child: Image.asset(
                          Constants.rightIcon,
                          scale: 3.5,
                          color: index == 3 ? AppColors.purple : null,
                        ),
                      ),
                    ],
                  ),
                )
              else
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 110),
                  child: CustomButton(
                    fontSize: 18,
                    function: () => navigateHome(),
                    hasText: true,
                    height: 56,
                    width: 92,
                    text: 'Start',
                    buttonColor: AppColors.white,
                    textColor: AppColors.primaryColor,
                    horizontalPadding: 14,
                  ),
                ),
            ],
          ),
        ),
        ListView(
          shrinkWrap: true,
          children: [
            const YMargin(30),
            Image.asset('${Constants.bgIcon}$index'.toPng),
          ],
        ),
        Positioned(
          top: 0,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 44,
              right: 24,
              left: 24,
            ),
            child: Row(
              children: [
                if (index < maxLength!)
                  CustomButton(
                    fontSize: 16,
                    function: () => jumpToLast(),
                    hasText: true,
                    height: 32,
                    text: 'Skip',
                    buttonColor: AppColors.lightPurple,
                    horizontalPadding: 14,
                  ),
                const Spacer(),
                Column(
                  children: [
                    if (index == maxLength!) const YMargin(12),
                    CustomIndicator(
                      index: index - 1,
                      length: maxLength,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
