import 'package:flutter/material.dart';

class InsertProductPage extends StatelessWidget {
  const InsertProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final priceController = TextEditingController();
    final stockController = TextEditingController();
    final dateController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Produto')),
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
            TextField(
                controller: dateController,
                decoration:
                    const InputDecoration(labelText: 'Data de Criação')),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Salvar'),
              onPressed: () {
                // Salvar produto
              },
            ),
          ],
        ),
      ),
    );
  }
}
