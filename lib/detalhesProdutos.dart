import 'package:app_cafe_com_afeto/detalhesProdutos.dart';
import 'package:flutter/material.dart';


class DetalhesProdutos extends StatefulWidget {
  final Map<String, dynamic> produto;

  const DetalhesProdutos({Key? key, required this.produto}) : super(key: key);

  @override
  _DetalheProdutoState createState() => _DetalheProdutoState();
}

class _DetalheProdutoState extends State<DetalhesProdutos> {
  int quantidade = 1;

  @override
  Widget build(BuildContext context) {
    final produto = widget.produto;

    return Scaffold(
      appBar: AppBar(
        title: Text(produto['Nome']),
        backgroundColor: const Color(0xFF8D6E63),
      ),
      backgroundColor: const Color(0xFFFFF3E0),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              produto['Imagem'],
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              produto['Nome'],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              produto['Sensorial'],
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              produto['Preço'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const Text(
                  'Quantidade:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (quantidade > 1) quantidade--;
                    });
                  },
                ),
                Text(
                  quantidade.toString(),
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantidade++;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8D6E63),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Produto adicionado ao carrinho!")),
                );
              },
             child: const Text(
                'Adicionar ao carrinho',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),

            )
          ],
        ),
      ),
    );
  }
}
