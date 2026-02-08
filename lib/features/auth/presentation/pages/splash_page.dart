import 'package:flutter/material.dart';
import 'onboarding_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(const Duration(seconds: 5));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top Left Pattern (Splash Page_02)
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              'assets/icons/splash_page_01.svg',
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),

          // Bottom Right Pattern (Splash Page_01)
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/icons/splash_page_02.svg',
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ),

          // App Logo
          Center(child: SvgPicture.asset('assets/icons/Logo.svg', width: 180)),
        ],
      ),
    );
  }
}
