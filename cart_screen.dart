import 'package:first_app/Cart/product_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<CartItem> cartItems;

  const CartScreen({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double total = 0;
    cartItems.forEach((item) {
      total += item.product.price * item.quantity;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          double totalAmount = cartItems[index].product.price * cartItems[index].quantity;
          return ListTile(
            title: Text(cartItems[index].product.name),
            subtitle: Text('Quantity: ${cartItems[index].quantity.toString()}'),
            trailing: Text('Total: \₹${totalAmount.toStringAsFixed(2)}'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \₹${total.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18.0),
              ),
              SizedBox(
                width: 100,
                child: TextButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen(totalAmount: total)),);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.4)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(10.0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  child: const Text('Checkout', style: TextStyle(fontSize: 16.0)),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}