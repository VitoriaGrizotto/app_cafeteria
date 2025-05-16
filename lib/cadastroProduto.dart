import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastroProduto extends StatefulWidget {
  const CadastroProduto({super.key});

  @override
  State<CadastroProduto> createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _precoController = TextEditingController();

  void _salvarProduto() {
    final nome = _nomeController.text;
    final descricao = _descricaoController.text;
    final preco = double.tryParse(_precoController.text) ?? 0.0;

    await FirebaseFirestore.instance.collection('produtos').add({
      'nome': nome,
      'descricao': descricao,
      'preco': preco,
      'imagem': imagem,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Produto salvo com sucesso!')),
    );

    _nomeController.clear();
    _descricaoController.clear();
    _precoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Produto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nomeController, decoration: const InputDecoration(labelText: 'Nome')),
            TextField(controller: _descricaoController, decoration: const InputDecoration(labelText: 'Descrição')),
            TextField(controller: _precoController, decoration: const InputDecoration(labelText: 'Preço')),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _salvarProduto, child: const Text('Salvar')),
          ],
        ),
      ),
    );
  }
}
