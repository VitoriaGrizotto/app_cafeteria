import 'package:flutter/material.dart';

void main() {
  runApp(CafeteriaApp());
}

class CafeteriaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFBCAAA4),
        scaffoldBackgroundColor: Color(0xFFF5F5DC), 
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_cafe, size: 80, color: Color(0xFF6D4C41)),
              SizedBox(height: 16),
              Text(
                'Bem-vindo à ao Café com Afeto',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6D4C41), 
                ),
              ),
              SizedBox(height: 32),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.email, color: Color(0xFF8D6E63)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock, color: Color(0xFF8D6E63)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8D6E63), // Marrom médio
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  String usario_cadastrado = 'Vitoria';
                  String senha_cadastrada = '123';
                },// INCOMPLETOOOOOOOO
                child: Text(
                  'Entrar',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}