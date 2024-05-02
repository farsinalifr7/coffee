import 'package:cofee/component/coffee_detail.dart';
import 'package:cofee/modal/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatefulWidget {
  final Coffee coffee;
  const CoffeeTile({super.key, required this.coffee});

  @override
  State<CoffeeTile> createState() => _CoffeeTileState();
}

class _CoffeeTileState extends State<CoffeeTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CoffeeDetail(coffee: widget.coffee)));
      },
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            width: 150,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 120,
                        height: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              widget.coffee.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        )),
                    Text(
                      widget.coffee.name,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Text(
                    //   widget.coffee.description,
                    //   style: const TextStyle(
                    //       color: Colors.white, fontWeight: FontWeight.w300),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹ ${widget.coffee.price}",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.orange,
                          ),
                          child: const Icon(Icons.add),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
            ),
          )),
    );
  }
}
