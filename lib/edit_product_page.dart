import 'package:flutter/material.dart';

class EditProductPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const EditProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: product['name']);
    final priceController =
        TextEditingController(text: product['price'].toString());
    final stockController =
        TextEditingController(text: product['stock'].toString());

    return Scaffold(
      appBar: AppBar(title: const Text('Editar Produto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nome')),
            TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.number),
            TextField(
                controller: stockController,
                decoration: const InputDecoration(labelText: 'Estoque'),
                keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Salvar Alterações'),
              onPressed: () {
                // Atualizar produto
              },
            ),
          ],
        ),
      ),
    );
  }
}
