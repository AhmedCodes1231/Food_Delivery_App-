import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'home_page.dart';

class AccessLocationPage extends StatelessWidget {
  const AccessLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Map Illustration
              // Map Illustration with image
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/location_access.png', // مسار الصورة
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  Icon(Icons.location_on, color: AppColors.primary, size: 80),
                ],
              ),

              /*Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE5D0),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Icon(Icons.location_on, color: AppColors.primary, size: 80),
                  // Animated or static map lines
                  ...List.generate(
                    4,
                    (index) => Positioned(
                      top: 50 * index.toDouble(),
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),*/
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("ACCESS LOCATION"),
                    SizedBox(width: 8),
                    Icon(Icons.location_on, size: 18),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "DFOOD WILL ACCESS YOUR LOCATION\nONLY WHILE USING THE APP",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
