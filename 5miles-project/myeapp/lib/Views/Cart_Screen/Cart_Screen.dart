import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myeapp/consts/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: "Cart is Empty right now".text.fontFamily(bold).makeCentered(),
    );
  }
}
