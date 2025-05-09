import 'package:flutter/material.dart';

class HomeCafeteria extends StatelessWidget {
  final List<Map<String, dynamic>> produtos = [
    {
      'Nome': 'Café Especial Arara Edição Limitada 250g',
      'Sensorial': 'Doçura intensa, corpo aveludado e macio, sabor frutado, acidez cítrica prazerosa com notas de mix de frutas frescas.',
      'Preco': 'R\$60,00'
    },

    {
      'Nome': 'Café Especial Caramelo e Mel 250g',
      'Sensorial': 'Doçura intensa, corpo alto, acidez cítrica equilibrada com notas de caramelo e mel.',
      'Preco': 'R\$50,00'
    },

    {
      'Nome': 'Café Gourmet Chocolate Intenso 500g',
      'Sensorial': 'Doçura intensa, corpo alto com notas de chocolate.',
      'Preco': 'R\$55,00'
      
    },

    {
      'Nome' : 'Café Especial Frutas Amarelas 250g',
      'Sensorial' : 'Doçura intensa, corpo licoroso, sabor frutado, acidez cítrica brilhante com notas de frutas amarelas, maracujá',
      'Preco' : 'R\$52,00'

    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        title: const Text('Cafeteria da Sandra'),
        backgroundColor: const Color (0xFF8D6E63),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: produtos.length,
          itemBuilder: (context, index) {
            final produto = produtos[index];
            return Card(
              color: const Color.fromARGB(255, 214, 178, 164),
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              
              ),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      produto['Nome'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5D4037),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      produto['Sensorial'],
                      style: const TextStyle(color: Color(0xFF795548)),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      produto['Preco'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4E342E),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
