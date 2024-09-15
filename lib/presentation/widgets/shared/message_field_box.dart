import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValueSend;
  const MessageFieldBox({Key? key, required this.onValueSend})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: colors.primary,
        width: 2,
      ),
    );

    final inputDecoration = InputDecoration(
      hintText: 'Escribe un mensaje',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      /* border: outlineInputBorder,
        focusedBorder: outlineInputBorder, */
      suffixIcon: IconButton(
        onPressed: () {
          /* print(textController.value.text); */
          //! onValueSend() es una función que recibe un String y no retorna nada
          onValueSend(textController.value.text);
        },
        icon: const Icon(Icons.send),
      ),
    );

    return TextFormField(
      controller: textController,
      decoration: inputDecoration,
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onChanged: (value) {
        print(value);
      },
      onFieldSubmitted: (value) {
        /* print(value); */
        onValueSend(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
