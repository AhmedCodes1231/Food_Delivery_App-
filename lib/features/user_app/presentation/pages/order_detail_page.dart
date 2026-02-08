import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key});

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
          "Order Details",
          style: TextStyle(
            color: AppColors.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Status Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.local_shipping,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Delivered",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Your order has been delivered",
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            const Text(
              "ORDER ITEMS",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 16),
            _buildOrderItem("Burger with Cheese", "1x", "\$15"),
            _buildOrderItem("French Fries", "1x", "\$10"),
            _buildOrderItem("Coca Cola", "1x", "\$7"),

            const Divider(height: 48),

            const Text(
              "DELIVERY ADDRESS",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "242 ST Marks Ave, Brooklyn, NY 11238, USA",
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 14,
                height: 1.5,
              ),
            ),

            const Divider(height: 48),

            const Text(
              "PAYMENT METHOD",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Icon(Icons.credit_card, color: AppColors.primary, size: 20),
                SizedBox(width: 12),
                Text(
                  "Visa **** 1234",
                  style: TextStyle(color: AppColors.grey, fontSize: 14),
                ),
              ],
            ),

            const Divider(height: 48),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Total Payment",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondary,
                  ),
                ),
                Text(
                  "\$32",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: () {}, child: const Text("ORDER AGAIN")),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(String name, String qty, String price) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$qty $name",
            style: const TextStyle(color: AppColors.grey, fontSize: 14),
          ),
          Text(
            price,
            style: const TextStyle(
              color: AppColors.secondary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
