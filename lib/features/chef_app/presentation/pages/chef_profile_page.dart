import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../auth/presentation/pages/role_selection_page.dart';
import 'withdrawal_page.dart';
import 'chef_orders_page.dart';
import 'chef_reviews_page.dart';
import '../widgets/chef_bottom_navigation.dart';
import 'add_item_page.dart';

class ChefProfilePage extends StatelessWidget {
  const ChefProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              children: [
                _buildProfileItem(
                  context,
                  Icons.person_outline,
                  "Personal Info",
                  null,
                ),
                _buildProfileItem(
                  context,
                  Icons.settings_outlined,
                  "Settings",
                  null,
                ),
                _buildProfileItem(
                  context,
                  Icons.history_outlined,
                  "Withdrawal History",
                  const WithdrawalPage(),
                ),
                _buildProfileItem(
                  context,
                  Icons.shopping_bag_outlined,
                  "Number of Orders",
                  const ChefOrdersPage(),
                  trailing: "29K",
                ),
                _buildProfileItem(
                  context,
                  Icons.star_outline,
                  "User Reviews",
                  const ChefReviewsPage(),
                ),
                _buildProfileItem(
                  context,
                  Icons.logout_outlined,
                  "Log Out",
                  null,
                  isLast: true,
                  customOnTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RoleSelectionPage(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const ChefBottomNavigation(selectedIndex: 3),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddItemPage()),
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 60, bottom: 40, left: 24, right: 24),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.secondary,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                "My Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text(
            "Available Balance",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 8),
          const Text(
            "\$500.00",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WithdrawalPage()),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: const Text(
              "Withdraw",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(
    BuildContext context,
    IconData icon,
    String title,
    Widget? target, {
    String? trailing,
    bool isLast = false,
    VoidCallback? customOnTap,
  }) {
    return GestureDetector(
      onTap:
          customOnTap ??
          () {
            if (target != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => target),
              );
            }
          },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isLast ? Colors.red : AppColors.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: isLast ? Colors.red : AppColors.secondary,
                ),
              ),
            ),
            if (trailing != null)
              Text(
                trailing,
                style: const TextStyle(color: AppColors.grey, fontSize: 14),
              )
            else
              Icon(Icons.chevron_right, color: AppColors.grey.withOpacity(0.5)),
          ],
        ),
      ),
    );
  }
}
