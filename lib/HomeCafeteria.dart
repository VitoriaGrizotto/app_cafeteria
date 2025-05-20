import 'package:app_cafe_com_afeto/detalhesProdutos.dart';
import 'package:app_cafe_com_afeto/cadastroProduto.dart';
import 'package:flutter/material.dart';

class HomeCafeteria extends StatefulWidget {
  @override
  _HomeCafeteriaState createState() => _HomeCafeteriaState();
}

class _HomeCafeteriaState extends State<HomeCafeteria> {
  List<Map<String, dynamic>> produtos = [
    {
      'Nome': 'Café Arara Edição Limitada',
      'Sensorial': 'Doçura intensa, corpo aveludado, frutado.',
      'Preço': 'R\$60,00',
      'Imagem': 'https://acdn-us.mitiendanube.com/stores/001/371/162/products/mockup-arara-1-nshop-1024x1024-910003f3b60f644c1617402261978898-1024-1024.webp'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8D6E63),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Cafeteria da Sandra'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: produtos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            final produto = produtos[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalhesProdutos(produto: produto),
                  ),
                );
              },
              child: Card(
                color: const Color.fromARGB(255, 239, 224, 213),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.network(
                        produto['Imagem'] ?? 'https://via.placeholder.com/150',
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            produto['Nome'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF4E342E),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            produto['Sensorial'],
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF6D4C41),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            produto['Preço'] ?? '',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF3E2723),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF8D6E63),
        onPressed: () async {
          final novoProduto = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CadastroProduto()),
          );

          if (novoProduto != null) {
            setState(() {
              produtos.add(novoProduto);
            });
          }
        },
        child: const Icon(Icons.add),
        tooltip: 'Cadastrar novo produto',
      ),
    );
  }
}
