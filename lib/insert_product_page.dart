import 'package:flutter/material.dart';
import 'api_service.dart';

class InsertProductPage extends StatefulWidget {
  const InsertProductPage({super.key});

  @override
  InsertProductPageState createState() => InsertProductPageState();
}

class InsertProductPageState extends State<InsertProductPage> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final stockController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    stockController.dispose();
    super.dispose();
  }

  Future<void> _saveProduct() async {
    final newProduct = {
      'nome': nameController.text,
      'descricao': descriptionController.text,
      'preco': priceController.text,
      'estoque': stockController.text,
      'data': DateTime.now().toIso8601String(),
    };

    try {
      await ApiService.createProduct(newProduct);
      if (mounted) {
        // Mostra mensagem de sucesso e retorna para a ListPage
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('Produto "${newProduct['nome']}" cadastrado com sucesso!'),
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao salvar produto: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Produto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: stockController,
              decoration: const InputDecoration(labelText: 'Estoque'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProduct,
              child: const Text('Salvar Produto'),
            ),
          ],
        ),
      ),
    );
  }
}
