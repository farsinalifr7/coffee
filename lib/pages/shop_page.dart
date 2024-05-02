import 'package:cofee/component/coffeetile.dart';
import 'package:cofee/modal/coffee.dart';
import 'package:cofee/modal/shop.dart';
import 'package:cofee/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  void initState() {
    loading();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    clear();
    super.dispose();
  }

  int selectIndex = 0;
  int selectType = 0;
  List<String> cofeeList = [];
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
              icon: const Icon(Icons.shopify_sharp, color: Colors.white))
        ],
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            const Text(
              "Find the best coffee for you",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  hintText: "Find your coffee ",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cofeeList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectType = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          cofeeList[index],
                          style: TextStyle(
                              color: selectType == index
                                  ? Colors.orange
                                  : Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 250,
              child: Consumer<Shop>(builder: (_, value, __) {
                return Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.getCoffeeList().length,
                      itemBuilder: (context, index) {
                        return CoffeeTile(coffee: value.getCoffeeList()[index]);
                      }),
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  void loading() {
    for (var i = 0; i < context.read<Shop>().getCoffeeList().length; i++) {
      cofeeList.add(context.read<Shop>().getCoffeeList()[i].name);
    }
  }

  void clear() {
    cofeeList.clear();
  }
}
