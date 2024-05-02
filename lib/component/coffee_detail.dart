import 'package:cofee/modal/coffee.dart';
import 'package:cofee/modal/shop.dart';
import 'package:cofee/pages/intro_page.dart';
import 'package:cofee/pages/shop_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CoffeeDetail extends StatefulWidget {
  final Coffee coffee;
  const CoffeeDetail({super.key, required this.coffee});

  @override
  State<CoffeeDetail> createState() => _CoffeeDetailState();
}

class _CoffeeDetailState extends State<CoffeeDetail> {
  double val = 0.5;
  int Count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const IntroPage()));
          },
        ),
        title: Text(
          widget.coffee.name,
          style: const TextStyle(
              color: Colors.orange, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                widget.coffee.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "₹ ${widget.coffee.price}",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  width: 155,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (Count > 1) {
                          setState(() {
                            Count = Count - 1;
                          });
                        }
                      },
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: const Icon(Icons.remove)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      Count.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Count = Count + 1;
                        });
                      },
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: const Icon(Icons.add)),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sweet",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Slider(
                    activeColor: Colors.orange,
                    divisions: 4,
                    value: val,
                    onChanged: (value) {
                      setState(() {
                        val = value;
                      });
                    }),
              ],
            ),
            SizedBox(
              height: 100,
              child: Text(
                textAlign: TextAlign.start,
                widget.coffee.description,
                style: TextStyle(color: Colors.grey[200], fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context.read<Shop>().addItemToCart(widget.coffee);
                final snackBar = SnackBar(
                  content: Text(
                    '${widget.coffee.name} added to cart',
                    style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  duration: const Duration(milliseconds: 900),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const IntroPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orange[400],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add to Cart",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
