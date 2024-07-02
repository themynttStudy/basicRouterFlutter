import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Page'),
      ),
      body: const _Wrapper(),
    );
  }
}

class _Wrapper extends StatelessWidget {
  const _Wrapper();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          const Text(
            'Segunda pagina',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          ElevatedButton(onPressed: () => {
            Navigator.popAndPushNamed(context, '/')
          }, child: const Text('Voltar'))
        ],
      ),
    );
  }
}

