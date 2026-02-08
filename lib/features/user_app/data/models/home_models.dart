import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String name;
  final IconData icon;

  CategoryModel({required this.id, required this.name, required this.icon});
}

class RestaurantModel {
  final String id;
  final String name;
  final String imagePath;
  final double rating;
  final String deliveryTime;
  final String priceRange;
  final List<String> categories;
  final String status; // e.g., "Open", "Closed"

  RestaurantModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.rating,
    required this.deliveryTime,
    this.priceRange = "\$15 - \$20",
    required this.categories,
    this.status = "Open",
  });
}

final List<CategoryModel> mockCategories = [
  CategoryModel(id: '1', name: 'All', icon: Icons.whatshot),
  CategoryModel(id: '2', name: 'Pizza', icon: Icons.local_pizza),
  CategoryModel(id: '3', name: 'Hot Dog', icon: Icons.fastfood),
  CategoryModel(id: '4', name: 'Burger', icon: Icons.lunch_dining),
];

final List<RestaurantModel> mockRestaurants = [
  RestaurantModel(
    id: '1',
    name: 'Rose Garden Restaurant',
    imagePath:
        'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?q=80&w=2070&auto=format&fit=crop',
    rating: 4.7,
    deliveryTime: '20 min',
    categories: ['Burger', 'Chicken', 'Riche', 'Wings'],
  ),
  RestaurantModel(
    id: '2',
    name: 'Tasty Treat Gallery',
    imagePath:
        'https://images.unsplash.com/photo-1552566626-52f8b828add9?q=80&w=2070&auto=format&fit=crop',
    rating: 4.5,
    deliveryTime: '25 min',
    categories: ['Burger', 'Chicken', 'Riche', 'Wings'],
  ),
  RestaurantModel(
    id: '3',
    name: 'Quick Bite Corner',
    imagePath:
        'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=2070&auto=format&fit=crop',
    rating: 4.8,
    deliveryTime: '15 min',
    categories: ['Pizza', 'Italian'],
  ),
];
