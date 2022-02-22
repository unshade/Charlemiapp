import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Hero(
            tag: product.name,
            child: Image.asset(product.image ?? "assets/food.jpeg"),
          ),
        ),
      ),
      Text(
        product.name,
        style: const TextStyle(color: Colors.black),
      ),
      Text(
        "${NumberFormat("0.00", "fr_FR").format(product.price)}€",
        style: const TextStyle(fontWeight: FontWeight.bold),
      )
    ]);
  }
}