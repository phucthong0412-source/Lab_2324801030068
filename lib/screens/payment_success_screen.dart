import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final double total;

  const PaymentSuccessScreen({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle,
                  size: 100,
                ),

                const SizedBox(height: 20),

                const Text(
                  'Thanh toán thành công!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Cảm ơn bạn đã mua hàng.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  'Tổng tiền: ${total.toStringAsFixed(0)} đ',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                            (route) => false,
                      );
                    },
                    child: const Text(
                      'Về trang chủ',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}