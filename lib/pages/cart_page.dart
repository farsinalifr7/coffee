import 'package:cofee/modal/shop.dart';
import 'package:cofee/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    //final int number =  context.read<Shop>().getCartlist().length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const ShopPage()));
          },
        ),
        centerTitle: true,
        title: const Text(
          "MY Cart",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          // Text(
          //   context.read<Shop>().getCartlist().length.toString(),
          //   style: const TextStyle(color: Colors.yellow),
          // ),
          Expanded(
            child: ListView.builder(
                itemCount: context.read<Shop>().getCartlist().length,
                itemBuilder: (context, index) {
                  var product = context.read<Shop>().getCartlist();
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(8)),

                      child: ListTile(
                        title: Text(
                          product[index].name,
                          style: const TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(
                          "₹ ${product[index].price}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        leading: Image.asset(product[index].image),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle,
                              color: Colors.white),
                          onPressed: () {
                            context
                                .read<Shop>()
                                .removeItemFromCart(product[index]);
                            setState(() {});
                          },
                        ),
                      ),
                      //
                    ),
                  );
                }),
          ),
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Center(
              child: Container(
                width: 300,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 1.2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Amount :",
                          style:
                              TextStyle(color: Colors.grey[200], fontSize: 17),
                        ),
                        Text(
                          "₹ ${context.watch<Shop>().findtotal()}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 130,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Pay Now",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
