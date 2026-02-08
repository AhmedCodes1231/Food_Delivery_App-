import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../pages/notifications_page.dart';
import '../pages/my_food_list_page.dart';
import '../pages/chef_profile_page.dart';
import '../pages/chef_dashboard.dart';

class ChefBottomNavigation extends StatelessWidget {
  final int selectedIndex;

  const ChefBottomNavigation({super.key, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(context, Icons.grid_view_rounded, 0, () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const ChefDashboard()),
                (route) => false,
              );
            }),
            _buildNavItem(context, Icons.list_alt_rounded, 1, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyFoodListPage()),
              );
            }),
            const SizedBox(width: 40), // Space for FAB
            _buildNavItem(context, Icons.notifications_none_rounded, 2, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsPage(),
                ),
              );
            }),
            _buildNavItem(context, Icons.person_outline_rounded, 3, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChefProfilePage(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    int index,
    VoidCallback onTap,
  ) {
    final isSelected = selectedIndex == index;
    return IconButton(
      icon: Icon(icon, color: isSelected ? AppColors.primary : AppColors.grey),
      onPressed: isSelected ? null : onTap,
    );
  }
}
