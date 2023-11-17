import 'package:flutter/material.dart';

import '../../../controller/card_store.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.size,
    required TextEditingController textController,
    required CardStore cardStore,
  }) : _textController = textController, _cardStore = cardStore;

  final Size size;
  final TextEditingController _textController;
  final CardStore _cardStore;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * .9,
      child: TextField(
        controller: _textController,
        autofocus: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            label: const Center(
              child: Text(
                'Digite seu texto',
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            fillColor: Colors.white,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            contentPadding: const EdgeInsets.all(10)),
        textInputAction: TextInputAction.done,
        onSubmitted: (String value) {
          _cardStore.addCard(value);
          _textController.clear();
        },
      ),
    );
  }
}
