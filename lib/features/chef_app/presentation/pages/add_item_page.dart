import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_colors.dart';

class AddItemPage extends StatelessWidget {
  const AddItemPage({super.key});

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
          "Add New Items",
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
              "RESET",
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
            _buildLabel("ITEM NAME"),
            _buildTextField("Mazalichiken Halim"),
            const SizedBox(height: 24),
            _buildLabel("UPLOAD PHOTO/VIDEO"),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(
                      0xFF9CA4AB,
                    ), // Matches the grey block in design
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(width: 16),
                _buildAddImageSlot(),
                const SizedBox(width: 16),
                _buildAddImageSlot(),
              ],
            ),
            const SizedBox(height: 24),
            _buildLabel("PRICE"),
            Row(
              children: [
                Expanded(child: _buildTextField("\$50")),
                const SizedBox(width: 24),
                _buildCheckbox("Pick up", true),
                const SizedBox(width: 16),
                _buildCheckbox("Delivery", false),
              ],
            ),
            const SizedBox(height: 24),
            _buildLabel(
              "INGRIDENTS",
            ), // Typo in design "INGRIDENTS", keeping user provided design text or correcting? Design says "INGRIDENTS". I'll stick to design text if strict, or correct it. User prompt said "INGRIDENTS" in the image. I'll correct to "INGREDIENTS" but keep layout. Actually, prompt said "ركز على ادق التفاصيل". The image spells it "INGRIDENTS". I will match the image to be safe.
            const SizedBox(height: 8),
            _buildSectionHeader("Basic"),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildIngredientItem("Salt", "assets/icons/Salt.svg", true),
                  const SizedBox(width: 16),
                  _buildIngredientItem(
                    "Chicken",
                    "assets/icons/Chicken.svg",
                    false,
                  ),
                  const SizedBox(width: 16),
                  _buildIngredientItem("Onion", "assets/icons/Onion.svg", true),
                  const SizedBox(width: 16),
                  _buildIngredientItem(
                    "Garlic",
                    "assets/icons/Garlic.svg",
                    false,
                  ),
                  const SizedBox(width: 16),
                  _buildIngredientItem(
                    "Pappers",
                    "assets/icons/Chili pepper.svg",
                    true,
                  ), // Image says Pappers
                  const SizedBox(width: 16),
                  _buildIngredientItem(
                    "Ginger",
                    "assets/icons/Ginger.svg",
                    false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionHeader("Fruit"),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildIngredientItem(
                    "Avocado",
                    "assets/icons/avocado.svg",
                    false,
                  ),
                  const SizedBox(width: 16),
                  _buildIngredientItem(
                    "Apple",
                    "assets/icons/apple.svg",
                    false,
                  ),
                  const SizedBox(width: 16),
                  _buildIngredientItem(
                    "Blueberry",
                    "assets/icons/blueberry.svg",
                    false,
                  ),
                  const SizedBox(width: 16),
                  _buildIngredientItem(
                    "Broccoli",
                    "assets/icons/broccoli.svg",
                    false,
                  ),
                  const SizedBox(width: 16),
                  _buildIngredientItem(
                    "Orange",
                    "",
                    false,
                    isMissing: true,
                  ), // Missing
                  const SizedBox(width: 16),
                  _buildIngredientItem(
                    "Walnut",
                    "assets/icons/walnut.svg",
                    false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildLabel("DETAILS"),
            _buildTextField(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Bibendum in vel, mattis et amet dui mauris turpis.",
              maxLines: 4,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "SAVE CHANGES",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.secondary,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.grey, fontSize: 13),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildAddImageSlot() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        // Dashed border is tricky without a package, simulating with dotted border or just a light border
        border: Border.all(
          color: Colors.grey.shade300,
          style: BorderStyle.solid,
        ), // Ideally dashed
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFFF0F0FA),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.cloud_upload_outlined,
              color: Color(0xFF7A7AFF),
              size: 20,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Add",
            style: TextStyle(color: AppColors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckbox(String label, bool isSelected) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.white,
            border: Border.all(
              color: isSelected
                  ? AppColors.primary
                  : AppColors.grey.withOpacity(0.3),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: isSelected
              ? const Center(
                  child: Icon(Icons.check, color: AppColors.primary, size: 14),
                )
              : null,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(color: AppColors.grey, fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String section) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          section,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.secondary,
          ),
        ),

        Row(
          children: const [
            Text(
              "See All",
              style: TextStyle(color: AppColors.grey, fontSize: 12),
            ),
            Icon(Icons.keyboard_arrow_down, color: AppColors.grey, size: 16),
          ],
        ),
      ],
    );
  }

  Widget _buildIngredientItem(
    String name,
    String assetPath,
    bool isSelected, {
    bool isMissing = false,
  }) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFFE1CE) : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: isMissing
              ? const Icon(Icons.broken_image, size: 20, color: AppColors.grey)
              : SvgPicture.asset(
                  assetPath,
                  color: isSelected ? AppColors.primary : null,
                ),
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(color: AppColors.grey, fontSize: 10)),
      ],
    );
  }
}
