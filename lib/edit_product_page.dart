import 'package:flutter/material.dart';
import 'api_service.dart';

class EditProductPage extends StatefulWidget {
  final Map<String, dynamic> product;
  const EditProductPage({super.key, required this.product});

  @override
  EditProductPageState createState() => EditProductPageState();
}

class EditProductPageState extends State<EditProductPage> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  late TextEditingController stockController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.product['nome']);
    descriptionController =
        TextEditingController(text: widget.product['descricao']);
    priceController =
        TextEditingController(text: widget.product['preco'].toString());
    stockController =
        TextEditingController(text: widget.product['estoque'].toString());
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    stockController.dispose();
    super.dispose();
  }

  Future<void> _updateProduct() async {
    final updatedProduct = {
      'nome': nameController.text,
      'descricao': descriptionController.text,
      'preco': priceController.text,
      'estoque': stockController.text,
      'data': widget.product['data'],
    };

    try {
      await ApiService.updateProduct(widget.product['id'], updatedProduct);
      if (mounted) {
        Navigator.pop(context, {
          ...updatedProduct,
          'id': widget.product['id'],
          'data': widget.product['data'],
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao atualizar produto: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Produto')),
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
              onPressed: _updateProduct,
              child: const Text('Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }
}
