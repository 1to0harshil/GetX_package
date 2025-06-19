import 'package:flutter/material.dart';
import 'package:get_x_structure/src/app/data/model/request_model/app_intro_model.dart';

class StaticArray {
  List<IntroDataModel> pages = [
    IntroDataModel(
      id: '1',
      name: 'Home',
      content: 'Home',
      image: Icons.home_filled,
      backgroundColor: Colors.red.withValues(alpha:0.7),
    ),
    IntroDataModel(
      id: '2',
      name: 'About Us',
      content: 'About Us',
      image: Icons.edit_document,
      backgroundColor: Colors.blue.withValues(alpha:0.7),
    ),
    IntroDataModel(
      id: '3',
      name: 'Contact',
      content: 'Contact',
      image: Icons.all_inbox_rounded,
      backgroundColor: Colors.purple.withValues(alpha:0.7),
    ),
  ];

  static final List categories = [
    {
      'id': 1,
      'title': 'Smartphones',
      'name': 'smartphones',
      'image': 'https://cdn.dummyjson.com/product-images/1/thumbnail.jpg',
    },
    {
      'id': 2,
      'title': 'Laptops',
      'name': 'laptops',
      'image': 'https://cdn.dummyjson.com/product-images/8/thumbnail.jpg',
    },
    {
      'id': 3,
      'title': 'Fragrances',
      'name': 'fragrances',
      'image': 'https://cdn.dummyjson.com/product-images/11/thumbnail.jpg',
    },
    {
      'id': 4,
      'title': 'Skincare',
      'name': 'skincare',
      'image': 'https://cdn.dummyjson.com/product-images/16/thumbnail.jpg',
    },
    {
      'id': 5,
      'title': 'Groceries',
      'name': 'groceries',
      'image': 'https://cdn.dummyjson.com/product-images/21/thumbnail.png',
    },
    {
      'id': 6,
      'title': 'Home Decoration',
      'name': 'home-decoration',
      'image': 'https://cdn.dummyjson.com/product-images/26/thumbnail.jpg',
    },
    {
      'id': 7,
      'title': 'Furniture',
      'name': 'furniture',
      'image': 'https://cdn.dummyjson.com/product-images/31/thumbnail.jpg',
    },
    {
      'id': 8,
      'title': 'Tops',
      'name': 'tops',
      'image': 'https://cdn.dummyjson.com/product-images/36/4.jpg',
    },
    {
      'id': 9,
      'title': 'Womens Dresses',
      'name': 'womens-dresses',
      'image': 'https://cdn.dummyjson.com/product-images/41/1.jpg',
    },
    {
      'id': 10,
      'title': 'Womens Shoes',
      'name': 'womens-shoes',
      'image': 'https://cdn.dummyjson.com/product-images/46/thumbnail.jpg',
    },
    {
      'id': 11,
      'title': 'Mens Shirts',
      'name': 'mens-shirts',
      'image': 'https://cdn.dummyjson.com/product-images/51/thumbnail.jpg',
    },
    {
      'id': 12,
      'title': 'Mens Shoes',
      'name': 'mens-shoes',
      'image': 'https://cdn.dummyjson.com/product-images/56/thumbnail.jpg',
    },
    {
      'id': 13,
      'title': 'Mens Watches',
      'name': 'mens-watches',
      'image': 'https://cdn.dummyjson.com/product-images/61/thumbnail.jpg',
    },
    {
      'id': 14,
      'title': 'Womens Watches',
      'name': 'womens-watches',
      'image': 'https://cdn.dummyjson.com/product-images/66/thumbnail.jpg',
    },
    {
      'id': 15,
      'title': 'Womens Bags',
      'name': 'womens-bags',
      'image': 'https://cdn.dummyjson.com/product-images/71/thumbnail.jpg',
    },
    {
      'id': 16,
      'title': 'Womens Jewellery',
      'name': 'womens-jewellery',
      'image': 'https://cdn.dummyjson.com/product-images/76/thumbnail.jpg',
    },
    {
      'id': 17,
      'title': 'Sunglasses',
      'name': 'sunglasses',
      'image': 'https://cdn.dummyjson.com/product-images/81/thumbnail.jpg',
    },
    {
      'id': 18,
      'title': 'Automotive',
      'name': 'automotive',
      'image': 'https://cdn.dummyjson.com/product-images/86/thumbnail.jpg',
    },
    {
      'id': 19,
      'title': 'Motorcycle',
      'name': 'motorcycle',
      'image': 'https://cdn.dummyjson.com/product-images/91/thumbnail.jpg',
    },
    {
      'id': 20,
      'title': 'Lighting',
      'name': 'lighting',
      'image': 'https://cdn.dummyjson.com/product-images/96/thumbnail.jpg',
    },
  ];
}
