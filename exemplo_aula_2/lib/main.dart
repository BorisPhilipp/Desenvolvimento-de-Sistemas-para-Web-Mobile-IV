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
        //primarySwatch: Colors.deepPurple

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
        title: const Text('Entrada de Dados e Interatividade', style: TextStyle(color: Colors.white)),
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
              const SizedBox(height: 25,),
              //Campo de Texto
              TextField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome Completo',
                  hintText: 'Ex: João da Silva',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 25,),
              //Campo de Texto
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'seu.email@exemplo.com',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'O Email é obrigatório.';
                  }
                  if(!value.contains('@') || !value.contains('.')){
                    return 'Digite um Email válido.';
                  }
                  return null; //se for válido
                },
              ),
              const SizedBox(height: 25,),
              //Campo de Texto
              TextFormField(
                controller: _senhaController,
                obscureText: true, //esconde o texto digitado
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  hintText: 'Mínimo 6 caracteres',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'A senha é obrigatória.';
                  }
                  if(value.length<6){
                    return 'A senha deve ter pelo menos 6 caracteres.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30,),
              //botão
              ElevatedButton.icon(onPressed: _enviarFormulario,
                icon: Icon(Icons.send),
                label: Text('Enviar Cadastro', style:
                TextStyle(fontSize: 18, color: Colors.white),),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
