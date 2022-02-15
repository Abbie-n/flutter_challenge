import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/features/onboarding/presentation/widgets/onboarding_widget.dart';
import 'package:flutter_challenge/shared/shared.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: OnboardingWidget(),
      ),
    );
  }
}
