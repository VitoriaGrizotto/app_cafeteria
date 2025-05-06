// Substitua por sua tela principal após o login
class HomeCafeteria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5DC),
      appBar: AppBar(
        title: Text('Bem-vindo à Cafeteria'),
        backgroundColor: Color(0xFF8D6E63),
      ),
      body: Center(
        child: Text(
          'Você entrou!',
          style: TextStyle(fontSize: 24, color: Color(0xFF5D4037)),
        ),
      ),
    );
  }
}