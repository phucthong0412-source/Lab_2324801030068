import 'package:flutter/material.dart';

import '../data/product_data.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng'),
      ),

      body: cartProducts.isEmpty
          ? const Center(
        child: Text(
          'Giỏ hàng đang trống',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      )
          : ListView.builder(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          final product = cartProducts[index];

          return ListTile(
            leading: Image.network(
              product.image,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),

            title: Text(product.name),

            subtitle: Text(
              '${product.price.toStringAsFixed(0)} đ',
            ),

            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  cartProducts.removeAt(index);
                });
              },
            ),
          );
        },
      ),

      bottomNavigationBar: cartProducts.isEmpty
          ? null
          : SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const CheckoutScreen(),
                  ),
                ).then((_) {
                  setState(() {});
                });
              },
              child: const Text(
                'Tiến hành thanh toán',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}