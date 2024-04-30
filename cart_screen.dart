import 'package:first_app/Cart/product_card.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<Product> _products = [
    Product(name: 'Product 1', price: 10.0, imageUrl: 'assets/logo.png',),
    Product(name: 'Product 2', price: 20.0, imageUrl: 'assets/logo.png',),
    Product(name: 'Product 3', price: 30.0, imageUrl: 'assets/logo.png',),
  ];

  final List<CartItem> _cartItems = [];

  void _addToCart(Product product) {
    setState(() {
      int index = _cartItems.indexWhere((item) => item.product.name == product.name);  //Check the index here if exist
      if (index != -1) {
        _cartItems[index].quantity++;
      } else {
        _cartItems.add(CartItem(product: product, quantity: 1));
      }
    });
  }

  void _removeFromCart(Product product) {
    setState(() {
      int index = _cartItems.indexWhere((item) => item.product.name == product.name);
      if (index != -1) {
        if (_cartItems[index].quantity > 1) {
          _cartItems[index].quantity--;
        } else {
          _cartItems.removeAt(index);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen(cartItems: _cartItems)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            productName: _products[index].name,
            productPrice: _products[index].price,
            productImage: _products[index].imageUrl,
            addToCart: Container(
              height: 40,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: (_cartItems.indexWhere((item) => item.product.name == _products[index].name) != -1 &&
                  _cartItems[_cartItems.indexWhere((item) => item.product.name == _products[index].name)].quantity > 0)
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            _removeFromCart(_products[index]);
                          },
                          color: Colors.green,
                        ),
                        Text(
                          (_cartItems.indexWhere((item) => item.product.name == _products[index].name) != -1)
                              ? _cartItems[_cartItems.indexWhere((item) => item.product.name == _products[index].name)].quantity.toString()
                              : '0',
                          style: const TextStyle(fontSize: 16.0, color: Colors.green), // Adjust the text color as needed
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            _addToCart(_products[index]);
                          },
                          color: Colors.green, // Adjust the icon color as needed
                        ),
                      ],
                    )
                  : TextButton(
                      onPressed: () {
                        _addToCart(_products[index]); // Also add to cart when "Add" button is pressed
                      },
                    child: const Text("Add", style: TextStyle(color: Colors.green)), // Adjust the text color as needed
              ),
            ),
          );
        },
      ),
    );
  }
}

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
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProductCard()));
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

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});
}


class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}
