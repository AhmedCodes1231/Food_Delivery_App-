import 'package:flutter/material.dart';
import '../../data/models/home_models.dart';
import 'cart_page.dart';

class FoodDetailPage extends StatefulWidget {
  final RestaurantModel restaurant;

  const FoodDetailPage({super.key, required this.restaurant});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  String selectedSize = '14"';
  int quantity = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  _buildRestaurantPill(),
                  const SizedBox(height: 24),
                  const Text(
                    "Pizza Calzone European",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF181C2E), // اللون الداكن من التصميم
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Prosciutto e funghi is a pizza variety that is topped with tomato sauce.",
                    style: TextStyle(
                      color: Color(0xFFA0A5BA), // اللون الرمادي الفاتح للنص
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildStatsRow(),
                  const SizedBox(height: 32),
                  _buildSizeSelector(),
                  const SizedBox(height: 32),
                  const Text(
                    "INGRIDENTS", // بنفس التهجئة في التصميم
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF323643),
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildIngredientsList(),
                  const SizedBox(height: 140), // مساحة إضافية للسحب أسفل الشاشة
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: _buildBottomActionBar(),
    );
  }

  Widget _buildImageHeader() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // الحاوية البرتقالية المنحنية
        Container(
          height: 200,
          margin: const EdgeInsets.fromLTRB(20, 80, 20, 0),
          decoration: BoxDecoration(
            color: const Color(0xFFFFB080), // اللون البرتقالي الهادئ من التصميم
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        // زر الرجوع
        Positioned(
          top: 55,
          left: 24,
          child: _buildCircleBtn(
            Icons.arrow_back_ios_new,
            () => Navigator.pop(context),
            size: 16,
          ),
        ),
        // كلمة Details
        const Positioned(
          top: 65,
          left: 80,
          child: Text(
            "Details",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 44),
        // صورة البيتزا العائمة بظل ناعم
        Positioned(
          top: 60,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: Image.network(
              'https://pngimg.com/uploads/pizza/pizza_PNG44093.png', // رابط صورة بيتزا شفافة
              width: 210,
              fit: BoxFit.contain,
            ),
          ),
        ),
        // زر المفضلات (القلب)
        Positioned(
          bottom: 15,
          right: 35,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(
                0.25,
              ), // شفافية بيضاء كما في الصورة
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRestaurantPill() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: const Color(0xFFF0F0F0)),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Color(0xFFFFE5D0),
            child: Icon(Icons.store, size: 12, color: Color(0xFFFF7622)),
          ),
          SizedBox(width: 10),
          Text(
            "Uttora Coffe House",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF181C2E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        _buildStatItem(Icons.star_border, "4.7"),
        const SizedBox(width: 32),
        _buildStatItem(Icons.local_shipping_outlined, "Free"),
        const SizedBox(width: 32),
        _buildStatItem(Icons.access_time, "20 min"),
      ],
    );
  }

  Widget _buildStatItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFFF7622), size: 22),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildSizeSelector() {
    return Row(
      children: [
        const Text(
          "SIZE:",
          style: TextStyle(
            color: Color(0xFFA0A5BA),
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 20),
        ...['10"', '14"', '16"'].map((size) {
          bool isSelected = selectedSize == size;
          return GestureDetector(
            onTap: () => setState(() => selectedSize = size),
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFFF7622)
                    : const Color(0xFFF6F8FA),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  size,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildIngredientsList() {
    // أيقونات تشبه المكونات في التصميم
    List<IconData> ingredientIcons = [
      Icons.bakery_dining_outlined,
      Icons.egg_outlined,
      Icons.opacity, // للملح أو الزيت
      Icons.set_meal_outlined,
      Icons.local_fire_department_outlined,
    ];
    return Row(
      children: ingredientIcons.map((icon) {
        return Container(
          margin: const EdgeInsets.only(right: 18),
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Color(0xFFFFF1E9),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFFFF7622), size: 24),
        );
      }).toList(),
    );
  }

  Widget _buildBottomActionBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 25, 24, 35),
      decoration: const BoxDecoration(
        color: Color(0xFFF6F8FA), // اللون الرمادي المزرق الفاتح من التصميم
        borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "\$32",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF181C2E),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF181C2E), // خلفية داكنة جداً للكمية
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    _buildQtyIcon(Icons.remove, () {
                      if (quantity > 1) setState(() => quantity--);
                    }),
                    Text(
                      "$quantity",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildQtyIcon(Icons.add, () => setState(() => quantity++)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF7622),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
              ),
              child: const Text(
                "ADD TO CART",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQtyIcon(IconData icon, VoidCallback onTap) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.white, size: 18),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      constraints: const BoxConstraints(),
    );
  }

  Widget _buildCircleBtn(
    IconData icon,
    VoidCallback onTap, {
    double size = 20,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color(0xFFF6F8FA),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: size, color: const Color(0xFF181C2E)),
      ),
    );
  }
}
