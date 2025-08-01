import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo Exemplo da Aula de Flutter',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const TelaInicialProjeto(), //tela inicial
      debugShowCheckedModeBanner: false,
    );
  }
}

class TelaInicialProjeto extends StatelessWidget {
  const TelaInicialProjeto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem Vindo'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, //vertical
        crossAxisAlignment: CrossAxisAlignment.center, //horizontal
        children: [
          const Text(
            'Bem-Vindo ao meu App',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.blueAccent),
            ),
            child: const Text(
              'Esta é a primeira tela construída com Flutter.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}


