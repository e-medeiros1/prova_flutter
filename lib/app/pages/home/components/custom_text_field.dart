import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../../controller/card_store.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.size,
    required TextEditingController textController,
    required CardStore cardStore,
  })  : _textController = textController,
        _cardStore = cardStore;

  final Size size;
  final TextEditingController _textController;
  final CardStore _cardStore;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final FocusNode focusNode = FocusNode(canRequestFocus: true);
    return SizedBox(
      width: widget.size.width * .9,
      child: Form(
        key: formKey,
        child: TextFormField(
          controller: widget._textController,
          autofocus: true,
          focusNode: focusNode,
          validator: Validatorless.required('O campo senha é obrigatório'),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              errorStyle: const TextStyle(color: Colors.white),
              hintText: 'Digite seu texto',
              fillColor: Colors.white,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              contentPadding: const EdgeInsets.all(10)),
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (String value) {
            if (formKey.currentState != null &&
                formKey.currentState!.validate()) {
              widget._cardStore.addCard(value);
              widget._textController.clear();
            }
          },
        ),
      ),
    );
  }
}
