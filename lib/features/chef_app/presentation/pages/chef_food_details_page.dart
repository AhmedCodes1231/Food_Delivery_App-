import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/chef_bottom_navigation.dart';
import 'add_item_page.dart';

class ChefFoodDetailsPage extends StatelessWidget {
  const ChefFoodDetailsPage({super.key});

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
          "Food Details",
          style: TextStyle(
            color: AppColors.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "EDIT",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=2080&auto=format&fit=crop',
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(bottom: 16, left: 16, child: _buildTag("Breakfast")),
                Positioned(bottom: 16, right: 16, child: _buildTag("Delivery")),
                Positioned(
                  bottom: 16,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildDot(false),
                      const SizedBox(width: 4),
                      _buildDot(true),
                      const SizedBox(width: 4),
                      _buildDot(false),
                      const SizedBox(width: 4),
                      _buildDot(false),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Chicken Thai Biriyani",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondary,
                  ),
                ),
                const Text(
                  "\$60",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color:
                        AppColors.secondary, // Design shows black not primary
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Color(0xFF9EA1B1),
                  size: 16,
                ), // Greyish icon
                const SizedBox(width: 4),
                const Text(
                  "Kentucky 39495",
                  style: TextStyle(color: Color(0xFF9EA1B1), fontSize: 13),
                ),
                const SizedBox(width: 24),
                const Icon(Icons.star, color: AppColors.primary, size: 16),
                const SizedBox(width: 4),
                const Text(
                  "4.9",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(width: 4),
                const Text(
                  "(10 Reviews)",
                  style: TextStyle(color: Color(0xFF9EA1B1), fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "INGRIDENTS",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 24,
              runSpacing: 16,
              children: [
                _buildIngredientItem("Salt", "assets/icons/Salt.svg", true),
                _buildIngredientItem(
                  "Chicken",
                  "assets/icons/Chicken.svg",
                  false,
                ),
                _buildIngredientItem(
                  "Onion",
                  "assets/icons/Onion.svg",
                  false,
                  subtitle: "(Alergy)",
                ),
                _buildIngredientItem(
                  "Garlic",
                  "assets/icons/Garlic.svg",
                  false,
                ),
                _buildIngredientItem(
                  "Pappers",
                  "assets/icons/Chili pepper.svg",
                  false,
                  subtitle: "(Alergy)",
                ),
                _buildIngredientItem(
                  "Ginger",
                  "assets/icons/Ginger.svg",
                  false,
                ),
                _buildIngredientItem(
                  "Broccoli",
                  "assets/icons/broccoli.svg",
                  false,
                ),
                _buildIngredientItem(
                  "Orange",
                  "",
                  false,
                  isMissing: true,
                ), // Missing
                _buildIngredientItem(
                  "Walnut",
                  "assets/icons/walnut.svg",
                  false,
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "Description",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis. Aliquam id lorem vel, mattis et amet dui mauris turpis.",
              style: TextStyle(
                color: Color(0xFF9EA1B1),
                fontSize: 13,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const ChefBottomNavigation(selectedIndex: 1),
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

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.secondary,
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: isActive ? 16 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildIngredientItem(
    String name,
    String assetPath,
    bool isSelected, {
    bool isMissing = false,
    String? subtitle,
  }) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFFFFE1CE)
                : const Color(
                    0xFFFFF0F0,
                  ), // Light background for all? Image shows light orange/pink circles
            shape: BoxShape.circle,
          ),
          child: isMissing
              ? const Icon(
                  Icons.broken_image,
                  size: 20,
                  color: AppColors.secondary,
                )
              : SvgPicture.asset(
                  assetPath,
                  color: AppColors.primary,
                ), // Icons seem to be orange outlined
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(color: Color(0xFF9EA1B1), fontSize: 12),
        ),
        if (subtitle != null)
          Text(
            subtitle,
            style: const TextStyle(color: Color(0xFF9EA1B1), fontSize: 8),
          ),
      ],
    );
  }
}
