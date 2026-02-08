import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class FilterPopup extends StatefulWidget {
  const FilterPopup({super.key});

  @override
  State<FilterPopup> createState() => _FilterPopupState();
}

class _FilterPopupState extends State<FilterPopup> {
  String selectedOffer = 'Delivery';
  String selectedDeliverTime = '10-15 min';
  String selectedPricing = '\$\$';
  int selectedRating = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Filter your search",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, size: 20),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSection("OFFERS", [
            'Delivery',
            'Pick Up',
            'Offer',
            'Online payment',
          ]),
          const SizedBox(height: 24),
          _buildSection("DELIVER TIME", ['10-15 min', '20 min', '30 min']),
          const SizedBox(height: 24),
          _buildPricingSection(),
          const SizedBox(height: 24),
          _buildRatingSection(),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("FILTER"),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: options.map((opt) {
            final isSelected =
                (title == "OFFERS" && selectedOffer == opt) ||
                (title == "DELIVER TIME" && selectedDeliverTime == opt);
            return GestureDetector(
              onTap: () => setState(() {
                if (title == "OFFERS") selectedOffer = opt;
                if (title == "DELIVER TIME") selectedDeliverTime = opt;
              }),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : const Color(0xFFF2F2F2),
                  ),
                ),
                child: Text(
                  opt,
                  style: TextStyle(
                    color: isSelected ? Colors.white : AppColors.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildPricingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "PRICING",
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: ['\$', '\$\$', '\$\$\$'].map((p) {
            final isSelected = selectedPricing == p;
            return GestureDetector(
              onTap: () => setState(() => selectedPricing = p),
              child: Container(
                margin: const EdgeInsets.only(right: 16),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : const Color(0xFFF2F2F2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    p,
                    style: TextStyle(
                      color: isSelected ? Colors.white : AppColors.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildRatingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "RATING",
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () => setState(() => selectedRating = index + 1),
              child: Icon(
                index < selectedRating ? Icons.star : Icons.star_border,
                color: index < selectedRating
                    ? AppColors.primary
                    : AppColors.grey,
                size: 32,
              ),
            );
          }),
        ),
      ],
    );
  }
}
