import 'package:flutter/material.dart';

import '../data/product_data.dart';
import 'payment_success_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final Set<int> selectedIndexes = {};

  @override
  void initState() {
    super.initState();

    // Mặc định chọn tất cả sản phẩm trong giỏ
    for (int i = 0; i < cartProducts.length; i++) {
      selectedIndexes.add(i);
    }
  }

  double get totalPrice {
    double total = 0;

    for (int index in selectedIndexes) {
      total += cartProducts[index].price;
    }

    return total;
  }

  void payment() {
    if (selectedIndexes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng chọn ít nhất một sản phẩm'),
        ),
      );
      return;
    }

    final double paidTotal = totalPrice;

    // Xóa những sản phẩm đã thanh toán khỏi giỏ
    final indexes = selectedIndexes.toList()
      ..sort((a, b) => b.compareTo(a));

    for (int index in indexes) {
      cartProducts.removeAt(index);
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentSuccessScreen(
          total: paidTotal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán'),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                final product = cartProducts[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: CheckboxListTile(
                    value: selectedIndexes.contains(index),

                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          selectedIndexes.add(index);
                        } else {
                          selectedIndexes.remove(index);
                        }
                      });
                    },

                    secondary: Image.network(
                      product.image,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),

                    title: Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      '${product.price.toStringAsFixed(0)} đ',
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tổng thanh toán:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      '${totalPrice.toStringAsFixed(0)} đ',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: payment,
                    child: const Text(
                      'Thanh toán',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}