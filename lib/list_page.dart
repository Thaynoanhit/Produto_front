import 'package:flutter/material.dart';
import 'api_service.dart';
import 'product_details_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late Future<List<dynamic>> _products;

  @override
  void initState() {
    super.initState();
    _products = ApiService.fetchProducts(); // Carregar produtos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Produtos'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum produto encontrado.'));
          } else {
            final products = snapshot.data!;

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  child: ListTile(
                    title: Text(product['name']),
                    subtitle: Text('Preço: ${product['price']}'),
                    onTap: () {
                      // Passa o produto completo para a página de detalhes
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(product: product),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
