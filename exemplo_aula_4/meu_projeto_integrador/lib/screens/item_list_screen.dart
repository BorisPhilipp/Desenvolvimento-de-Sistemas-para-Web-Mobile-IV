import 'package:flutter/material.dart';
import 'package:meu_projeto_integrador/models/item_model.dart';
import 'package:meu_projeto_integrador/widgets/item_list_card.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  static final List<Item> _itens = [
    Item(
      id: 1,
      nome: 'Marea Turbo',
      preco: 20000.00,
      imageUrl: 'https://pt.quizur.com/_image?href=https://img.quizur.com/f/img64624f77d49397.45271659.jpg?lastEdited=1684164477&w=1024&h=1024&f=webp',
      descricao: 'O que dissestes?'
    ),
    Item(
        id: 2,
        nome: 'El Macho',
        preco: 1299.99,
        imageUrl: 'https://media.licdn.com/dms/image/v2/D4D03AQG-0aOF2u-3Dw/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1686065915974?e=2147483647&v=beta&t=kthOhxMtiFzyoYIzuCaK2JFKAUhtPBQea7ZONm4tGV4',
        descricao: 'macho macho'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Itens'),
      ),
      body: ListView.builder(
        itemCount: _itens.length,
        itemBuilder: (context, index){
          final item = _itens[index];
          return ItemListCard(
            item:item,
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Clicou no item: ${item.nome}')),
              );
            });
        },
      ),
    );
  }
}

