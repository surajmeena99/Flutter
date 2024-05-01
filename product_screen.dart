import 'package:first_app/Cart/cart_screen.dart';
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
      int index = _cartItems.indexWhere((item) => item.product.name == product.name);  //for find index
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
                          style: const TextStyle(fontSize: 16.0, color: Colors.green),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            _addToCart(_products[index]);
                          },
                          color: Colors.green,
                        ),
                      ],
                    )
                  : TextButton(
                      onPressed: () {
                        _addToCart(_products[index]);
                      },
                    child: const Text("ADD", style: TextStyle(color: Colors.green)),
              ),
            ),
          );
        },
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
