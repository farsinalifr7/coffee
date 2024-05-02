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

  // int selectIndex = 0;
  int selectType = 0;
  List<String> cofeeList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 230,
                child: Consumer<Shop>(builder: (_, value, __) {
                  return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.getCoffeeList().length,
                        itemBuilder: (context, index) {
                          return CoffeeTile(
                              coffee: value.getCoffeeList()[index]);
                        }),
                  );
                }),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                child: Text(
                  textAlign: TextAlign.start,
                  "Spcial for you",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 100,
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        height: 90,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "asset/images/coffee4-removebg-preview.png"),
                            //fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "5 Coffee beans  you",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                          Text(
                            " must try",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
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
