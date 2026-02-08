import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import 'add_card_page.dart';
import 'success_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedMethod = 'Mastercard';
  bool hasMastercard = false;
  bool hasVisa = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF6F6F6),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.secondary,
                size: 16,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text(
          "Payment",
          style: TextStyle(
            color: AppColors.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            _buildMethodSelector(),
            const SizedBox(height: 32),
            Expanded(child: _buildSelectedMethodView()),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildMethodSelector() {
    final methods = [
      {'name': 'Cash', 'icon': Icons.money},
      {'name': 'Visa', 'icon': Icons.credit_card},
      {'name': 'Mastercard', 'icon': Icons.payment},
      {'name': 'PayPal', 'icon': Icons.account_balance_wallet_outlined},
    ];

    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: methods.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final method = methods[index];
          final isSelected = selectedMethod == method['name'];
          return GestureDetector(
            onTap: () =>
                setState(() => selectedMethod = method['name'] as String),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 90,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        method['icon'] as IconData,
                        color: isSelected ? AppColors.primary : AppColors.grey,
                        size: 24,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        method['name'] as String,
                        style: TextStyle(
                          fontSize: 12,
                          color: isSelected
                              ? AppColors.secondary
                              : AppColors.grey,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSelected)
                  Positioned(
                    top: -5,
                    right: -5,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFF8A00),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 10,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSelectedMethodView() {
    switch (selectedMethod) {
      case 'Mastercard':
        return _buildCardTypeView(
          'Mastercard',
          hasMastercard,
          'assets/images/placeholder_card.png',
        );
      case 'Visa':
        return _buildCardTypeView(
          'Visa',
          hasVisa,
          'assets/images/placeholder_card.png',
        );
      case 'Cash':
        return _buildInfoOverlay(
          "Cash Payment",
          "Pay in cash when you receive your order at your doorstep.",
          Icons.money,
        );
      case 'PayPal':
        return _buildInfoOverlay(
          "PayPal",
          "Fast and secure payment using your PayPal account.",
          Icons.account_balance_wallet_outlined,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildCardTypeView(String type, bool hasValue, String img) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 16),
        if (!hasValue) _buildEmptyCardState(type) else _buildCardDetails(type),
        const SizedBox(height: 24),
        _buildAddButton(type),
      ],
    );
  }

  Widget _buildEmptyCardState(String type) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Illustration of the card exactly like design
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 140,
                height: 90,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFB359), Color(0xFFFF8A00)],
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.payment, color: Colors.white, size: 40),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            "No $type added",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            "You can add a $type and save it for later",
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.grey, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildCardDetails(String type) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.payment, color: Colors.orange),
          ),
          const SizedBox(width: 16),
          const Text(
            "************ 436",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.secondary,
            ),
          ),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_down, color: AppColors.grey),
        ],
      ),
    );
  }

  Widget _buildInfoOverlay(String title, String desc, IconData icon) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 80, color: AppColors.primary),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 12),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.grey,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton(String type) {
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddCardPage()),
        );
        if (result == true) {
          setState(() {
            if (type == 'Mastercard') hasMastercard = true;
            if (type == 'Visa') hasVisa = true;
          });
        }
      },
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.primary, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add, color: AppColors.primary, size: 20),
            SizedBox(width: 8),
            Text(
              "ADD NEW",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "TOTAL: \$96",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SuccessPage()),
            ),
            child: const Text("PAY & CONFIRM"),
          ),
        ],
      ),
    );
  }
}
