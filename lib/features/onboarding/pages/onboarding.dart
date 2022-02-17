import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/features/onboarding/widgets/onboarding_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: OnboardingWidget(),
      ),
    );
  }
}
