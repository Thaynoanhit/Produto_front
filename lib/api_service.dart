import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:3001';

  static Future<void> createProduct(Map<String, dynamic> productData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/produtos'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(productData),
    );

    if (response.statusCode != 201) {
      throw Exception('Falha ao criar produto');
    }
  }

  static Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/produtos'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Falha ao carregar produtos');
    }
  }

  static Future<Map<String, dynamic>> fetchProductDetails(int productId) async {
    final response = await http.get(Uri.parse('$baseUrl/produtos/$productId'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Falha ao carregar o produto');
    }
  }

  static Future<void> updateProduct(
      int productId, Map<String, dynamic> productData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/produtos/$productId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(productData),
    );

    if (response.statusCode != 200) {
      throw Exception('Falha ao atualizar produto');
    }
  }

  static Future<void> deleteProduct(int productId) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/produtos/$productId'));

    if (response.statusCode != 200) {
      throw Exception('Falha ao excluir produto');
    }
  }
}
