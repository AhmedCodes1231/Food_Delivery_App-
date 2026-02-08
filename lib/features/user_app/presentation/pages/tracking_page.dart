import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildMapPlaceholder(),
          _buildHeader(context),
          _buildBottomCard(),
          _buildTimeBadge(),
        ],
      ),
    );
  }

  Widget _buildMapPlaceholder() {
    return Container(
      color: const Color(0xFFC3E7FF),
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: CustomPaint(
          size: const Size(double.infinity, double.infinity),
          painter: RoutePainter(),
        ),
      ),
    );
  }

  Widget _buildTimeBadge() {
    return Positioned(
      top: 150,
      right: 50,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
          ],
        ),
        child: Column(
          children: const [
            Text(
              "25",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.primary,
              ),
            ),
            Text("min", style: TextStyle(fontSize: 12, color: AppColors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color(0xFF1A1D26),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              "Track Order",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFF1A1D26),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomCard() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1554118811-1e0d58224f24?q=80&w=2047&auto=format&fit=crop',
                    width: 65,
                    height: 65,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Uttora Coffee House",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Text(
                        "Ordered At 06 Sept, 10:00pm",
                        style: TextStyle(color: AppColors.grey, fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: const [
                          Icon(
                            Icons.fastfood_outlined,
                            size: 14,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 6),
                          Text(
                            "2x Burger, 4x Sandwich",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
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

class RoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF8A00)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.7);
    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.5,
      size.width * 0.5,
      size.height * 0.45,
    );
    path.lineTo(size.width * 0.8, size.height * 0.3);

    canvas.drawPath(path, paint);

    // Draw Start Marker
    final startPaint = Paint()..color = Colors.red;
    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.7),
      8,
      startPaint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.7),
      12,
      startPaint..color = Colors.red.withOpacity(0.3),
    );

    // Draw End Marker (Orange Pin)
    final endPaint = Paint()..color = const Color(0xFFFF8A00);
    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.3),
      10,
      endPaint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.3),
      16,
      endPaint..color = const Color(0xFFFF8A00).withOpacity(0.3),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
