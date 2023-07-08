import 'package:flutter/material.dart';
import 'package:n8_default_project/ui/home/home_screen.dart';

import '../cart/cart_screen.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  int currentIndex = 0;

  List<Widget> _screens = [];
  @override
  void initState() {
    _screens = [
      const HomeScreen(),
      const CartScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() {
          currentIndex=value;
        }),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: ""),
        ],
      ),
    );
  }
}
