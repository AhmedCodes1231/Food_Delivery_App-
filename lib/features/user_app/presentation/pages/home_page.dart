import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../data/models/home_models.dart';
import '../widgets/hurry_offers_popup.dart';
import 'restaurant_view.dart';
import 'profile_page.dart';
import 'order_history_page.dart';
import 'search_results_page.dart';
import 'cart_page.dart';
import 'notifications_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool isLoading = true;

  final List<Widget> _pages = [
    const HomeContentView(),
    const SearchResultsPage(),
    const OrderHistoryPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => isLoading = false);
        _showHurryOffers();
      }
    });
  }

  void _showHurryOffers() {
    showDialog(
      context: context,
      builder: (context) => const HurryOffersPopup(),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isWide = !ResponsiveHelper.isMobile(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          if (isWide) _buildNavigationRail(),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
      bottomNavigationBar: isWide ? null : _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: const Color(0xFFD3D1D8),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationRail() {
    return NavigationRail(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) => setState(() => _selectedIndex = index),
      labelType: NavigationRailLabelType.none,
      selectedIconTheme: const IconThemeData(color: AppColors.primary),
      unselectedIconTheme: const IconThemeData(color: AppColors.grey),
      backgroundColor: Colors.white,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home_outlined),
          label: Text("Home"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.search),
          label: Text("Search"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.notifications_outlined),
          label: Text("Orders"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person_outline),
          label: Text("Profile"),
        ),
      ],
    );
  }
}

class HomeContentView extends StatefulWidget {
  const HomeContentView({super.key});

  @override
  State<HomeContentView> createState() => _HomeContentViewState();
}

class _HomeContentViewState extends State<HomeContentView> {
  String selectedCategoryId = '1';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hey Halal, Good Afternoon!",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSearchBar(context),
                  const SizedBox(height: 32),
                  _buildCategoriesSection(),
                  const SizedBox(height: 32),
                  _buildOpenRestaurantsSection(),
                  const SizedBox(height: 80), // Bottom padding for nav bar
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationsPage(),
              ),
            ),
            child: Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                color: Color(0xFFECF0F4),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.menu,
                color: AppColors.secondary,
                size: 20,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "DELIVER TO",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: const [
                  Text(
                    "Halal Lab office",
                    style: TextStyle(color: Color(0xFF676767), fontSize: 14),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xFF676767),
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            ),
            child: Stack(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                    color: AppColors.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(
                        BorderSide(color: Colors.white, width: 1.5),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SearchResultsPage()),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: const [
            Icon(Icons.search, color: Color(0xFF676767), size: 24),
            SizedBox(width: 12),
            Text(
              "Search dishes, restaurants",
              style: TextStyle(color: Color(0xFF676767), fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "All Categories",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
              ),
            ),
            Row(
              children: [
                Text(
                  "See All",
                  style: TextStyle(color: Color(0xFF676767), fontSize: 14),
                ),
                Icon(Icons.chevron_right, size: 18, color: Color(0xFF676767)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 85, // Increased height to prevent shadow clipping
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ), // Add padding for shadows
            scrollDirection: Axis.horizontal,
            itemCount: mockCategories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) =>
                _buildCategoryItem(mockCategories[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(CategoryModel cat) {
    final isSelected = selectedCategoryId == cat.id;
    return GestureDetector(
      onTap: () => setState(() => selectedCategoryId = cat.id),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(6),
              child: Icon(
                cat.icon,
                color: isSelected
                    ? AppColors.primary
                    : AppColors.primary, // Changed color logic
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              cat.name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                color: isSelected ? Colors.white : AppColors.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOpenRestaurantsSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Open Restaurants",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
              ),
            ),
            Row(
              children: [
                Text(
                  "See All",
                  style: TextStyle(color: Color(0xFF676767), fontSize: 14),
                ),
                Icon(Icons.chevron_right, size: 18, color: Color(0xFF676767)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...mockRestaurants
            .map((res) => _buildRestaurantCard(context, res))
            .toList(),
      ],
    );
  }

  Widget _buildRestaurantCard(BuildContext context, RestaurantModel res) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RestaurantView(restaurant: res),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            20,
          ), // Rounded corners for the card itself if needed
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                res.imagePath,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              res.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              res.categories.join(" - "), // Use actual categories
              style: const TextStyle(color: Color(0xFF676767), fontSize: 14),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.star, color: AppColors.primary, size: 20),
                const SizedBox(width: 6),
                Text(
                  res.rating.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.secondary,
                  ),
                ),
                const SizedBox(width: 24),
                const Icon(
                  Icons.local_shipping_outlined,
                  color: AppColors.primary,
                  size: 20,
                ),
                const SizedBox(width: 6),
                const Text(
                  "Free",
                  style: TextStyle(color: Color(0xFF676767), fontSize: 14),
                ),
                const SizedBox(width: 24),
                const Icon(
                  Icons.access_time,
                  color: AppColors.primary,
                  size: 20,
                ),
                const SizedBox(width: 6),
                Text(
                  res.deliveryTime,
                  style: const TextStyle(
                    color: Color(0xFF676767),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
