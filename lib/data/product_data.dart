import '../models/product.dart';

final List<Product> products = [
  Product(
    name: 'Áo thun Basic',
    price: 199000,
    image: 'https://picsum.photos/300/300?1',
    description: 'Áo thun basic form rộng, chất liệu cotton thoáng mát.',
  ),
  Product(
    name: 'Áo Hoodie',
    price: 399000,
    image: 'https://picsum.photos/300/300?2',
    description: 'Hoodie trẻ trung, phù hợp mặc đi học hoặc đi chơi.',
  ),
  Product(
    name: 'Quần Jeans',
    price: 459000,
    image: 'https://picsum.photos/300/300?3',
    description: 'Quần jeans phong cách trẻ trung, dễ phối đồ.',
  ),
  Product(
    name: 'Áo sơ mi',
    price: 299000,
    image: 'https://picsum.photos/300/300?4',
    description: 'Áo sơ mi đơn giản, phù hợp nhiều hoàn cảnh.',
  ),
];
final List<Product> cartProducts = [];