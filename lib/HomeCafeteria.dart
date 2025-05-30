import 'package:flutter/material.dart';


class CadastroProduto extends StatefulWidget {
  const CadastroProduto({Key? key}) : super(key: key);

  @override
  _CadastroProdutoState createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController precoController = TextEditingController();

  void salvarProduto() {
    String nome = nomeController.text.trim();
    String descricao = descricaoController.text.trim();
    String preco = precoController.text.trim();

    if (nome.isEmpty || descricao.isEmpty || preco.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Preencha todos os campos!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    final produto = {
      'Nome': nome,
      'Sensorial': descricao,
      'Preço': 'R\$${preco.replaceAll(',', '.')}',
      'Imagem': 'https://via.placeholder.com/150', // imagem padrão
    };

    Navigator.pop(context, produto); // Retorna o produto para a Home
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF3E0),
      appBar: AppBar(
        title: Text('Cadastrar Produto'),
        backgroundColor: Color(0xFF8D6E63),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome do produto',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.local_cafe),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: descricaoController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Descrição sensorial',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.description),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: precoController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Preço',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: salvarProduto,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8D6E63),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text('Salvar', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
