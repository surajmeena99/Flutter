import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.addToCart,
  });

  final String productName;
  final double productPrice;
  final String productImage;
  final Widget addToCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 160,
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('\₹${productPrice.toString()}'),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("More Details"),
                      ),
                    ],
                  ),
                ),
                Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: 100,
                          width: 130,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(productImage,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 80,
                        ),
                        child: addToCart,
                      )
                    ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class ProductCard extends StatelessWidget {
//   const ProductCard({super.key, required this.productName, required this.productPrice, required this.productImage, required this.addToCart});
//   final String productName;
//   final double productPrice;
//   final String productImage;
//   final Widget addToCart;
//   // final Future<void> Function() onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: SizedBox(
//             height: 150,
//             child: Card(
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(productName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
//                         Text('\₹${productPrice.toString()}'),
//                         const SizedBox(height: 13,),
//                         ElevatedButton(
//                             onPressed: (){},
//                             child: const Text("More Details"),
//                         )
//                       ],
//                     ),
//                     Stack(
//                       children: [
//                         Positioned(
//                           child: Container(
//                             height: 100, // Set the height as needed
//                             decoration: BoxDecoration(
//                               border: Border.all(width: 1),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Image.asset(productImage,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                             left: 15,
//                             right: 15,
//                             top: 80,
//                           ),
//                           child: addToCart,
//                           // child: ElevatedButton(
//                           //     onPressed: (){
//                           //       widget.onPressed;
//                           //     },
//                           //     child: const Text("add")
//                           // )
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }