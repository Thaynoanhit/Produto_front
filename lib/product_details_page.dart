import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${product['name']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Preço: ${product['price']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Descrição: ${product['description']}',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
