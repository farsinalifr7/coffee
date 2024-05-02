import 'package:cofee/pages/cart_page.dart';
import 'package:cofee/pages/shop_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  int selectIndex = 0;
  final List<Widget> _pages = [
    // Add your pages here
    const ShopPage(),
    const CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectIndex,
          selectedItemColor: Colors.orange,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
          onTap: (value) {
            setState(() {
              selectIndex = value;
            });
          },
          backgroundColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: "Home"),
            // BottomNavigationBarItem(
            //     icon: Icon(
            //       Icons.search,
            //       color: Colors.white,
            //     ),
            //     label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopify_rounded,
                  color: Colors.white,
                ),
                label: "Cart")
          ]),
      body: _pages[selectIndex],
    );
  }
}
