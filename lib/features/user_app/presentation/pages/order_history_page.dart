import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/user_app/presentation/pages/home_page.dart';
import '../../../../core/constants/app_colors.dart';
import 'tracking_page.dart';
import 'order_detail_page.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

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
              color: Color(0xFFF6F6F6),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.secondary,
                size: 16,
              ),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }
              },
            ),
          ),
        ),
        title: const Text(
          "My Orders",
          style: TextStyle(
            color: AppColors.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Color(0xFFF6F6F6),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.more_horiz, color: AppColors.secondary),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          TabBar(
            controller: _tabController,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.grey,
            indicatorColor: AppColors.primary,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: "Ongoing"),
              Tab(text: "History"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [_buildOngoingList(), _buildHistoryList()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOngoingList() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildOrderItem("Pizza Hut", "#162432", 35.25, 3, "Ongoing"),
        _buildOrderItem("McDonald", "#242432", 40.15, 2, "Ongoing"),
        _buildOrderItem("Starbucks", "#240112", 10.20, 1, "Ongoing"),
      ],
    );
  }

  Widget _buildHistoryList() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildOrderItem("Pizza Hut", "#162432", 35.25, 3, "Completed"),
        _buildOrderItem("McDonald", "#242432", 40.15, 2, "Completed"),
        _buildOrderItem(
          "Starbucks",
          "#240112",
          10.20,
          1,
          "Canceled",
          isCanceled: true,
        ),
      ],
    );
  }

  Widget _buildOrderItem(
    String name,
    String id,
    double price,
    int items,
    String status, {
    bool isCanceled = false,
  }) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OrderDetailPage()),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=2070&auto=format&fit=crop',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            id,
                            style: const TextStyle(
                              color: AppColors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "\$$price • $items Items",
                        style: const TextStyle(
                          color: AppColors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (status == "Ongoing")
              Row(
                children: [
                  Expanded(
                    child: _buildButton(
                      "Track Order",
                      AppColors.primary,
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TrackingPage(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildButton(
                      "Cancel",
                      Colors.white,
                      () {},
                      isOutline: true,
                    ),
                  ),
                ],
              )
            else
              Row(
                children: [
                  Expanded(
                    child: _buildButton(
                      "Rate",
                      Colors.white,
                      () {},
                      isOutline: true,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildButton("Re-Order", AppColors.primary, () {}),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    String text,
    Color color,
    VoidCallback onTap, {
    bool isOutline = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: isOutline ? Colors.white : color,
          borderRadius: BorderRadius.circular(10),
          border: isOutline ? Border.all(color: AppColors.primary) : null,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isOutline ? AppColors.primary : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
