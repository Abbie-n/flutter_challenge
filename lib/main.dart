import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_challenge/features/onboarding/pages/onboarding.dart';
import 'package:flutter_challenge/service_locator.dart' as sl;
import 'package:flutter_challenge/shared/shared.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();
  runApp(BlocProvider(
    create: (context) => sl.sl<HomeCubit>(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter challenge',
      theme: AppTheme.themeData,
      home: const OnboardingScreen(),
    );
  }
}
