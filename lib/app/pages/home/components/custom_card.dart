import 'package:flutter/material.dart';
import 'package:prova_flutter/app/models/card_model.dart';

class CustomCard extends StatelessWidget {
  final CardModel cardModel;
  final String text;
  final VoidCallback onPressedDelete;
  final VoidCallback onPressedEdit;
  const CustomCard({super.key, required this.cardModel, required this.text, required this.onPressedDelete, required this.onPressedEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        children: [
          const Spacer(),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(
                onPressed: onPressedEdit,
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: onPressedDelete,
                icon: const Icon(Icons.delete),
              ),
            ],
          )
        ],
      ),
    );
  }
}
