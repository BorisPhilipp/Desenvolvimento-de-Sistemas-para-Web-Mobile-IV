import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Inputs e Interatividade',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: const FormularioPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FormularioPage extends StatefulWidget {
  const FormularioPage({super.key});

  @override
  State<FormularioPage> createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {

  //chave global para o formulario
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //controllers
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  //gesture detector
  String _toqueMensagem = 'Nenhum toque detectado.';

  @override
  void dispose(){
    //liberar recursos do controllador
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _enviarFormulario(){
    //acionar validação dos TextFormField
    if(_formKey.currentState!.validate()){
      //se todos os campos forem validos
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
           content: Text(
             'Formulario Valido!\nNome:${_nomeController.text}, Email: ${_emailController.text}',
           ),
            backgroundColor: Colors.green,
          ),
      );
    } else {
      //caso haja erro de validação
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por faovr, corrija os erros no formulário.'),
        backgroundColor: Colors.red,
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrada de Dados e Interatividade'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        //permite rolar a tela se o teclado aparecer
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //titulo da seção
              Text(
                'Cadastre-se',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
