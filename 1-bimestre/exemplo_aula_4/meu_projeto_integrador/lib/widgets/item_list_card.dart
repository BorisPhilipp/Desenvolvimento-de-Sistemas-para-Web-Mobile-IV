import 'package:flutter/material.dart';
import 'package:meu_projeto_integrador/models/item_model.dart';

class ItemListCard extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;

  const ItemListCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, //alinha no topo da linha
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item.imageUrl,
                  width: 90,
                  height: 90,

                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.nome,
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      'R\$ ${item.preco.toStringAsFixed(2)}',
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      item.descricao
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
