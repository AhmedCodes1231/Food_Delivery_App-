import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF2F2F2),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.secondary,
                size: 20,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text(
          "Security",
          style: TextStyle(
            color: AppColors.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildSecurityOption(
              Icons.lock_outline,
              "Change Password",
              "Update your account password",
            ),
            _buildSecurityOption(
              Icons.fingerprint,
              "Biometric Auth",
              "Enable Face ID or Touch ID",
            ),
            _buildSecurityOption(
              Icons.phonelink_setup,
              "Two-Factor Auth",
              "Add an extra layer of security",
            ),
            _buildSecurityOption(
              Icons.delete_outline,
              "Delete Account",
              "Permanently remove your data",
              isDanger: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityOption(
    IconData icon,
    String title,
    String subtitle, {
    bool isDanger = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isDanger ? Colors.red : AppColors.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isDanger ? Colors.red : AppColors.secondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(color: AppColors.grey, fontSize: 13),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: isDanger ? Colors.red.withOpacity(0.5) : AppColors.grey,
          ),
        ],
      ),
    );
  }
}
