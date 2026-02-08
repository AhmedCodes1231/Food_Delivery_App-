import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'withdrawal_page.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

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
          "Wallet",
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
            // Balance Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: const [
                  Text(
                    "Total Balance",
                    style: TextStyle(color: AppColors.grey, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "\$12,450",
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // Withdraw Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WithdrawalPage(),
                  ),
                );
              },
              child: const Text("WITHDRAW"),
            ),

            const SizedBox(height: 48),

            // Recent Transactions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Recent Transactions",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("See All >", style: TextStyle(color: AppColors.grey)),
              ],
            ),
            const SizedBox(height: 24),
            _buildTransactionItem(
              "Withdraw",
              "Today, 10:00 AM",
              "-\$500",
              Colors.red,
            ),
            _buildTransactionItem(
              "Received",
              "Yesterday, 06:30 PM",
              "+\$150",
              Colors.green,
            ),
            _buildTransactionItem(
              "Withdraw",
              "25 Jan, 09:15 AM",
              "-\$200",
              Colors.red,
            ),
            _buildTransactionItem(
              "Received",
              "24 Jan, 04:20 PM",
              "+\$80",
              Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem(
    String title,
    String subtitle,
    String amount,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              title == "Withdraw" ? Icons.arrow_outward : Icons.arrow_downward,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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
          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
