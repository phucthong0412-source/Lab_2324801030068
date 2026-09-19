import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'name': 'Áo thun',
        'icon': Icons.checkroom,
      },
      {
        'name': 'Áo Hoodie',
        'icon': Icons.dry_cleaning,
      },
      {
        'name': 'Áo sơ mi',
        'icon': Icons.checkroom_outlined,
      },
      {
        'name': 'Quần Jeans',
        'icon': Icons.shopping_bag_outlined,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh mục sản phẩm'),
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,

        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),

        itemBuilder: (context, index) {
          final category = categories[index];

          return Card(
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Bạn đã chọn ${category['name']}',
                    ),
                  ),
                );
              },

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    category['icon'] as IconData,
                    size: 50,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    category['name'] as String,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}