import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Início'),
      ),
      body: const _Wrapper(),
    );
  }
}

class _Wrapper extends StatelessWidget {
  const _Wrapper();

  @override
  Widget build(BuildContext context) {
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();

    Future<void> makeLogin(BuildContext context) async {
      try {
        var response = await http.post(
          Uri.parse('https://reqres.in/api/register'),
          body: {
            'email': _email.text.trim(),
            'password': _password.text.trim(),
          },
        );

        if (response.statusCode == 200) {
          // Login bem-sucedido, navegar para a próxima página
          Navigator.pushReplacementNamed(context, '/second'); // Navegar e substituir a página atual
        } else {
          // Caso contrário, exibir uma mensagem de erro
          throw Exception('Usuário não encontrado');
        }
      } catch (e) {
        // Tratamento de erro genérico
        print('Erro durante o login: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro durante o login')),
        );
      }
    }

    return Container(
      padding: const EdgeInsets.all(40.0),
      child: Wrap(
        runSpacing: 20,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Email:'),
              TextField(
                controller: _email,
                decoration: const InputDecoration(hintText: 'example@example.com'),
                textCapitalization: TextCapitalization.none,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Password:'),
              TextField(
                controller: _password,
                decoration: const InputDecoration(hintText: '12345678'),
                textCapitalization: TextCapitalization.none,
                obscureText: true, // Esconder a senha
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => makeLogin(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0000ff),
                foregroundColor: const Color(0xffffffff),
              ),
              child: const Text('Fazer login'),
            ),
          ),
        ],
      ),
    );
  }
}
